/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package survey;

import com.opensymphony.xwork2.ActionSupport;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import utilities.SimpleStringCipher;
import utilities.Utility;

/**
 *
 * @author abinaya
 */
public class SurveyReportsAction extends ActionSupport {

    private SurveyAnswersBean sb;
    private String sid_enc = null;

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
            SurveyUtility s_utility = new SurveyUtility();
            setSb(s_utility.surveyReport(sid));
            setSid_enc(survey_id_enc);
            return Utility.SUCCESS;
        } catch (Exception e) {
            return Utility.ERROR;
        }
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
}
