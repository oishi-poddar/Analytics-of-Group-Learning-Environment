/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package angle_group;

import bean.Person;
import com.opensymphony.xwork2.ActionSupport;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import utilities.SimpleStringCipher;
import utilities.Utility;

/**
 *
 *
 */
public class Signup extends ActionSupport{
    
    private String email;
    private String name;
    private String password;
    private String gender;
    private int type;
    private String groupCode;

    public String getGroupCode()
    {
        return groupCode;
    }
    public void setGroupCode(String groupCode)
    {
        this.groupCode=groupCode;
    }
    public int getType()
    {
        return type;
    }
    public void setType(int type)
    {
        this.type=type;
    }
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
    
    @Override
    public String execute()
    {        
        AngleUtility uprocess = new AngleUtility();
          HttpServletRequest request= ServletActionContext.getRequest();//;;.setAttribute("name", name);
         HttpSession session = request.getSession();

         //inserting new user
        if (uprocess.insertNewUser(getEmail(), getPassword(), getName(), getGender(), 1))
        {
           session.setAttribute("name","success");
           session.setAttribute("registered", "success");
            //generateVerificationLink();
            return SUCCESS;
        }
        else
        {
            session.setAttribute("name","failure");
           session.setAttribute("registered", "failure");
            return ERROR;
        }
     }

    //  adding new user using invitation link
    public String addUsingInvite()
    {
        AngleUtility utility=new AngleUtility();
        //  signing up new user 
        if( utility.insertNewUserUsingInvite(getEmail(),getPassword(),getName(),getGender(),getGroupCode(),1))
        {
            /*  success 
            **  sending notifications to the group moderators   */
             utility.notifyOwner(getName(),getGroupCode());
            
             /* validating the session      */
            Person person = utility.validateLogin(getEmail(), getPassword());
            if(person!=null)
            {
                  HttpSession session = ServletActionContext.getRequest().getSession();
                  session.setAttribute(Utility.USER_HANDLE, person);
                  return SUCCESS;
            }
        }
        return ERROR;
    }
   public void generateVerificationLink()
    {
       SimpleStringCipher cipher=new SimpleStringCipher();
       try 
       {
           String link="EmailVerification.html?key="+cipher.encrypt(getEmail());
//           System.out.println(link);
       }
       catch (Exception ex) {
           Logger.getLogger(EmailVerification.class.getName()).log(Level.SEVERE, null, ex);
       }
    }
}
