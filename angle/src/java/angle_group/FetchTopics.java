package angle_group;

import bean.Person;
import bean.Topic;
import bean.UserNameEmails;
import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import utilities.Utility;

/**
 *
 * @author apurv
 */
public class FetchTopics extends ActionSupport{
    
    
    ArrayList<Topic> listOfTopics;//= new ArrayList<>();
    int gid;
    String groupCode;
    ArrayList<UserNameEmails> userNameEmails;

    public String getGroupCode() {
        return groupCode;
    }

    public void setGroupCode(String groupCode) {
        this.groupCode = groupCode;
    }
    
    public int getGid() {
        return gid;
    }

    public void setGid(int gid) {
        this.gid = gid;
    }

    public ArrayList<Topic> getListOfTopics() {
        return listOfTopics;
    }

    public void setListOfTopics(ArrayList<Topic> listOfTopics) {
        this.listOfTopics = listOfTopics;
    }
    
    @Override
    public String execute()
    {
        HttpSession session = ServletActionContext.getRequest().getSession();
        Person person = (Person) session.getAttribute(Utility.USER_HANDLE);
        String gidString = ServletActionContext.getRequest().getParameter("id");
        groupCode = ServletActionContext.getRequest().getParameter("groupCode");
        gid = Integer.parseInt(gidString);
        AngleUtility uprocess = new AngleUtility();
        listOfTopics = uprocess.viewTopic(person.getLoginId(), gid);
        if (listOfTopics != null)
        {
                return SUCCESS;
      
        }
        else
        {
            return ERROR;
        }
    }
    
}
