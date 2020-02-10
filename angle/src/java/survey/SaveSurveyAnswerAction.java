/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package survey;

import com.opensymphony.xwork2.ActionSupport;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import utilities.Utility;
import utilities.Validate;

/**
 *
 * @author abinaya
 */
public class SaveSurveyAnswerAction extends ActionSupport {

    private SurveyAnswersBean saving_ans;
    private String redirectUrl;
    private SurveyIndexBean surveydata;

    public String submit() throws Exception {
        try {

            SurveyUtility s_utility = new SurveyUtility();
            int var = s_utility.checkIfPersonFilledSurvey(Integer.toString(saving_ans.getSurvey_index().getSurvey_id()), Integer.toString(saving_ans.getPersonid()));
            try{
               surveydata=s_utility.getSurveyDetails(String.valueOf(saving_ans.getSurvey_index().getSurvey_id()));
            }catch(Exception e){
            }
            if (var > 0) {
                return Utility.ALREADY_REGISTERED;
            } else {
                int ret = s_utility.saveAnswers(saving_ans);
                if (ret > 0) {
                    return Utility.SUCCESS;
                } else {
                    return Utility.ERROR;
                }
            }

        } catch (Exception e) {
            return Utility.ERROR;
        }


    }

    @Override
    public void validate() {
        HttpSession session = ServletActionContext.getRequest().getSession();
        setRedirectUrl("displaySQ.html?sid=" + saving_ans.getSurvey_index().getSurvey_id_enc() + "&pid=" + saving_ans.getPid_enc());
        clearFieldErrors();
        for (int i = 0; i < saving_ans.getAll_questions().size(); i++) {
            if (saving_ans.getAll_questions().get(i).getQuestion_type().getQuestion_type_id() == 6) {
                int row_size = saving_ans.getAll_questions().get(i).getRow_values().size();
                int err = 0;
                for (int j = 0; j < row_size; j++) {
                    String row_ans = saving_ans.getAll_questions().get(i).getRow_values().get(j).getRow_ans();
                    if (Validate.isStringValid(row_ans) == false) {
                        err++;
                    }
                }
                if (err > 0 && saving_ans.getAll_questions().get(i).getRequired() == 1) {
                    String err_name = "action_err" + i;
                    addFieldError(err_name, "please choose an option in all rows");
                }
            } else {
                if ((Validate.isStringValid(saving_ans.getAll_questions().get(i).getAnswers()) == false) && (saving_ans.getAll_questions().get(i).getRequired() == 1)) {
                    String err_name = "action_err" + i;
                    addFieldError(err_name, "this field cannot be left blank");
                }
            }
        }
    }

    /**
     * @return the saving_ans
     */
    public SurveyAnswersBean getSaving_ans() {
        return saving_ans;
    }

    /**
     * @param saving_ans the saving_ans to set
     */
    public void setSaving_ans(SurveyAnswersBean saving_ans) {
        this.saving_ans = saving_ans;
    }

    /**
     * @return the redirectUrl
     */
    public String getRedirectUrl() {
        return redirectUrl;
    }

    /**
     * @param redirectUrl the redirectUrl to set
     */
    public void setRedirectUrl(String redirectUrl) {
        this.redirectUrl = redirectUrl;
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
