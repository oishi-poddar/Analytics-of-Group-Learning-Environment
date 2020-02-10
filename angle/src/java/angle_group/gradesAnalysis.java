/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package angle_group;

import bean.AssignmentBean;
import bean.Person;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author manushi
 */
public class gradesAnalysis {
    ArrayList<AssignmentBean> listOfAllGrades = new ArrayList<>();
    ArrayList<AssignmentBean> listOfTopicGrades = new ArrayList<>();

    public ArrayList<AssignmentBean> getListOfTopicGrades() {
        return listOfTopicGrades;
    }

    public void setListOfTopicGrades(ArrayList<AssignmentBean> listOfTopicGrades) {
        this.listOfTopicGrades = listOfTopicGrades;
    }

    public ArrayList<AssignmentBean> getListOfAllGrades() {
        return listOfAllGrades;
    }

    public void setListOfAllGrades(ArrayList<AssignmentBean> listOfAllGrades) {
        this.listOfAllGrades = listOfAllGrades;
    }

    

    public String execute() throws SQLException {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        Person person = (Person) session.getAttribute("loggedInUser");
        int uid = person.getLoginId();
        int groupId=Integer.parseInt(request.getParameter("gid").toString());
        System.out.println("groupId");
        AngleUtility angle = new AngleUtility();
        listOfAllGrades = angle.analyseGrades(groupId);
        listOfTopicGrades = angle.topicGrades(groupId);
        
        return "success";
    }
    
    
}
