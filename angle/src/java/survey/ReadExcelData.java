/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package survey;

import bean.Person;
import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import utilities.DBConnection;

/**
 *
 * @author dipesh
 */
public class ReadExcelData {

    Connection con = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    public int excuteReadExcelFunction(File file, String exfname, String exlfile, int loginid, int templateid, int bulkmailtype) {
        int res = 0;
        try {
            int inserRg = 0, noinsrRg = 0, inRes = 0;
            ArrayList cellStoreArrayList = null;
            ArrayList datasource = null;
            datasource = readexl(file, exfname);
            Person person = null;
            for (int i = 0; i < datasource.size(); i++) {
                person = new Person();
                cellStoreArrayList = (ArrayList) datasource.get(i);
                try {
                    person.setEmail(cellStoreArrayList.get(0).toString());
                    person.setBulkmail_templateid(templateid);
                    person.setBulkmailtype(bulkmailtype);
                    person.setLoginId(loginid);
                    person.setBulkemailfile(exfname);

                    inRes = fillNewData(person);
                    if (inRes > 0) {
                        inserRg++;
                    } else {
                        noinsrRg++;
                    }

                    if (inserRg > 0) {
                        res = 1;
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }

    public ArrayList readexl(File exfile, String exfilename) {
        ArrayList storvalues = new ArrayList();
        try {
            FileInputStream file = new FileInputStream(exfile);
            String name = exfilename;
            Workbook workbook = null;
            if (name.toLowerCase().endsWith("xlsx")) {
                workbook = new XSSFWorkbook(file);

            } else if (name.toLowerCase().endsWith("xls")) {
                workbook = new HSSFWorkbook(file);
            }

            DataFormatter fmt = new DataFormatter();
            for (int sn = 0; sn < workbook.getNumberOfSheets(); sn++) {
                Sheet sheet = workbook.getSheetAt(sn);
                for (int rn = sheet.getFirstRowNum() + 1; rn <= sheet.getLastRowNum(); rn++) {
                    Row row = sheet.getRow(rn);
                    if (row == null) {
                        // There is no data in this row, handle as needed
                    } else {
                        // Row "rn" has data
                        ArrayList storeval = new ArrayList();
                        for (int cn = 0; cn < 1; cn++) {
                            Cell cell = row.getCell(cn);
                            String val = "";
                            if (cell == null) {
                                // This cell is empty/blank/un-used, handle as needed
                            } else {
                                String cellStr = fmt.formatCellValue(cell);
                                val = cellStr;
                                // Do something with the value
                            }
                            storeval.add(val);
                        }
                        storvalues.add(storeval);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return storvalues;
    }

    public int fillNewData(Person per) {
        int res = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                stmt = con.prepareStatement("insert into partuserdata(email,status,filename,created_by,createdon,bulk_mail_template_id,bulk_mail_type) values(?,?,?,?,now(),?,?)");
                stmt.setString(1, isBlankValue(per.getEmail()));
                stmt.setString(2, "intial");
                stmt.setString(3, per.getBulkemailfile());
                stmt.setInt(4, per.getLoginId());
                stmt.setInt(5, per.getBulkmail_templateid());
                stmt.setInt(6, per.getBulkmailtype());
                res = stmt.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closePStatement(stmt);
            DBConnection.closeDBConnection(con);
        }
        return res;
    }

    public String isBlankValue(String value) {
        String val = null;
        try {
            if (value.trim() == "" || value.trim().length() == 0) {
                return val;
            } else {
                val = value;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return val;
    }

    public ArrayList<Person> getAllPartRegData(int fileid) {
        ArrayList<Person> partdata = new ArrayList<Person>();
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                stmt = con.prepareStatement("select userinterfaceid,email,status from partuserdata where bulk_mail_template_id=? ");
                stmt.setInt(1, fileid);
                rs = stmt.executeQuery();
                Person person = null;
                while (rs.next()) {
                    person = new Person();
                    person.setPer_user_id(rs.getInt("userinterfaceid"));
                    person.setEmail(rs.getString("email"));
                    person.setPer_userstatus(rs.getString("status"));
                    partdata.add(person);
                }
            }
        } catch (Exception e) {
        } finally {
            DBConnection.closePStatement(stmt);
            DBConnection.closeResultSet(rs);
            DBConnection.closeDBConnection(con);
        }
        return partdata;
    }

    public boolean isFieldEmpty(String field) {
        boolean result = true;
        try {
            if (field == null) {
                result = false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public static boolean validateEmail(String email) {
        boolean matchFound = false;
        if (email != null && !email.trim().isEmpty()) {
            //Set the email pattern string
            Pattern p = Pattern.compile("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
            //Match the given string with the pattern
            Matcher m = p.matcher(email);
            //check whether match is found
            matchFound = m.matches();
        }
        return matchFound;

    }

    public int invalidDataMessage(Person person) {
        int res = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                stmt = con.prepareStatement("update partuserdata set status=?,errormessage=? where userinterfaceid=?");
                stmt.setString(1, person.getPer_userstatus());
                stmt.setString(2, person.getPer_errormessage());
                stmt.setInt(3, person.getPer_user_id());
                res = stmt.executeUpdate();

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closePStatement(stmt);
            DBConnection.closeResultSet(rs);
            DBConnection.closeDBConnection(con);
        }
        return res;
    }

    public int validData(Person person) {
        int res = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                stmt = con.prepareStatement("update partuserdata set status=? where userinterfaceid=?");
                stmt.setString(1, person.getPer_userstatus());
                stmt.setInt(2, person.getPer_user_id());
                res = stmt.executeUpdate();

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closePStatement(stmt);
            DBConnection.closeResultSet(rs);
            DBConnection.closeDBConnection(con);
        }
        return res;
    }

    public int insertUserToSurveyLog(Person person) {
        int res = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                stmt = con.prepareStatement("insert into survey_log(survey_id,bulk_mail_template_id,email,if_filled_survey) values(?,?,?,0)");
                stmt.setInt(1, person.getSurveyid());
                stmt.setInt(2, person.getBulkmail_templateid());
                stmt.setString(3, person.getEmail());
                res = stmt.executeUpdate();

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closePStatement(stmt);
            DBConnection.closeResultSet(rs);
            DBConnection.closeDBConnection(con);
        }
        return res;
    }

    public ArrayList<Person> gelAllInvalidRecords(int bulkmail_id) {
        ArrayList<Person> partdata = new ArrayList<Person>();
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                stmt = con.prepareStatement("select email,errormessage from partuserdata where bulk_mail_template_id=? and status='error'");
                stmt.setInt(1, bulkmail_id);
                rs = stmt.executeQuery();
                Person person = null;
                while (rs.next()) {
                    person = new Person();
                    if (!isFieldEmpty(rs.getString("email"))) {
                        person.setEmail("");
                    } else if (isFieldEmpty(rs.getString("email"))) {
                        person.setEmail(rs.getString("email"));
                    }
                    if (!isFieldEmpty(rs.getString("errormessage"))) {
                        person.setPer_errormessage("");
                    } else if (isFieldEmpty(rs.getString("errormessage"))) {
                        person.setPer_errormessage(rs.getString("errormessage"));
                    }
                    partdata.add(person);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closePStatement(stmt);
            DBConnection.closeResultSet(rs);
            DBConnection.closeDBConnection(con);
        }
        return partdata;
    }
}
