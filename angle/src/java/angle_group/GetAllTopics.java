
package angle_group;


import bean.AssignmentBean;
import bean.Group;
import bean.Notes;
import bean.Person;
import bean.Topic;
import bean.UserGroup;
import bean.UserNameEmails;
import com.opensymphony.xwork2.ActionSupport;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import utilities.Utility;

/**
 *
 * @author manushi
 */
public class GetAllTopics extends ActionSupport {

    ArrayList<Topic> listOfTopics;//= new ArrayList<>();
    ArrayList<UserGroup> listOfGroups = new ArrayList<>();
    ArrayList<AssignmentBean> listOfAssignments = new ArrayList<>();
    ArrayList<UserNameEmails> userNameEmail;
    Group currGroup = null;
    ArrayList<Notes> datalist = new ArrayList<Notes>();

    String email;
    int gid;

    public ArrayList<AssignmentBean> getListOfAssignments() {
        return listOfAssignments;
    }

    public void setListOfAssignments(ArrayList<AssignmentBean> listOfAssignments) {
        this.listOfAssignments = listOfAssignments;
    }

    String groupCode;
    String gidString;

    private Notes n;

    public String getGidString() {
        return gidString;
    }

    public void setGidString(String gidString) {
        this.gidString = gidString;
    }

    public ArrayList<UserNameEmails> getUserNameEmail() {
        return userNameEmail;
    }

    public void setUserNameEmail(ArrayList<UserNameEmails> userNameEmail) {
        this.userNameEmail = userNameEmail;
    }

    public void setN(Notes n) {
        this.n = n;
    }

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

    public Group getCurrGroup() {
        return currGroup;
    }

    public void setCurrGroup(Group currGroup) {
        this.currGroup = currGroup;
    }

    public ArrayList<Topic> getListOfTopics() {
        return listOfTopics;
    }

    public void setListOfTopics(ArrayList<Topic> listOfTopics) {
        this.listOfTopics = listOfTopics;
    }

    public ArrayList<Notes> getDatalist() {
        return datalist;
    }

    public void setDatalist(ArrayList<Notes> datalist) {
        this.datalist = datalist;
    }

    /**
     * @return the n
     */
    public Notes getN() {
        return n;
    }

    @Override
    public String execute() throws SQLException {
        HttpSession session = ServletActionContext.getRequest().getSession();
        Person person = (Person) session.getAttribute(Utility.USER_HANDLE);

        gidString = ServletActionContext.getRequest().getParameter("id");
        groupCode = ServletActionContext.getRequest().getParameter("groupCode");
        gid = Integer.parseInt(gidString);
        AngleUtility uprocess = new AngleUtility();
        currGroup = uprocess.getGroupById(gid);

        listOfGroups = uprocess.listGroup(person.getLoginId());
        listOfTopics = uprocess.viewTopic(person.getLoginId(), gid);
        listOfAssignments = uprocess.viewAssignment(gid);

        // datalist = displayNote(n, currGroup);
        if (listOfTopics != null || listOfAssignments != null) {
            return SUCCESS;
        } else {
            return ERROR;
        }
    }

    
    /**
     * 
     * @return String=UserName
    */
    public String getUserName() {
        HttpSession session = ServletActionContext.getRequest().getSession();
        Person person = (Person) session.getAttribute(Utility.USER_HANDLE);

        gidString = ServletActionContext.getRequest().getParameter("id");
        groupCode = ServletActionContext.getRequest().getParameter("groupCode");
        gid = Integer.parseInt(gidString);
        AngleUtility uprocess = new AngleUtility();
        listOfTopics = uprocess.viewTopic(person.getLoginId(), gid);
        userNameEmail = uprocess.groupCode(groupCode);
        if (listOfTopics != null) {
            if (userNameEmail != null) {
                return SUCCESS;
            } else {
                return ERROR;
            }
        } else {
            return ERROR;
        }

    }

}
