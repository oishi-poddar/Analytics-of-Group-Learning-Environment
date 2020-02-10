/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package angle_group;

import bean.AssignmentBean;
import bean.Person;
import static com.opensymphony.xwork2.Action.SUCCESS;
import java.io.File;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import utilities.FileUtil;
import utilities.Utility;

/**
 *
 * @author manushi
 */
public class updateAssignment {

    private AssignmentBean a;
    private String destPath;

    public String getDestPath() {
        return destPath;
    }

    public void setDestPath(String destPath) {
        this.destPath = destPath;
    }

    public AssignmentBean getA() {
        return a;
    }

    public void setA(AssignmentBean a) {
        this.a = a;
    }

    public String execute() {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        Person person = (Person) session.getAttribute("loggedInUser");
        int uid = person.getLoginId();
        
       
        AngleUtility utility = new AngleUtility();
        int i = utility.updateSubmitAssignment(getA());
       
        int assignmentId=getA().getGroupid();
        if (i > 0) {
            String context = ServletActionContext.getServletContext().getRealPath("");
            String filename = a.getMyFileFileName()+assignmentId+uid;
            if (getA().getMyFileFileName() != null && !getA().getMyFileFileName().equals("")) {

                try {
                    FileUtil.saveFile(a.getMyFile(), filename, context + File.separator + "uploadedfiles");

                } catch (Exception e) {
                    e.printStackTrace();
                }

            }
            session.setAttribute("updateAssignment", "success");
            return "success";

        } else {
            return "failure";
        }
    }

    public String assignment() {
        String gidString = ServletActionContext.getRequest().getParameter("id");
        int id = Integer.parseInt(gidString);
        String name = ServletActionContext.getRequest().getParameter("name");

        a = new AssignmentBean();
        a.setId(id);
        a.setName(name);

        return SUCCESS;
    }
}
