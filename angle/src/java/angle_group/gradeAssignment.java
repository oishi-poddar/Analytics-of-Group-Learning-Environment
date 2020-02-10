/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package angle_group;

import bean.AssignmentBean;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author manushi
 */
public class gradeAssignment extends ActionSupport {

    ArrayList<AssignmentBean> listOfStudents = new ArrayList<>();

    public ArrayList<AssignmentBean> getListOfStudents() {
        return listOfStudents;
    }

    public void setListOfStudents(ArrayList<AssignmentBean> listOfStudents) {
        this.listOfStudents = listOfStudents;
    }

    private AssignmentBean a;

    public AssignmentBean getA() {
        return a;
    }

    public void setA(AssignmentBean a) {
        this.a = a;
    }

    public String execute() {
        

       
        String name = ServletActionContext.getRequest().getParameter("name");
         String gidString = ServletActionContext.getRequest().getParameter("id");
         int id = Integer.parseInt(gidString);
         
        a = new AssignmentBean();
        
        a.setId(id);
        AngleUtility utility = new AngleUtility();
        listOfStudents=utility.viewStudentList(a.getId());
        a =utility.countSubmission(a.getId());
        a.setName(name);
        
        if (listOfStudents!=null) {
        

        return "success";

        } else {
            return "failure";
        }
    }

}
