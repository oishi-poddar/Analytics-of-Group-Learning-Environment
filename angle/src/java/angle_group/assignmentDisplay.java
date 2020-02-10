/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package angle_group;

/**
 *
 * @author manushi
 */


import bean.AssignmentBean;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
 

public class assignmentDisplay {
    private AssignmentBean a;
     ArrayList<AssignmentBean> listOfAssignments = new ArrayList<>();

    public ArrayList<AssignmentBean> getListOfAssignments() {
        return listOfAssignments;
    }

    public void setListOfAssignments(ArrayList<AssignmentBean> listOfAssignments) {
        this.listOfAssignments = listOfAssignments;
    }

    public AssignmentBean getA() {
        return a;
    }

    public void setA(AssignmentBean a) {
        this.a = a;
    }
    
   
    public String execute()
    { 
        HttpServletRequest request = ServletActionContext.getRequest();
        int gid = Integer.parseInt(request.getParameter("groupId"));
         
        AngleUtility utility= new AngleUtility();
        listOfAssignments=utility.viewAssignment(gid);
        
        if (listOfAssignments != null )
            return "SUCCESS";
        else
            return "ERROR";
    }    
}
