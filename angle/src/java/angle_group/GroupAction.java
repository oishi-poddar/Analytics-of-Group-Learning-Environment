/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package angle_group;

import bean.Group;
import bean.Person;
import bean.Profile;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import utilities.Utility;

/**
 *
 * @author ubuntu
 */
public class GroupAction extends ActionSupport {
    
    private Group g;
    ArrayList<Profile> listOfProfiles=new ArrayList<Profile>();
    public Group getG() {
        return g;
    }

    public void setG(Group g) {
        this.g = g;
    }

    @Override
    public String execute()
    {   
        HttpSession session = ServletActionContext.getRequest().getSession();
        HttpServletRequest req = ServletActionContext.getRequest();
        String notes = req.getParameter("Notes1");
        String assignment = req.getParameter("Assignment1");
        String videoChat = req.getParameter("VideoChat1");
        String quiz = req.getParameter("Quiz1");
        String poll = req.getParameter("Poll1");
        int profileId = Integer.parseInt(req.getParameter("defaultProfile"));
        Person person = (Person) session.getAttribute(Utility.USER_HANDLE);
        //profile is to be maintained
        String profileList1[] = req.getParameterValues("profileList1");
        String temp2 = "";
        for(int  i =0  ; i < profileList1.length ;i++)
        {   
            temp2 += profileList1[i]+":";
        }
        temp2 = temp2.substring(0, temp2.length()-1);
        Profile profile = null;
        g.setCreatedBy(person.getLoginId());
        AngleUtility util=new AngleUtility();
        profile=util.getGroupOwner();
        System.out.println(g.getGroupId()+"  "+g.getGroupName());
        String temp=notes+":"+assignment+":"+videoChat+":"+quiz+":"+poll;
        System.out.println(temp+"   "+temp2);
        if(util.insertGroup(g, profile,temp,profileId,temp2))
        { 
            return "success";
        }
        else
            return "failure";
    }
    
}