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
import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author manushi
 */
public class assignmentAnalysis  extends ActionSupport{

    ArrayList<AssignmentBean> listOfSubmission = new ArrayList<>();

    public ArrayList<AssignmentBean> getListOfSubmission() {
        return listOfSubmission;
    }

    public void setListOfSubmission(ArrayList<AssignmentBean> listOfSubmission) {
        this.listOfSubmission = listOfSubmission;
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
        listOfSubmission = angle.viewNumberOfSubmission(groupId);
        
//        for (AssignmentBean submission : listOfSubmission)
//        {
//            System.out.println("name : " + submission.getName());
//            System.out.println("id : " + submission.getId());
//            System.out.println("count : " + submission.getCount1());
//            System.out.println();
//        }
            
        System.out.println("afer");
        
        return "success";
    }
    
}
