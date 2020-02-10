/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package survey;

import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.regex.Pattern;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import bean.Person;
import nl.bitwalker.useragentutils.Browser;
import nl.bitwalker.useragentutils.OperatingSystem;
import nl.bitwalker.useragentutils.UserAgent;
//import org.nmeict.process.UtilityProcess;
import utilities.EmailUtil;
import utilities.HtmlUtility;
import utilities.SimpleStringCipher;
import utilities.Utility;
import utilities.Validate;

/**
 *
 * @author abinaya
 */
public class DisplayQuestionAction extends ActionSupport {

    private SurveyAnswersBean sb;
    private String personid = null;
    private String sid_enc = null;
    private String pid_enc = null;
    private SurveyIndexBean surveydata;

    @Override
    public String execute() throws Exception {
        /*
         * Getting user session object
         */
        HttpSession session = ServletActionContext.getRequest().getSession();
//        Person person = (Person) session.getAttribute(Utility.USER_HANDLE);

        /**
         * getting the parameters from 'url'
         */
        try {

            SimpleStringCipher cipher = new SimpleStringCipher();
            String survey_id_enc = ServletActionContext.getRequest().getParameter("sid");

            String sid = cipher.decrypt(survey_id_enc);


            String pid_enc = ServletActionContext.getRequest().getParameter("pid");

            String pid = cipher.decrypt(pid_enc);
            setPersonid(pid);
            SurveyUtility s_utility = new SurveyUtility();
            /*
             * check valid user link
             */
            int res_verifylink = 0;
            res_verifylink = s_utility.check_VerifyUserLink(sid, pid);
            if (res_verifylink > 0) {
                /*
                   save visitor
                 */
                  try{
                        String ipAddress = ServletActionContext.getRequest().getHeader("X-FORWARDED-FOR");
                        if (ipAddress == null) {
                            ipAddress = ServletActionContext.getRequest().getRemoteAddr();
                        }
                        String userAgentString = ServletActionContext.getRequest().getHeader("User-Agent");
                        UserAgent userAgent = UserAgent.parseUserAgentString(userAgentString);
                        OperatingSystem os = userAgent.getOperatingSystem();
                        Browser browser = userAgent.getBrowser();
                        int visitor=s_utility.insert_VistorLog(ipAddress, browser.getName(), os.getName(), pid);
                  }catch(Exception e){
                     System.out.println("exception in saving visitor");
                  } 
                
                /*
                 * check if person has already filled survey form
                 */
                //int var = s_utility.checkIfPersonFilledSurvey(sid, pid);
                int var = s_utility.checkIfPersonFilledSurvey(sid, String.valueOf(res_verifylink));
                if (var > 0) {
                    surveydata=s_utility.getSurveyDetails(sid);
                    return Utility.ALREADY_REGISTERED;
                }
                int check_dates = s_utility.checkSurveyDate(sid);
                if (check_dates == 0) {
                    return Utility.ERROR;
                } else {
                    setSb(s_utility.listSurveyQuestions(sid));
                    setPid_enc(pid_enc);
                    setSid_enc(survey_id_enc);
                    return Utility.SUCCESS;
                }
            } else {
                return Utility.ERROR;
            }



        } catch (Exception e) {
            System.out.println(e.getMessage());
            return Utility.ERROR;

        }
    }

    public String generateLinksForTesting() throws Exception {
        HttpSession session = ServletActionContext.getRequest().getSession();
        Person person = (Person) session.getAttribute(Utility.USER_HANDLE);
        try {
            if (person == null) {
                return Utility.LOGIN_FAILURE;
            } else {
                // 
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Utility.SUCCESS;
    }

    /*
     * public String sendLinks() throws Exception {
     *
     * try { SimpleStringCipher cipher = new SimpleStringCipher(); String
     * survey_id_enc = ServletActionContext.getRequest().getParameter("sid");
     *
     * String sid = cipher.decrypt(survey_id_enc); UtilityProcess up = new
     * UtilityProcess();
     *
     * ArrayList<Person> plist = up.listParticipants("500000", "all",
     * "Confirmed");
     *
     * String fileName = "reminder_survey_mail_500000" + ".html"; String
     * contextPath = ServletActionContext.getServletContext().getRealPath("");
     * String filePath = contextPath + "/" + "mail-template"; String subject =
     * "Gentle Reminder : Survey form for \"College to Corporate Programme\"";
     * String emailMessage = HtmlUtility.read(filePath, fileName);
     *
     * for (int i = 0; i < plist.size(); i++) { try { String message =
     * emailMessage; //get the file name of the confirm email of this workshop
     * String pid_enc =
     * SimpleStringCipher.encrypt(Integer.toString(plist.get(i).getLoginId()));
     * message =
     * Pattern.compile("#name#").matcher(message).replaceFirst(plist.get(i).getFirstName()
     * + " " + plist.get(i).getLastName()); message =
     * Pattern.compile("#link#").matcher(message).replaceAll("http://www.it.iitb.ac.in/plc101x/displaySQ.html?sid="
     * + survey_id_enc + "&pid=" + pid_enc); EmailUtil mail = new EmailUtil();
     * mail.sendEmail("eoutreach@it.iitb.ac.in", plist.get(i).getEmail(),
     * "eoutreach@it.iitb.ac.in", "", subject, message); Thread.sleep(250 * 1 *
     * 1); // sleep of 25 seconds } catch (Exception e) { e.printStackTrace(); }
     *
     * }
     *
     * } catch (Exception e) { e.printStackTrace(); } return Utility.SUCCESS;
    }
     */
//    }
    /**
     * @return the sb
     */
    public SurveyAnswersBean getSb() {
        return sb;
    }

    /**
     * @param sb the sb to set
     */
    public void setSb(SurveyAnswersBean sb) {
        this.sb = sb;
    }

    /**
     * @return the personid
     */
    public String getPersonid() {
        return personid;
    }

    /**
     * @param personid the personid to set
     */
    public void setPersonid(String personid) {
        this.personid = personid;
    }

    /**
     * @return the sid_enc
     */
    public String getSid_enc() {
        return sid_enc;
    }

    /**
     * @param sid_enc the sid_enc to set
     */
    public void setSid_enc(String sid_enc) {
        this.sid_enc = sid_enc;
    }

    /**
     * @return the pid_enc
     */
    public String getPid_enc() {
        return pid_enc;
    }

    /**
     * @param pid_enc the pid_enc to set
     */
    public void setPid_enc(String pid_enc) {
        this.pid_enc = pid_enc;
    }

    /**
     * @return the surveydata
     */
    public SurveyIndexBean getSurveydata() {
        return surveydata;
    }

    /**
     * @param surveydata the surveydata to set
     */
    public void setSurveydata(SurveyIndexBean surveydata) {
        this.surveydata = surveydata;
    }
}
