/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package survey;

import bean.Person;
import com.opensymphony.xwork2.ActionSupport;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import utilities.Utility;

/**
 *
 * @author dipesh
 */
public class LoginAction extends ActionSupport {

    private Person person = null;

    public String login() throws Exception {
        SurveyUtility uprocess = new SurveyUtility();
        Person per = uprocess.validateLogin(getPerson().getLoginName().trim(), getPerson().getPassword());
        int roleId;
        if (per != null) {
            HttpSession session = ServletActionContext.getRequest().getSession();
            session.setAttribute(Utility.USER_HANDLE, per);
            roleId = per.getRoleId();
            if (roleId == 5) {
                return Utility.SUCCESS;
            }
        } else {
            clearActionErrors();
            addActionError("Invalid user name or password!");
            return Utility.ERROR;
        }

        return Utility.SUCCESS;
    }

    @Override
    public void validate() {
        clearFieldErrors();
        String username="",password="";
        try{
            username=getPerson().getLoginName();
            password=getPerson().getPassword();
            //System.out.println(username+" "+password);
        }catch(Exception e){
            e.printStackTrace();
        }
        if (username == null || username.length() < 1) {
            addFieldError("userName", getText("username.required"));
        }
        if (password == null || password.length() < 1) {
            addFieldError("password", getText("password.required"));
        }
    }

    /**
     * @return the person
     */
    public Person getPerson() {
        return person;
    }

    /**
     * @param person the person to set
     */
    public void setPerson(Person person) {
        this.person = person;
    }
}
