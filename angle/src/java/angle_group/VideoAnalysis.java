/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package angle_group;

import bean.ParticipantsDetail;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
public class VideoAnalysis extends ActionSupport {

    ParticipantsDetail msdata;
    ArrayList<ParticipantsDetail> listanalytics;

    public ParticipantsDetail getAnalytics_list() {
        return msdata;
    }

    /**
     *
     * @param msList
     */
    public void setListanalytics(ArrayList<ParticipantsDetail> msList) {
        listanalytics = msList;
    }

    public ArrayList<ParticipantsDetail> getListanalytics() {
        return listanalytics;
    }

    /**
     *function sets the listAnalytics with the return arraylist that contain object of Participant Details 
     * @return
     */
    @Override
    public String execute() {
            //MessageUtility a_utility = new MessageUtility();
          
            HttpServletRequest req = ServletActionContext.getRequest();
            int groupId=Integer.parseInt(req.getParameter("gid").toString());
            //setListanalytics(a_utility.messageList(groupId));
            ConferenceUtility conferenceUtility = new ConferenceUtility();
            setListanalytics(conferenceUtility.messageList(groupId));
            return "success";
    }

}
