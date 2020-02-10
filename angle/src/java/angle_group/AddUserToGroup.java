/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package angle_group;

//  import section
import bean.Person;
import com.opensymphony.xwork2.ActionSupport;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import utilities.Utility;

/**
 *
 * @author Kunal
 */
public class AddUserToGroup extends ActionSupport {

    AngleUtility utility;
    private String code;            //group code
    private String email;
    private Person person;
    
    //  adding user to group by entering the group code
    public String addUserIntoGroup()
    {
        HttpServletRequest request= ServletActionContext.getRequest();//;;.setAttribute("name", name);
        HttpSession session = request.getSession();
        utility=new AngleUtility();
        person=(Person) session.getAttribute(Utility.USER_HANDLE);
        email=person.getEmail();       
        code=getCode();                      //group code
        String name=person.getLoginName();
        //       function to add the user into the group
        int status=utility.addUserUsingGroupCode(code,email);
        if(status==1)           //new user
        {
            /*  success 
            **  sending notifications to the group moderators   */
            utility.notifyOwner(name,code);
            
            session.setAttribute("groupjoin", "success");
            return Utility.SUCCESS;
        }
        else if(status==-1)         //user already exists
        {
            session.setAttribute("groupjoin", "already_exists");
            return Utility.SUCCESS;
        }
        else                        //wrong group code
        {
            session.setAttribute("groupjoin", "failure");
            return Utility.ERROR;
        }
    }
     public String getCode()
    {
        return code;
    }
    public void setCode(String code)
    {
        this.code=code;
    }    
        
}
