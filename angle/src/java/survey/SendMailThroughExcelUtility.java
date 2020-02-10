/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package survey;

import bean.Person;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Pattern;
import utilities.DBConnection;
import utilities.SimpleStringCipher;

/**
 *
 * @author dipesh
 */
public class SendMailThroughExcelUtility {
    private Connection con, con1;
    private PreparedStatement pstmt, pstmt1, pstmt2, pstmt3;
    private ResultSet res, res1, res2, res3;
    SimpleStringCipher cipher = new SimpleStringCipher();
    private static String[] sendTo = null;
    private static String msg_test = null;
    private String logs = "\nDate bulk mail sent : " + (new Date());
    
    public String sendBulkMailToGenericUser(int bulkmail_id, String contextPath, String server_type, String uri) {

        String result = "";
        SendMailThroughExcelUtility utility=new SendMailThroughExcelUtility();
        //BulkMailUtility bu = new BulkMailUtility();
        ArrayList<Person> person_list = new ArrayList<Person>();

        try {
            BulkMailLogs bl = utility.getBulkMailData(bulkmail_id);
            person_list = utility.getEmailList(bl);
            
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
                Logger.getLogger(SendMailThroughExcelUtility.class.getName()).log(Level.SEVERE, null, ex);
            }
            String survey_link = "";
            if (bl.getTypeofmail() == 1) {
                String sid = cipher.encrypt(bl.getSurvey_id());
                if (bl.getDatabase_name().equals("survey")) {

                    if (server_type.equals("localhost")) {
                        survey_link = uri + "/survey/displaySQ.html?sid=" + sid + "&pid=";
                    } else if (server_type.equals("test")) {
                        survey_link = "http://10.129.50.220:8080/survey/" + "displaySQ.html?sid=" + sid + "&pid=";
                    } else if (server_type.equals("main")) {
                      //  survey_link = "http://www.it.iitb.ac.in/survey/" + "displaySQ.html?sid=" + sid + "&pid =";
                    }

                }
                /*if (bl.getDatabase_name().equals("csr")) {

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
                }*/
            }
            int tmp_var = 0;

            for (int i = 0; i < person_list.size(); i++) {
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
                    Logger.getLogger(SendMailThroughExcelUtility.class.getName()).log(Level.SEVERE, null, ex);
                }
                result = "1";
            }
        } catch (Exception ex) {
            Logger.getLogger(SendMailThroughExcelUtility.class.getName()).log(Level.SEVERE, null, ex);
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
                    bl.setFrom(res.getString("from"));
                    bl.setCc(res.getString("cc"));
                    bl.setMail_content(res.getString("mail_content"));
                    bl.setSubject(res.getString("subject"));
                    bl.setAttachment(res.getString("file_attachment_path"));
                    bl.setTypeofmail(res.getInt("typeofmail"));
                    bl.setParticipant_count(res.getInt("count_of_participants"));
                    bl.setDatabase_name(res.getString("database_name"));
                    bl.setBulkmail_id(bulkmail_id);
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(SendMailThroughExcelUtility.class.getName()).log(Level.SEVERE, null, ex);
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

                    if (bl.getTypeofmail() == 2 ) {
                        query= "select email,userinterfaceid as id from partuserdata where bulk_mail_template_id=? and status ='valid'";
                        pstmt = con.prepareStatement(query);
                        pstmt.setInt(1, bl.getBulkmail_id());
                    }
                    
                    if (bl.getTypeofmail() == 1 ) {
                        query= "select email,id from survey_log where bulk_mail_template_id=? and survey_id=?";
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
