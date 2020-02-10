/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package survey;

import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import bean.Person;
import bean.WorkshopContent;
import utilities.SimpleStringCipher;
import utilities.Utility;

/**
 *
 * @author dipesh
 */
public class CreateSurveyAction extends ActionSupport {

    private int surveyId;
    private ArrayList<SurveyQuestionTypesBean> questiontpyelist;
    private ArrayList<SurveyIndexBean> surveylist;
    private SurveyIndexBean surveydetails;
    private String encSurveyId;
    private ArrayList<SurveyQuestionIndexBean> questionslist;
    private static int maxSurveyId = 0;
    private SurveyAnswersBean sb;
    private SurveyAnswersBean surveyreports;
    private ArrayList<SurveyIndexBean> surveylist_nmeict;
    private ArrayList<String> participant_status;
    private int survey_already_fill;
    private ArrayList<WorkshopContent> workshops;
    private ArrayList<WorkshopContent> workshops_2;
    private BulkMailLogs bulkmaildetails;
    private int participantTotalCount;
    private ArrayList<BulkMailLogs> logs_details;
    private Person per;

    public String getNextSurveyId() {

        SurveyUtility utility = new SurveyUtility();
        HttpSession session = ServletActionContext.getRequest().getSession();
        Person person = (Person) session.getAttribute(Utility.USER_HANDLE);
        if (person == null) {
            //return Utility.LOGIN_FAILURE;
        } else {
            try {
//                if(maxSurveyId == 0) {
//                    surveyId = utility.getNextSurveyId();
//                    maxSurveyId = surveyId;
//                } else {
//                    maxSurveyId++;
//                    surveyId = maxSurveyId;
//                }
                surveyId = utility.getNextSurveyId();
                questiontpyelist = utility.listQuestionTypes();

            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return Utility.SUCCESS;
    }

    public String getDetailsOfSurvey() throws Exception {
        String sid = "";
        SurveyUtility utility = new SurveyUtility();
        HttpSession session = ServletActionContext.getRequest().getSession();
        Person person = (Person) session.getAttribute(Utility.USER_HANDLE);
        if (person == null) {
            return Utility.LOGIN_FAILURE;
        } else {
            SimpleStringCipher cipher = new SimpleStringCipher();
            /**
             * getting the parameters from 'url'
             */
            try {
                sid = ServletActionContext.getRequest().getParameter("sid");
                sid = cipher.decrypt(sid);
            } catch (Exception e) {
                sid = "0";
            }
            //System.out.println("sid " + sid);
            questiontpyelist = utility.listQuestionTypes();
            // surveylist = utility.listSurveyData("csr");

            surveylist = utility.listSurveyData("survey");
            try {
                if (Integer.parseInt(sid) > 0) {
                    // show details for selected survey id
                    encSurveyId = cipher.encrypt(sid);
                    surveyId = Integer.parseInt(sid);
                    surveydetails = utility.getSurveyDetails(Integer.parseInt(sid));
                    questionslist = utility.listQuestionDetails(Integer.parseInt(sid));
                    // check if survey is already fill by participants
                    survey_already_fill = utility.if_survey_already_fill(Integer.parseInt(sid));
                } else {
                    // show all survey id
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return Utility.SUCCESS;
    }

    public String getPreviewOfSurvey() {
        String sid = "";
        SurveyUtility utility = new SurveyUtility();
        HttpSession session = ServletActionContext.getRequest().getSession();
        Person person = (Person) session.getAttribute(Utility.USER_HANDLE);
//        if (person == null) {
//            return Utility.LOGIN_FAILURE;
//        } else {
        SimpleStringCipher cipher = new SimpleStringCipher();
        /**
         * getting the parameters from 'url'
         */
        try {
            sid = ServletActionContext.getRequest().getParameter("sid");
            sid = cipher.decrypt(sid);
        } catch (Exception e) {
            sid = "0";
        }
        if (Integer.parseInt(sid) > 0) {
            // call the function here
            setSb(utility.listSurveyQuestions(sid));
        }
//        }
        return Utility.SUCCESS;
    }

    public String getSurveyReports() {
        String sid = "";
        SurveyUtility utility = new SurveyUtility();
        HttpSession session = ServletActionContext.getRequest().getSession();
        Person person = (Person) session.getAttribute(Utility.USER_HANDLE);
        if (person == null) {
            return Utility.LOGIN_FAILURE;
        } else {
            try {
                SimpleStringCipher cipher = new SimpleStringCipher();
                /**
                 * getting the parameters from 'url'
                 */
                try {
                    sid = ServletActionContext.getRequest().getParameter("sid");
                    sid = cipher.decrypt(sid);
                } catch (Exception e) {
                    sid = "0";
                }
                surveylist = utility.listSurveyData("survey");
                if (Integer.parseInt(sid) > 0) {

                    encSurveyId = cipher.encrypt(sid);
                    surveyId = Integer.parseInt(sid);
                    surveyreports = utility.surveyReportGeneral2(sid);

                    /*
                     * ReportBean rbnew; for(int i=0; i<
                     * surveyreports.getRb().size(); i++){
                     * rbnew=surveyreports.getRb().get(i); for(int j=0; j<
                     * rbnew.getOption().size(); j++){ String
                     * text=rbnew.getOption().get(j);
                     *
                     * }
                     * }
                     */


                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return Utility.SUCCESS;
    }

    public String getDetailsOfSurvey_sendingMails() throws Exception {
        String sid = "";
        SurveyUtility utility = new SurveyUtility();
        HttpSession session = ServletActionContext.getRequest().getSession();
        Person person = (Person) session.getAttribute(Utility.USER_HANDLE);
//        if (person == null) {
//            return Utility.LOGIN_FAILURE;
//        } else {
        SimpleStringCipher cipher = new SimpleStringCipher();
        /**
         * getting the parameters from 'url'
         */
        try {
            sid = ServletActionContext.getRequest().getParameter("sid");
            sid = cipher.decrypt(sid);
        } catch (Exception e) {
            sid = "0";
        }
        //System.out.println("sid " + sid);
        questiontpyelist = utility.listQuestionTypes();
        surveylist = utility.listSurveyData("survey");
        surveylist_nmeict = utility.listSurveyData("survey");
        /*
         * surveylist = utility.listSurveyData("csr"); surveylist_nmeict =
         * utility.listSurveyData("nmeict2014");
         */
        setParticipant_status(utility.listParticipantStatus());
        workshops = utility.listWorkshopContent("csr");
        workshops_2 = utility.listWorkshopContent("nmeict2014");
        try {
            if (Integer.parseInt(sid) > 0) {
                // show details for selected survey id
                encSurveyId = cipher.encrypt(sid);
                surveyId = Integer.parseInt(sid);
                surveydetails = utility.getSurveyDetails(Integer.parseInt(sid));
                questionslist = utility.listQuestionDetails(Integer.parseInt(sid));
            } else {
                // show all survey id
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Utility.SUCCESS;
//        }
    }

    public String getBulkMaildetails() {
        String templateid, typeid = "";
        try {
            templateid = ServletActionContext.getRequest().getParameter("templateid");
            typeid = ServletActionContext.getRequest().getParameter("typeid");

        } catch (Exception e) {
            templateid = "0";
        }
        if (Integer.parseInt(templateid) != 0) {

            BulkMailUtility b_utility = new BulkMailUtility();
            setBulkmaildetails(b_utility.getBulkMailData(Integer.parseInt(templateid)));
            ArrayList<Person> emailList = null;
            if (Integer.parseInt(typeid) == 1 || Integer.parseInt(typeid) == 2 || Integer.parseInt(typeid) == 3 || Integer.parseInt(typeid) == 4) {
                if(bulkmaildetails.getDatabase_name().equals("survey")){
                    participantTotalCount=0;
                }else{
                    emailList = b_utility.getEmailList_test(bulkmaildetails);
                    participantTotalCount = emailList.size();
                }
            }
        }
        return Utility.SUCCESS;
    }

    public String getAllBulkMaildetails() {
        HttpSession session = ServletActionContext.getRequest().getSession();
        Person person = (Person) session.getAttribute(Utility.USER_HANDLE);
        if (person == null) {
            return Utility.LOGIN_FAILURE;
        } else {
            BulkMailUtility b_utility = new BulkMailUtility();
            logs_details = b_utility.listAllBulkMailLogs();
        }
        return Utility.SUCCESS;
    }
    
    public String getProfileDetails(){
        HttpSession session = ServletActionContext.getRequest().getSession();
        Person person = (Person) session.getAttribute(Utility.USER_HANDLE);
        if (person == null) {
            return Utility.LOGIN_FAILURE;
        } else {
             try {
                SurveyUtility utility=new SurveyUtility();
                per=utility.getLoginUserDeatils(person.getLoginId());
                String ipAddress = ServletActionContext.getRequest().getHeader("X-FORWARDED-FOR");
                if (ipAddress == null) {
                    ipAddress = ServletActionContext.getRequest().getRemoteAddr();
                }
                per.setIpAddress(ipAddress);
             }catch(Exception e){e.printStackTrace();}
           
        }
        return Utility.SUCCESS;
    }

    /**
     * @return the surveyId
     */
    public int getSurveyId() {
        return surveyId;
    }

    /**
     * @param surveyId the surveyId to set
     */
    public void setSurveyId(int surveyId) {
        this.surveyId = surveyId;
    }

    /**
     * @return the questiontpyelist
     */
    public ArrayList<SurveyQuestionTypesBean> getQuestiontpyelist() {
        return questiontpyelist;
    }

    /**
     * @param questiontpyelist the questiontpyelist to set
     */
    public void setQuestiontpyelist(ArrayList<SurveyQuestionTypesBean> questiontpyelist) {
        this.questiontpyelist = questiontpyelist;
    }

    /**
     * @return the surveylist
     */
    public ArrayList<SurveyIndexBean> getSurveylist() {
        return surveylist;
    }

    /**
     * @param surveylist the surveylist to set
     */
    public void setSurveylist(ArrayList<SurveyIndexBean> surveylist) {
        this.surveylist = surveylist;
    }

    /**
     * @return the encSurveyId
     */
    public String getEncSurveyId() {
        return encSurveyId;
    }

    /**
     * @param encSurveyId the encSurveyId to set
     */
    public void setEncSurveyId(String encSurveyId) {
        this.encSurveyId = encSurveyId;
    }

    /**
     * @return the surveydetails
     */
    public SurveyIndexBean getSurveydetails() {
        return surveydetails;
    }

    /**
     * @param surveydetails the surveydetails to set
     */
    public void setSurveydetails(SurveyIndexBean surveydetails) {
        this.surveydetails = surveydetails;
    }

    /**
     * @return the questionslist
     */
    public ArrayList<SurveyQuestionIndexBean> getQuestionslist() {
        return questionslist;
    }

    /**
     * @param questionslist the questionslist to set
     */
    public void setQuestionslist(ArrayList<SurveyQuestionIndexBean> questionslist) {
        this.questionslist = questionslist;
    }

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
     * @return the surveyreports
     */
    public SurveyAnswersBean getSurveyreports() {
        return surveyreports;
    }

    /**
     * @param surveyreports the surveyreports to set
     */
    public void setSurveyreports(SurveyAnswersBean surveyreports) {
        this.surveyreports = surveyreports;
    }

    /**
     * @return the surveylist_nmeict
     */
    public ArrayList<SurveyIndexBean> getSurveylist_nmeict() {
        return surveylist_nmeict;
    }

    /**
     * @param surveylist_nmeict the surveylist_nmeict to set
     */
    public void setSurveylist_nmeict(ArrayList<SurveyIndexBean> surveylist_nmeict) {
        this.surveylist_nmeict = surveylist_nmeict;
    }

    /**
     * @return the participant_status
     */
    public ArrayList<String> getParticipant_status() {
        return participant_status;
    }

    /**
     * @param participant_status the participant_status to set
     */
    public void setParticipant_status(ArrayList<String> participant_status) {
        this.participant_status = participant_status;
    }

    /**
     * @return the survey_already_fill
     */
    public int getSurvey_already_fill() {
        return survey_already_fill;
    }

    /**
     * @param survey_already_fill the survey_already_fill to set
     */
    public void setSurvey_already_fill(int survey_already_fill) {
        this.survey_already_fill = survey_already_fill;
    }

    /**
     * @return the workshops
     */
    public ArrayList<WorkshopContent> getWorkshops() {
        return workshops;
    }

    /**
     * @param workshops the workshops to set
     */
    public void setWorkshops(ArrayList<WorkshopContent> workshops) {
        this.workshops = workshops;
    }

    /**
     * @return the workshops_2
     */
    public ArrayList<WorkshopContent> getWorkshops_2() {
        return workshops_2;
    }

    /**
     * @param workshops_2 the workshops_2 to set
     */
    public void setWorkshops_2(ArrayList<WorkshopContent> workshops_2) {
        this.workshops_2 = workshops_2;
    }

    /**
     * @return the bulkmaildetails
     */
    public BulkMailLogs getBulkmaildetails() {
        return bulkmaildetails;
    }

    /**
     * @param bulkmaildetails the bulkmaildetails to set
     */
    public void setBulkmaildetails(BulkMailLogs bulkmaildetails) {
        this.bulkmaildetails = bulkmaildetails;
    }

    /**
     * @return the participantTotalCount
     */
    public int getParticipantTotalCount() {
        return participantTotalCount;
    }

    /**
     * @param participantTotalCount the participantTotalCount to set
     */
    public void setParticipantTotalCount(int participantTotalCount) {
        this.participantTotalCount = participantTotalCount;
    }

    /**
     * @return the logs_details
     */
    public ArrayList<BulkMailLogs> getLogs_details() {
        return logs_details;
    }

    /**
     * @param logs_details the logs_details to set
     */
    public void setLogs_details(ArrayList<BulkMailLogs> logs_details) {
        this.logs_details = logs_details;
    }

    /**
     * @return the per
     */
    public Person getPer() {
        return per;
    }

    /**
     * @param per the per to set
     */
    public void setPer(Person per) {
        this.per = per;
    }
}
