/* 
    Document   : CheckEmail
    Created on : 25 May, 2017, 8:59:55 AM
    Author     : chirag
*/

package angle_group;

import survey.*;
import bean.Person;
import com.opensymphony.xwork2.ActionSupport;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import utilities.SimpleStringCipher;
import utilities.Utility;


public class CheckEmail extends ActionSupport {

    private Person person = null;
    private String email1;

    public String check() throws Exception {
        
        SimpleStringCipher obj=new SimpleStringCipher();
        
        String temp = ServletActionContext.getRequest().getParameter("temp");
        AngleUtility uprocess = new AngleUtility();
        temp=obj.decrypt(temp);
        Person per = uprocess.validateEmail(temp);
        person=new Person();
        person.setEmail(temp);
        String email = per.getEmail();
        if (per != null) {
            HttpSession session = ServletActionContext.getRequest().getSession();
            session.setAttribute(Utility.USER_HANDLE, per);
            
                if (!email.equals(null)) {
                    return Utility.SUCCESS;
                }
            } else {
                clearActionErrors();
                addActionError("Invalid Link. Request A New Link!");
                return Utility.ERROR;
            }

            return Utility.SUCCESS;
    }

   
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