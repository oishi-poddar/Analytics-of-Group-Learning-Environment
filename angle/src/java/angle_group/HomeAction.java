/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package angle_group;

import survey.*;
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
public class HomeAction extends ActionSupport {
    private SurveyIndexBean survey_list;
    private ArrayList<SurveyIndexBean> listsurvey;

    public String execute() {
        HttpSession session = ServletActionContext.getRequest().getSession();
        Person person = (Person) session.getAttribute(Utility.USER_HANDLE);
        if (person == null) {
            return Utility.LOGIN_FAILURE;
        } else {
           
               SurveyUtility sutility=new SurveyUtility();
            setSurvey_list(sutility.listSurveyDetails());
            listsurvey= sutility.getAllSurveyList();
            return Utility.SUCCESS;
        }

    }

    /**
     * @return the survey_list
     */
    public SurveyIndexBean getSurvey_list() {
        return survey_list;
    }

    /**
     * @param survey_list the survey_list to set
     */
    public void setSurvey_list(SurveyIndexBean survey_list) {
        this.survey_list = survey_list;
    }

    /**
     * @return the listsurvey
     */
    public ArrayList<SurveyIndexBean> getListsurvey() {
        return listsurvey;
    }

    /**
     * @param listsurvey the listsurvey to set
     */
    public void setListsurvey(ArrayList<SurveyIndexBean> listsurvey) {
        this.listsurvey = listsurvey;
    }

    
}
