/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package angle_group;

import bean.Notes;
import bean.ParticipantsDetail;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Oishi
 */

    
public class NotesAnalytics extends ActionSupport{

      ArrayList<Notes> listanalytics=new ArrayList<Notes>();

    public ArrayList<Notes> getListanalytics() {
        return listanalytics;
    }

    public void setListanalytics(ArrayList<Notes> listanalytics) {
        this.listanalytics = listanalytics;
    }

   
   
    @Override
    public String execute() {
            AngleUtility a_utility = new AngleUtility();
            
            HttpServletRequest req = ServletActionContext.getRequest();
            int groupId=Integer.parseInt(req.getParameter("gid").toString());
            
            setListanalytics(a_utility.NotesAnalysis(groupId));
System.out.println(listanalytics.size());
            return "success";
    }

}