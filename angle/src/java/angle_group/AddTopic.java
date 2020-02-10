/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package angle_group;
import bean.Person;
import bean.Topic;
import com.opensymphony.xwork2.ActionSupport;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import utilities.Utility;
/**
 *
 * @author ubuntu
 */
public class AddTopic extends ActionSupport{
    Topic t = null;

    public Topic getT() {
        return t;
    }

    public void setT(Topic t) {
        this.t = t;
    }
    
    @Override
    public String execute()
    {
        HttpSession session = ServletActionContext.getRequest().getSession();
        Person person = (Person) session.getAttribute(Utility.USER_HANDLE);
        int p = 0;
        t.setCreatedById(person.getLoginId());
        AngleUtility uprocess = new AngleUtility();
        p = uprocess.addTopic(t);
        if (p != 0)
        {
            return SUCCESS;
        }
        else
        {
            return ERROR;
        }
    }
    
    @Override
    public void validate() {
        clearFieldErrors();
        String name="";
        name=getT().getName();
        if (name == null || name.length() > 45) {
            addFieldError("name", getText("Maximum lenght of Topic name is 45"));
        }
    }
}   
