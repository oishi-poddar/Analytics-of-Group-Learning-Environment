/* 
    Document   : NewPassword
    Created on : 25 May, 2017, 8:59:55 AM
    Author     : chirag
*/
package angle_group;

import survey.*;
import captchas.CaptchasDotNet;

import bean.Person;
import com.opensymphony.xwork2.ActionSupport;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import utilities.SimpleStringCipher;
import utilities.Utility;


public class NewPassword extends ActionSupport {

    private Person person = null;

    public String login() throws Exception {

        CaptchasDotNet captchas = new captchas.CaptchasDotNet(
                ServletActionContext.getRequest().getSession(true), // Ensure session
                "demo", // client
                "secret" // secret
        );

        AngleUtility uprocess = new AngleUtility();
        Person per = uprocess.validateEmail(getPerson().getLoginName().trim());
        int roleId;
        int flag;

        switch (captchas.check(getPerson().getCaptcha())) {
            case 's': {
                clearActionErrors();
                addActionError("Session seems to be timed out or broken.");
                return Utility.ERROR;
            }
            case 'm': {
                clearActionErrors();
                addActionError("Session seems to be timed out or broken.Please use back button and reload.");
                return Utility.ERROR;
            }
            case 'w': {
                clearActionErrors();
                addActionError("You entered the wrong captcha.Try Again!");
                return Utility.ERROR;
            }
            default: {
                flag = 1;
            }
        }

        if (flag == 1) {
            if (per != null) {
                SimpleStringCipher obj=new SimpleStringCipher();
                String link = "resetpassword.html?temp="+obj.encrypt(getPerson().getLoginName().trim());
                System.out.println(link);
                
                HttpSession session = ServletActionContext.getRequest().getSession();
                session.setAttribute(Utility.USER_HANDLE, per);
                roleId = per.getRoleId();
                if (roleId == 5) {
                    return Utility.SUCCESS;
                }
            } else {
                clearActionErrors();
                addActionError("Invalid Email Address!");
                return Utility.ERROR;
            }

            return Utility.SUCCESS;
        } else {
            clearActionErrors();
            addActionError("Try Again!!");
            return Utility.ERROR;
        }

    }

    @Override
    public void validate() {
        clearFieldErrors();
        String username = "";
        try {
            username = getPerson().getLoginName();

        } catch (Exception e) {
            e.printStackTrace();
        }
        if (username == null || username.length() < 1) {
            addFieldError("userName", getText("username.required"));
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
