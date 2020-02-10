/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package survey;

import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Pattern;
import bean.Person;
import utilities.DBConnection;
import utilities.SimpleStringCipher;

/**
 *
 * @author abinaya
 */
public class BulkMailUtility {

    private Connection con, con1;
    private PreparedStatement pstmt, pstmt1, pstmt2, pstmt3;
    private ResultSet res, res1, res2, res3;
    SimpleStringCipher cipher = new SimpleStringCipher();
    private static String[] sendTo = null;
    private static String msg_test = null;
    private String logs = "\nDate bulk mail sent : " + (new Date());

    public String saveSurveyEmailTemplate(BulkMailLogs details) {
        int max_id = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                if (details.getBulkmail_id() == 0) {
                    pstmt = con.prepareStatement("select IFNULL(max(id),0) as maxid from bulk_mail_logs");
                    res = pstmt.executeQuery();
                    while (res.next()) {
                        max_id = res.getInt("maxid") + 1;
                    }

                    String query = "INSERT INTO `bulk_mail_logs` (`id`, `survey_id`, `workshop_id`, `status`, `count_of_participants`, `date`, `updated_by`, `mail_content`, `subject`, `cc`, `from`, `file_attachment_path`, `database_name`,`typeofmail`) VALUES (?, ?, ?, ?, ?, CURRENT_TIMESTAMP, ?, ?, ?, ?, ?, ?, ?, ?)";

                    pstmt = con.prepareStatement(query);
                    pstmt.setInt(1, max_id);
                    if (details.getSurvey_id() != null || details.getSurvey_id() != "") {
                        pstmt.setString(2, details.getSurvey_id());
                    } else {
                        pstmt.setString(2, "0");
                    }
                    pstmt.setString(3, details.getWorkshop_id());
                    pstmt.setString(4, details.getParticipant_status());
                    pstmt.setInt(5, 0);
                    pstmt.setInt(6, details.getUpdated_by());// updated by
                    pstmt.setString(7, details.getMail_content());
                    pstmt.setString(8, details.getSubject());
                    pstmt.setString(9, details.getCc());
                    pstmt.setString(10, details.getFrom());
                    pstmt.setString(11, details.getAttachment());
                    pstmt.setString(12, details.getDatabase_name());
                    pstmt.setInt(13, details.getTypeofmail());

                    pstmt.execute();

                } else {
                    max_id = details.getBulkmail_id();

                    String query = "UPDATE `bulk_mail_logs` SET `survey_id`= ?,`workshop_id`=?,`status`=?,`count_of_participants`=?,`date`= CURRENT_TIMESTAMP ,`updated_by`=?,`mail_content`=?,`subject`=?,`cc`=?,`from`=?,`file_attachment_path`=?, `database_name`=?, `typeofmail`=?  WHERE id=?";

                    pstmt = con.prepareStatement(query);
                    if (details.getSurvey_id() != null || details.getSurvey_id() != "") {
                        pstmt.setString(1, details.getSurvey_id());
                    } else {
                        pstmt.setString(1, "0");
                    }
                    pstmt.setString(2, details.getWorkshop_id());
                    pstmt.setString(3, details.getParticipant_status());
                    pstmt.setInt(4, 0);
                    pstmt.setInt(5, details.getUpdated_by());// updated by
                    pstmt.setString(6, details.getMail_content());
                    pstmt.setString(7, details.getSubject());
                    pstmt.setString(8, details.getCc());
                    pstmt.setString(9, details.getFrom());
                    pstmt.setString(10, details.getAttachment());
                    pstmt.setString(11, details.getDatabase_name());
                    pstmt.setInt(12, details.getTypeofmail());
                    pstmt.setInt(13, details.getBulkmail_id());
                    pstmt.executeUpdate();
                }
                if (con1 == null || con1.isClosed()) {
                    con1 = DBConnection.getDBConnection(details.getDatabase_name());
                }
                if (con1 != null) {

                    if (details.getSurvey_id() != null || details.getSurvey_id() != "" || !details.getStart_date().equals("undefined") || !details.getEnd_date().equals("undefined")) {
                        pstmt1 = con1.prepareStatement("update survey_index set start_date=? , end_date=? where survey_id=? ");
                        pstmt1.setString(1, details.getStart_date());
                        pstmt1.setString(2, details.getEnd_date());
                        pstmt1.setString(3, details.getSurvey_id());
                        pstmt1.executeUpdate();
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closePStatement(pstmt1);
            DBConnection.closeDBConnection(con1);
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return Integer.toString(max_id);
    }

    public String sendBulkMail(int bulkmail_id, String contextPath, String server_type, String uri) {

        String result = "";
        BulkMailUtility bu = new BulkMailUtility();
        ArrayList<Person> person_list = new ArrayList<Person>();
        ArrayList<Person> person_list2 = new ArrayList<Person>();

        try {
            BulkMailLogs bl = bu.getBulkMailData(bulkmail_id);
            person_list = bu.getEmailList(bl);

            if (person_list == null) {
                System.out.println("email list is null");
            }
            // write logs
            String log_file_name = contextPath + "bulk_mail_attachments/logs/" + "logs_" + bulkmail_id + ".txt";
            try {
                File file = new File(log_file_name);
                if (file.createNewFile()) {
                    System.out.println("File is created!");
                } else {
                    System.out.println("File already exists.");
                }
                if (file.exists() && !file.isDirectory()) {
                    FileWriter fw = new FileWriter(log_file_name, true); //the true will append the new data
                    fw.write(logs);//appends the string to the file
                    fw.write("attachment  if any : " + bl.getAttachment());
                    fw.write("Subject : " + bl.getSubject() + "\n");

                    fw.write("Count of users : " + person_list.size());
                    fw.close();
                }
            } catch (Exception ex) {
                Logger.getLogger(BulkMailUtility.class.getName()).log(Level.SEVERE, null, ex);
            }
            String survey_link = "";
            if (bl.getTypeofmail() == 1) {
                int resultUpdate = 0;
                String sid = cipher.encrypt(bl.getSurvey_id());
                Person per2 = null;
                for (int plist = 0; plist < person_list.size(); plist++) {
                    per2 = new Person();
                    per2.setBulkmail_templateid(bulkmail_id);
                    per2.setSurveyid(Integer.parseInt(bl.getSurvey_id()));
                    per2.setEmail(person_list.get(plist).getEmail());
                    resultUpdate = insertUserToSurveyLog1(per2);
                }

                person_list2 = getEmailListFromSurveyLog(bl);

                if (server_type.equals("localhost")) {
                    survey_link = uri + "/survey/displaySQ.html?sid=" + sid + "&pid=";
                } else if (server_type.equals("test")) {
                     survey_link = "http://10.129.50.220:8080/survey/" + "displaySQ.html?sid=" + sid + "&pid=";
                } else if (server_type.equals("main")) {
                    //  survey_link = "http://www.it.iitb.ac.in/survey/" + "displaySQ.html?sid=" + sid + "&pid =";
                }
                /*
                 * if (bl.getDatabase_name().equals("csr")) {
                 *
                 * if (server_type.equals("localhost")) { survey_link = uri +
                 * "/CSR/displaySQ.html?sid=" + sid + "&pid="; } else if
                 * (server_type.equals("test")) { survey_link =
                 * "http://10.129.50.220:8080/CSR/" + "displaySQ.html?sid=" +
                 * sid + "&pid="; } else if (server_type.equals("main")) {
                 * survey_link = "http://www.it.iitb.ac.in/plc101x/" +
                 * "displaySQ.html?sid=" + sid + "&pid ="; }
                 *
                 * } else if (bl.getDatabase_name().equals("nmeict2014")) { if
                 * (server_type.equals("localhost")) { survey_link = uri +
                 * "/Nmeict/displaySQ.html?sid=" + sid + "&pid="; } else if
                 * (server_type.equals("test")) { survey_link =
                 * "http://10.129.50.220:8080/Nmeict/" + "displaySQ.html?sid=" +
                 * sid + "&pid="; } else if (server_type.equals("main")) {
                 * survey_link = "http://www.it.iitb.ac.in/nmeict/" +
                 * "displaySQ.html?sid=" + sid + "&pid ="; }
                }
                 */
            }
            int tmp_var = 0;
            int size = person_list.size();
            if (bl.getTypeofmail() == 1) {
                size = person_list2.size();
            }

            // put i < size instead of i <  1
            for (int i = 0; i < 1; i++) {
                if (tmp_var == 100) {
                    tmp_var = 0;
                    System.out.println("thread stopped for 30 seconds................................................................................................................................");
                    try {
                        Date sleep = new Date();
                        System.out.println("in loop for sleep id = " + i + " time now :" + sleep);
                        Thread.sleep(1000 * 30 * 1);                 //1000 milliseconds is one second.
                        Date wakeup = new Date();
                        System.out.println("wake up time :" + wakeup);
                    } catch (InterruptedException ex) {
                        Thread.currentThread().interrupt();
                    }
                }
                String emailOriginal = "";
                if (bl.getTypeofmail() == 1) {
                    emailOriginal = person_list2.get(i).getEmail();
                } else {
                    emailOriginal = person_list.get(i).getEmail();
                }
                
                if (emailOriginal.contains(",")) {
                    sendTo = new String[emailOriginal.split(",").length];
                    int j = 0;
                    for (String retval : emailOriginal.split(",")) {
                        sendTo[j] = retval;
                        j++;
                    }
                } else {
                    sendTo = new String[1];
                    sendTo[0] = emailOriginal;
                }

                msg_test = bl.getMail_content();
                msg_test = Pattern.compile("#email#").matcher(msg_test).replaceFirst(emailOriginal);

                if (bl.getTypeofmail() == 1) {
                    String pid = cipher.encrypt(Integer.toString(person_list2.get(i).getLoginId()));
                    msg_test = Pattern.compile("#link#").matcher(msg_test).replaceAll(survey_link + pid);
                }

                if (bl.getTypeofmail() == 1 || bl.getTypeofmail() == 2) {
                    //msg_test = Pattern.compile("#name#").matcher(msg_test).replaceFirst(person_list.get(i).getFirstName() + " " + person_list.get(i).getLastName());
                }


                try {
                    FileWriter fw = new FileWriter(log_file_name, true); //the true will append the new data
                    fw.write("\n\ntrying to send mail to: " + emailOriginal);//appends the string to the file
                    fw.write("\n" + msg_test);
                    fw.close();
                } catch (IOException e) {
                }

                String attachment = "";
                if (bl.getAttachment() != null) {
                    if (bl.getAttachment().length() != 0) {
                        attachment = contextPath + "bulk_mail_attachments/" + bl.getAttachment();
                    }
                }

                BulkMailSetUp util = new BulkMailSetUp();

                util.sendEmail(bl.getFrom(), sendTo, bl.getCc(), "", bl.getSubject(), msg_test, attachment, log_file_name);


                tmp_var++;
                try {
                    Thread.sleep(250 * 1 * 1); // sleep for 0.25 seconds after each mail              

                } catch (InterruptedException ex) {
                    Logger.getLogger(BulkMailUtility.class.getName()).log(Level.SEVERE, null, ex);
                }
                result = "1";
            }
        } catch (Exception ex) {
            Logger.getLogger(BulkMailUtility.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public BulkMailLogs getBulkMailData(int bulkmail_id) {
        BulkMailLogs bl = new BulkMailLogs();
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select * from bulk_mail_logs where id=?");
                pstmt.setInt(1, bulkmail_id);
                res = pstmt.executeQuery();
                bl = new BulkMailLogs();
                while (res.next()) {
                    bl.setSurvey_id(res.getString("survey_id"));
                    bl.setWorkshop_id(res.getString("workshop_id"));
                    bl.setFrom(res.getString("from"));
                    bl.setCc(res.getString("cc"));
                    bl.setMail_content(res.getString("mail_content"));
                    bl.setSubject(res.getString("subject"));
                    bl.setDatabase_name(res.getString("database_name"));
                    bl.setParticipant_status(res.getString("status"));
                    bl.setAttachment(res.getString("file_attachment_path"));
                    bl.setTypeofmail(res.getInt("typeofmail"));
                    bl.setParticipant_count(res.getInt("count_of_participants"));
                    bl.setBulkmail_id(bulkmail_id);
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(BulkMailUtility.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return bl;
    }

    public ArrayList<Person> getEmailList(BulkMailLogs bl) {
        ArrayList<Person> person_list = new ArrayList<Person>();
        try {
            if (bl.getTypeofmail() == 2 || bl.getTypeofmail() == 1) // type 1 is survey mail, type 2 is general participants
            {
                if (con == null || con.isClosed()) {
                    con = DBConnection.getDBConnection(bl.getDatabase_name());
                }
                if (con != null) {
                    String query = "";
                    //  for all workshops and all status - generally announcement emails

                    if (bl.getWorkshop_id().equals("all") && bl.getParticipant_status().equals("all")) {
                        query = "select distinct(idcontext) as id, email, IFNULL(per.firstname,'') as firstname, IFNULL(per.lastname,'') as lastname from context c, person per where per.personid=c.idcontext and email_verified = 1";
                        pstmt = con.prepareStatement(query);
                    }
                    // for all workshops - with distinct status given
                    if (bl.getWorkshop_id().equals("all") && !bl.getParticipant_status().equals("all")) {

                        String Status = bl.getParticipant_status();
                        Status = "\"" + Status.replaceAll(",", "\",\"") + "\"";
                        query = "select distinct(c.idcontext) as id, c.email, IFNULL(per.firstname,'') as firstname, IFNULL(per.lastname,'') as lastname from context c, participant p, person per where per.personid=c.idcontext and p.contextid=c.idcontext and p.status IN (" + Status + ") ";
                        pstmt = con.prepareStatement(query);

                    }
                    // for given workshop - with all status 
                    if (!bl.getWorkshop_id().equals("all") && bl.getParticipant_status().equals("all")) {
                        query = "select distinct(c.idcontext) as id, c.email, IFNULL(per.firstname,'') as firstname, IFNULL(per.lastname,'') as lastname from context c, participant p, accomodation a, person per where per.personid=c.idcontext and p.contextid=c.idcontext and a.participantid=p.participantid and a.workshopid IN (" + bl.getWorkshop_id() + ") ";
                        pstmt = con.prepareStatement(query);

                    }
                    // for all workshops - with distinct status given
                    if (!bl.getWorkshop_id().equals("all") && !bl.getParticipant_status().equals("all")) {
                        String Status = bl.getParticipant_status();
                        Status = "\"" + Status.replaceAll(",", "\",\"") + "\"";
                        query = "select distinct(c.idcontext) as id, c.email, IFNULL(per.firstname,'') as firstname, IFNULL(per.lastname,'') as lastname from context c, participant p, accomodation a, person per where per.personid=c.idcontext and p.contextid=c.idcontext and a.participantid=p.participantid and p.status IN (" + Status + ") and a.workshopid IN (" + bl.getWorkshop_id() + ") ";
                        pstmt = con.prepareStatement(query);
                    }
                    res = pstmt.executeQuery();
                    person_list = new ArrayList<Person>();
                    while (res.next()) {
                        Person person = new Person();
                        person.setEmail(res.getString("email"));
                        person.setLoginId(res.getInt("id"));
                        person.setFirstName(res.getString("firstname"));
                        person.setLastName(res.getString("lastname"));
                        person_list.add(person);
                    }
                }
            }
            if (bl.getTypeofmail() == 3 || bl.getTypeofmail() == 4) {
                if (con == null || con.isClosed()) {
                    con = DBConnection.getDBConnection(bl.getDatabase_name());
                }
                if (con != null) {
                    String query = "";
                    if (bl.getTypeofmail() == 3) {
                        query = "select distinct(email) as email from remotecenter";
                    }
                    if (bl.getTypeofmail() == 4) {
                        query = "select distinct(heademail) as email from academic where isActive=1 or isActive=0";
                    }
                    pstmt = con.prepareStatement(query);
                    res = pstmt.executeQuery();
                    person_list = new ArrayList<Person>();
                    while (res.next()) {
                        Person person = new Person();
                        person.setEmail(res.getString("email"));
                        person_list.add(person);
                    }
                }
            }
            try {
                con1 = DBConnection.getDBConnection();
                pstmt = con1.prepareStatement("update bulk_mail_logs set count_of_participants=? where id=?");
                pstmt.setInt(1, person_list.size());
                pstmt.setInt(2, bl.getBulkmail_id());
                pstmt.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con1);
            DBConnection.closeDBConnection(con);
        }
        return person_list;
    }

    public String sendTestBulkMail(int bulkmail_id, String contextPath, String server_type, String uri, String test_email) {

        String result = "0";
        BulkMailUtility bu = new BulkMailUtility();
        ArrayList<Person> person_list = new ArrayList<Person>();

        try {

            BulkMailLogs bl = bu.getBulkMailData(bulkmail_id);
            // write logs
            String log_file_name = contextPath + "bulk_mail_attachments/logs/" + "logs_test" + bulkmail_id + ".txt";
            try {
                File file = new File(log_file_name);
                if (file.createNewFile()) {
                    System.out.println("File is created!");
                } else {
                    System.out.println("File already exists.");
                }

                if (file.exists() && !file.isDirectory()) {
                    FileWriter fw = new FileWriter(log_file_name, true); //the true will append the new data
                    fw.write(logs);//appends the string to the file
                    fw.write("attachment  if any : " + bl.getAttachment());
                    fw.close();
                }
            } catch (Exception ex) {
                Logger.getLogger(BulkMailUtility.class.getName()).log(Level.SEVERE, null, ex);
            }

            String survey_link = "";
            if (bl.getTypeofmail() == 1) {

                String sid = cipher.encrypt(bl.getSurvey_id());
                if (bl.getDatabase_name().equals("csr")) {

                    if (server_type.equals("localhost")) {
                        survey_link = uri + "/CSR/displaySQ.html?sid=" + sid + "&pid=";
                    } else if (server_type.equals("test")) {
                        survey_link = "http://10.129.50.220:8080/CSR/" + "displaySQ.html?sid=" + sid + "&pid=";
                    } else if (server_type.equals("main")) {
                        survey_link = "http://www.it.iitb.ac.in/plc101x/" + "displaySQ.html?sid=" + sid + "&pid =";
                    }

                } else if (bl.getDatabase_name().equals("nmeict2014")) {
                    if (server_type.equals("localhost")) {
                        survey_link = uri + "/Nmeict/displaySQ.html?sid=" + sid + "&pid=";
                    } else if (server_type.equals("test")) {
                        survey_link = "http://10.129.50.220:8080/Nmeict/" + "displaySQ.html?sid=" + sid + "&pid=";
                    } else if (server_type.equals("main")) {
                        survey_link = "http://www.it.iitb.ac.in/nmeict/" + "displaySQ.html?sid=" + sid + "&pid =";
                    }
                }
            }

            String[] sendTo = new String[1];
            sendTo[0] = test_email;

            msg_test = bl.getMail_content();

            if (bl.getTypeofmail() == 1) {
                String pid = "person id ";
                msg_test = Pattern.compile("#link#").matcher(msg_test).replaceAll(survey_link + pid);
            }


            try {
                FileWriter fw = new FileWriter(log_file_name, true); //the true will append the new data
                fw.write("\n\ntrying to send mail to: " + test_email);//appends the string to the file
                fw.write("\n" + msg_test);
                fw.close();
            } catch (IOException e) {
            }

            String attachment = "";
            if (bl.getAttachment() != null) {
                if (bl.getAttachment().length() != 0) {
                    attachment = contextPath + "bulk_mail_attachments/" + bl.getAttachment();
                }
            }

            BulkMailSetUp util = new BulkMailSetUp();

            util.sendEmail(bl.getFrom(), sendTo, bl.getCc(), "", bl.getSubject(), msg_test, attachment, log_file_name);

            result = "1";


            // below is to write logs of participants who the mail will be sent and mail content will be logged.
            person_list = bu.getEmailList_test(bl);

            // write logs
            String log_file_name1 = contextPath + "bulk_mail_attachments/logs/" + "test_participant_log_" + bulkmail_id + ".txt";
            try {
                File file = new File(log_file_name1);
                if (file.createNewFile()) {
                    System.out.println("File is created!");
                } else {
                    System.out.println("File already exists.");
                }

                if (file.exists() && !file.isDirectory()) {
                    FileWriter fw = new FileWriter(log_file_name1, false); //the false will not rewrite on old data.
                    fw.write(logs + "\n");//appends the string to the file
                    fw.write("attachment  if any : " + bl.getAttachment() + "\n");
                    fw.write("Subject : " + bl.getSubject() + "\n");

                    fw.write("Count of users : " + person_list.size());
                    fw.close();
                }
            } catch (Exception ex) {
                Logger.getLogger(BulkMailUtility.class.getName()).log(Level.SEVERE, null, ex);
            }

            survey_link = "";
            if (bl.getTypeofmail() == 1) {

                String sid = cipher.encrypt(bl.getSurvey_id());
                if (bl.getDatabase_name().equals("csr")) {

                    if (server_type.equals("localhost")) {
                        survey_link = uri + "/CSR/displaySQ.html?sid=" + sid + "&pid=";
                    } else if (server_type.equals("test")) {
                        survey_link = "http://10.129.50.220:8080/CSR/" + "displaySQ.html?sid=" + sid + "&pid=";
                    } else if (server_type.equals("main")) {
                        survey_link = "http://www.it.iitb.ac.in/plc101x/" + "displaySQ.html?sid=" + sid + "&pid =";
                    }

                } else if (bl.getDatabase_name().equals("nmeict2014")) {
                    if (server_type.equals("localhost")) {
                        survey_link = uri + "/Nmeict/displaySQ.html?sid=" + sid + "&pid=";
                    } else if (server_type.equals("test")) {
                        survey_link = "http://10.129.50.220:8080/Nmeict/" + "displaySQ.html?sid=" + sid + "&pid=";
                    } else if (server_type.equals("main")) {
                        survey_link = "http://www.it.iitb.ac.in/nmeict/" + "displaySQ.html?sid=" + sid + "&pid =";
                    }
                }
            }

            for (int i = 0; i < person_list.size(); i++) {

                String emailOriginal = person_list.get(i).getEmail();
                if (emailOriginal.contains(",")) {
                    sendTo = new String[emailOriginal.split(",").length];
                    int j = 0;
                    for (String retval : emailOriginal.split(",")) {
                        sendTo[j] = retval;
                        j++;
                    }
                } else {
                    sendTo = new String[1];
                    sendTo[0] = emailOriginal;
                }

                msg_test = bl.getMail_content();
                msg_test = Pattern.compile("#email#").matcher(msg_test).replaceFirst(emailOriginal);

                if (bl.getTypeofmail() == 1) {
                    String pid = cipher.encrypt(Integer.toString(person_list.get(i).getLoginId()));
                    msg_test = Pattern.compile("#link#").matcher(msg_test).replaceAll(survey_link + pid);
                }

                if (bl.getTypeofmail() == 1 || bl.getTypeofmail() == 2) {
                    msg_test = Pattern.compile("#name#").matcher(msg_test).replaceFirst(person_list.get(i).getFirstName() + " " + person_list.get(i).getLastName());
                }


                try {
                    FileWriter fw = new FileWriter(log_file_name1, true); //the true will append the new data
                    fw.write("\n\n mail will be sent to: " + emailOriginal);//appends the string to the file
                    fw.write("\n" + msg_test);
                    fw.close();
                } catch (IOException e) {
                }

                // logging of participants ends here.. 
                result = "1";

            }
        } catch (Exception ex) {
            Logger.getLogger(BulkMailUtility.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public ArrayList<BulkMailLogs> listAllBulkMailLogs() {
        ArrayList<BulkMailLogs> logs_list = new ArrayList<BulkMailLogs>();
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                //pstmt = con.prepareStatement("select * from bulk_mail_logs");
                pstmt = con.prepareStatement("select id,survey_id,workshop_id,status,count_of_participants,DATE_FORMAT(date,'%d %b %y %h:%i %p') as date,updated_by,mail_content,subject,cc,file_attachment_path,database_name,typeofmail,`from` from bulk_mail_logs");
                res = pstmt.executeQuery();
                BulkMailLogs list = null;
                while (res.next()) {
                    list = new BulkMailLogs();
                    list.setSurvey_id(res.getString("survey_id"));
                    list.setWorkshop_id(res.getString("workshop_id"));
                    list.setFrom(res.getString("from"));
                    list.setCc(res.getString("cc"));
                    list.setMail_content(res.getString("mail_content"));
                    list.setSubject(res.getString("subject"));
                    list.setDatabase_name(res.getString("database_name"));
                    list.setParticipant_status(res.getString("status"));
                    list.setAttachment(res.getString("file_attachment_path"));
                    list.setTypeofmail(res.getInt("typeofmail"));
                    list.setBulkmail_id(res.getInt("id"));
                    list.setParticipant_count(res.getInt("count_of_participants"));
                    list.setUpdated_date(res.getString("date"));
                    logs_list.add(list);
                }
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return logs_list;
    }

    public ArrayList<Person> getEmailList_test(BulkMailLogs bl) {
        ArrayList<Person> person_list = new ArrayList<Person>();
        try {
            if (bl.getTypeofmail() == 2 || bl.getTypeofmail() == 1) // type 1 is survey mail, type 2 is general participants
            {
                if (con == null || con.isClosed()) {
                    con = DBConnection.getDBConnection(bl.getDatabase_name());
                }
                if (con != null) {
                    // for generic mails like reminder, announcements
                    String query = "";
                    //  for all workshops and all status - generally announcement emails

                    if (bl.getWorkshop_id().equals("all") && bl.getParticipant_status().equals("all")) {
                        query = "select distinct(idcontext) as id, email, IFNULL(per.firstname,'') as firstname, IFNULL(per.lastname,'') as lastname from context c, person per where per.personid=c.idcontext and email_verified = 1";
                        pstmt = con.prepareStatement(query);
                    }
                    // for all workshops - with distinct status given
                    if (bl.getWorkshop_id().equals("all") && !bl.getParticipant_status().equals("all")) {

                        String Status = bl.getParticipant_status();
                        Status = "\"" + Status.replaceAll(",", "\",\"") + "\"";
                        query = "select distinct(c.idcontext) as id, c.email, IFNULL(per.firstname,'') as firstname, IFNULL(per.lastname,'') as lastname from context c, participant p, person per where per.personid=c.idcontext and p.contextid=c.idcontext and p.status IN (" + Status + ") ";
                        pstmt = con.prepareStatement(query);

                    }
                    // for given workshop - with all status 
                    if (!bl.getWorkshop_id().equals("all") && bl.getParticipant_status().equals("all")) {
                        query = "select distinct(c.idcontext) as id, c.email, IFNULL(per.firstname,'') as firstname, IFNULL(per.lastname,'') as lastname from context c, participant p, accomodation a, person per where per.personid=c.idcontext and p.contextid=c.idcontext and a.participantid=p.participantid and a.workshopid IN (" + bl.getWorkshop_id() + ") ";
                        pstmt = con.prepareStatement(query);

                    }
                    // for all workshops - with distinct status given
                    if (!bl.getWorkshop_id().equals("all") && !bl.getParticipant_status().equals("all")) {
                        String Status = bl.getParticipant_status();
                        Status = "\"" + Status.replaceAll(",", "\",\"") + "\"";
                        query = "select distinct(c.idcontext) as id, c.email, IFNULL(per.firstname,'') as firstname, IFNULL(per.lastname,'') as lastname from context c, participant p, accomodation a, person per where per.personid=c.idcontext and p.contextid=c.idcontext and a.participantid=p.participantid and p.status IN (" + Status + ") and a.workshopid IN (" + bl.getWorkshop_id() + ") ";
                        pstmt = con.prepareStatement(query);
                    }
                    res = pstmt.executeQuery();


                    person_list = new ArrayList<Person>();
                    while (res.next()) {
                        Person person = new Person();
                        person.setEmail(res.getString("email"));
                        person.setLoginId(res.getInt("id"));
                        person.setFirstName(res.getString("firstname"));
                        person.setLastName(res.getString("lastname"));
                        person_list.add(person);
                    }
                }
            }
            if (bl.getTypeofmail() == 3 || bl.getTypeofmail() == 4) {
                if (con == null || con.isClosed()) {
                    con = DBConnection.getDBConnection(bl.getDatabase_name());
                }
                if (con != null) {

                    String query = "";

                    if (bl.getTypeofmail() == 3) {
                        query = "select distinct(email) as email from remotecenter";
                    }
                    if (bl.getTypeofmail() == 4) {
                        query = "select distinct(heademail) as email from academic where isActive=1 or isActive=0";
                    }
                    pstmt = con.prepareStatement(query);
                    res = pstmt.executeQuery();
                    person_list = new ArrayList<Person>();
                    while (res.next()) {
                        Person person = new Person();
                        person.setEmail(res.getString("email"));
                        person_list.add(person);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con1);
            DBConnection.closeDBConnection(con);
        }
        return person_list;
    }

    public String saveAnonymousUserMailTemplate(BulkMailLogs details) {
        int max_id = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                if (details.getBulkmail_id() == 0) {
                    pstmt = con.prepareStatement("select IFNULL(max(id),0) as maxid from bulk_mail_logs");
                    res = pstmt.executeQuery();
                    while (res.next()) {
                        max_id = res.getInt("maxid") + 1;
                    }

                    String query = "INSERT INTO `bulk_mail_logs` (`id`, `survey_id`, `workshop_id`, `status`, `count_of_participants`, `date`, `updated_by`, `mail_content`, `subject`, `cc`, `from`, `file_attachment_path`, `database_name`,`typeofmail`) VALUES (?, ?, ?, ?, ?, CURRENT_TIMESTAMP, ?, ?, ?, ?, ?, ?, ?, ?)";

                    pstmt = con.prepareStatement(query);
                    pstmt.setInt(1, max_id);
                    if (details.getSurvey_id() != null || details.getSurvey_id() != "") {
                        pstmt.setString(2, details.getSurvey_id());
                    } else {
                        pstmt.setString(2, "0");
                    }
                    pstmt.setString(3, details.getWorkshop_id());
                    pstmt.setString(4, details.getParticipant_status());
                    pstmt.setInt(5, 0);
                    pstmt.setInt(6, details.getUpdated_by());// updated by
                    pstmt.setString(7, details.getMail_content());
                    pstmt.setString(8, details.getSubject());
                    pstmt.setString(9, details.getCc());
                    pstmt.setString(10, details.getFrom());
                    //pstmt.setString(11, details.getAttachment());
                    if (details.getAttachment() != null) {
                        String ext = "";
                        ext = ext = details.getAttachment().substring(details.getAttachment().lastIndexOf(".") + 1);
                        pstmt.setString(11, "bulk_mail_template_" + max_id + "." + ext);
                    } else {
                        pstmt.setString(11, details.getAttachment());
                    }

                    pstmt.setString(12, details.getDatabase_name());
                    pstmt.setInt(13, details.getTypeofmail());

                    pstmt.execute();

                } else {
                    max_id = details.getBulkmail_id();

                    String query = "UPDATE `bulk_mail_logs` SET `survey_id`= ?,`workshop_id`=?,`status`=?,`count_of_participants`=?,`date`= CURRENT_TIMESTAMP ,`updated_by`=?,`mail_content`=?,`subject`=?,`cc`=?,`from`=?,`file_attachment_path`=?, `database_name`=?, `typeofmail`=?  WHERE id=?";

                    pstmt = con.prepareStatement(query);
                    if (details.getSurvey_id() != null || details.getSurvey_id() != "") {
                        pstmt.setString(1, details.getSurvey_id());
                    } else {
                        pstmt.setString(1, "0");
                    }
                    pstmt.setString(2, details.getWorkshop_id());
                    pstmt.setString(3, details.getParticipant_status());
                    pstmt.setInt(4, 0);
                    pstmt.setInt(5, details.getUpdated_by());// updated by
                    pstmt.setString(6, details.getMail_content());
                    pstmt.setString(7, details.getSubject());
                    pstmt.setString(8, details.getCc());
                    pstmt.setString(9, details.getFrom());
                    if (details.getAttachment() != null) {
                        String ext = "";
                        ext = ext = details.getAttachment().substring(details.getAttachment().lastIndexOf(".") + 1);
                        pstmt.setString(10, "bulk_mail_template_" + details.getBulkmail_id() + "." + ext);
                    } else {
                        pstmt.setString(10, details.getAttachment());
                    }
                    //pstmt.setString(10, details.getAttachment());
                    pstmt.setString(11, details.getDatabase_name());
                    pstmt.setInt(12, details.getTypeofmail());
                    pstmt.setInt(13, details.getBulkmail_id());
                    pstmt.executeUpdate();
                }
                if (con1 == null || con1.isClosed()) {
                    con1 = DBConnection.getDBConnection(details.getDatabase_name());
                }
                if (con1 != null) {

                    if (details.getSurvey_id() != null || details.getSurvey_id() != "" || !details.getStart_date().equals("undefined") || !details.getEnd_date().equals("undefined")) {
                        pstmt1 = con1.prepareStatement("update survey_index set start_date=? , end_date=? where survey_id=? ");
                        pstmt1.setString(1, details.getStart_date());
                        pstmt1.setString(2, details.getEnd_date());
                        pstmt1.setString(3, details.getSurvey_id());
                        pstmt1.executeUpdate();
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closePStatement(pstmt1);
            DBConnection.closeDBConnection(con1);
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return Integer.toString(max_id);
    }

    public int insertUserToSurveyLog1(Person person) {
        int res_update = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("insert into survey_log(survey_id,bulk_mail_template_id,email,if_filled_survey) values(?,?,?,0)");
                pstmt.setInt(1, person.getSurveyid());
                pstmt.setInt(2, person.getBulkmail_templateid());
                pstmt.setString(3, person.getEmail());
                res_update = pstmt.executeUpdate();

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closePStatement(pstmt);
            DBConnection.closeResultSet(res);
            DBConnection.closeDBConnection(con);
        }
        return res_update;
    }

    public ArrayList<Person> getEmailListFromSurveyLog(BulkMailLogs bl) {
        ArrayList<Person> person_list = new ArrayList<Person>();
        try {
            if (bl.getTypeofmail() == 1) // type 1 is survey mail, type 2 is general participants
            {
                if (con == null || con.isClosed()) {
                    con = DBConnection.getDBConnection();
                }
                if (con != null) {
                    String query = "";
                    //  for all workshops and all status - generally announcement emails
                    if (bl.getTypeofmail() == 1) {
                        query = "select email,id from survey_log where bulk_mail_template_id=? and survey_id=?";
                        pstmt = con.prepareStatement(query);
                        pstmt.setInt(1, bl.getBulkmail_id());
                        pstmt.setString(2, bl.getSurvey_id());
                    }

                    res = pstmt.executeQuery();
                    person_list = new ArrayList<Person>();
                    while (res.next()) {
                        Person person = new Person();
                        person.setEmail(res.getString("email"));
                        person.setLoginId(res.getInt("id"));
                        //person.setFirstName(res.getString("firstname"));
                        // person.setLastName(res.getString("lastname"));
                        person_list.add(person);
                    }
                }
            }

            try {
                con1 = DBConnection.getDBConnection();
                pstmt = con1.prepareStatement("update bulk_mail_logs set count_of_participants=? where id=?");
                pstmt.setInt(1, person_list.size());
                pstmt.setInt(2, bl.getBulkmail_id());
                pstmt.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con1);
            DBConnection.closeDBConnection(con);
        }
        return person_list;
    }
}
