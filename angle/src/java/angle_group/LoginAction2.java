/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package angle_group;

import bean.Person;
import com.opensymphony.xwork2.ActionSupport;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import utilities.Utility;

/**
 *
 * @author Kunal
 * 
 */
public class LoginAction2 extends ActionSupport {
    
    private Person person;
    HttpSession session;
    
    //  used for validating login
    public String login() throws Exception {
        AngleUtility uprocess = new AngleUtility();
        session = ServletActionContext.getRequest().getSession();
        //      to validate the credentials
        person = uprocess.validateLogin(getPerson().getLoginName().trim(), getPerson().getPassword());
        if (person != null)
        {
            session.setAttribute(Utility.USER_HANDLE, person);      //for creating the session
            return Utility.SUCCESS;
        } 
        else {             
            session.setAttribute(Utility.LOGIN_FAILURE, "wrong_credentials");
            clearActionErrors();
            addActionError("Invalid user name or password!");
            return Utility.ERROR;           //wrong credentials
        }     
    }

    /**
     * @return the Person's object
     */
    public Person getPerson() {
        return person;
    }

    /**
     *  the person to set
     */
    public void setPerson(Person person) {
        this.person = person;
    }
}
    
