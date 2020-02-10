/* 
    Document   : ResetPassword
    Created on : 25 May, 2017, 8:59:55 AM
    Author     : chirag
*/
package angle_group;

import survey.*;
import bean.Person;
import com.opensymphony.xwork2.ActionSupport;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import utilities.Utility;

public class ResetPassword extends ActionSupport {

    private Person person = null;

    public String reset() throws Exception {
        AngleUtility uprocess = new AngleUtility();
        Person per = uprocess.updatePassword(getPerson().getEmail().trim(), getPerson().getPassword());
        int value;
        if (per != null) {
            HttpSession session = ServletActionContext.getRequest().getSession();
            session.setAttribute(Utility.USER_HANDLE, per);
            value = per.getVal();
            if (value == 1) {
                return Utility.SUCCESS;
            }else{
                clearActionErrors();
                addActionError("Request a new link to reset password!");
                return Utility.ERROR;
            }
        } else {
            clearActionErrors();
            addActionError("Request a new link to reset password!");
            return Utility.ERROR;
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
