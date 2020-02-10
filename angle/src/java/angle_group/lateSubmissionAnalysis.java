/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package angle_group;

import bean.AssignmentBean;
import bean.Person;
import com.opensymphony.xwork2.ActionSupport;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author manushi
 */
public class lateSubmissionAnalysis extends ActionSupport{
     ArrayList<AssignmentBean> listOfLateSubmission = new ArrayList<>();

    public ArrayList<AssignmentBean> getListOfLateSubmission() {
        return listOfLateSubmission;
    }

    public void setListOfLateSubmission(ArrayList<AssignmentBean> listOfLateSubmission) {
        this.listOfLateSubmission = listOfLateSubmission;
    }
    
     @Override
     public String execute() throws SQLException {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        Person person = (Person) session.getAttribute("loggedInUser");
        int uid = person.getLoginId();
        int groupId=Integer.parseInt(request.getParameter("gid").toString());
         System.out.println("groupId");
        AngleUtility angle = new AngleUtility();
        listOfLateSubmission = angle.viewLateSubmit(groupId);
        
         System.out.println("afer");
        
        return "success";
    }
}
