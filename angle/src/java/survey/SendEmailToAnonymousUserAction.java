/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package survey;

import bean.Person;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import utilities.Utility;

/**
 *
 * @author dipesh
 */
public class SendEmailToAnonymousUserAction extends ActionSupport{
    private ArrayList<SurveyIndexBean> surveylist;
    private int surveyId;
    private ArrayList<Person> invalidList;
    
    public String getSurveyDetails() {

        SurveyUtility utility = new SurveyUtility();
        HttpSession session = ServletActionContext.getRequest().getSession();
        Person person = (Person) session.getAttribute(Utility.USER_HANDLE);
        if (person == null) {
            return Utility.LOGIN_FAILURE;
        } else {
            try {
                surveylist = utility.listSurveyData("survey");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        

        return Utility.SUCCESS;
    }
    
    public String getInvalidUserList(){
        try{
            String templateid = ServletActionContext.getRequest().getParameter("templateid");
            if(Integer.parseInt(templateid) > 0){
                ReadExcelData exceldata=new ReadExcelData();
                invalidList= exceldata.gelAllInvalidRecords(Integer.parseInt(templateid));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return Utility.SUCCESS;
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
     * @return the invalidList
     */
    public ArrayList<Person> getInvalidList() {
        return invalidList;
    }

    /**
     * @param invalidList the invalidList to set
     */
    public void setInvalidList(ArrayList<Person> invalidList) {
        this.invalidList = invalidList;
    }
}
