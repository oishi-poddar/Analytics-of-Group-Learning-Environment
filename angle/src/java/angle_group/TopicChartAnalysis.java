package angle_group;

import bean.ParticipantsDetail;
import bean.TopicCountDetails;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author rohitkr2997
 * 
 */
public class TopicChartAnalysis extends ActionSupport {
 
    private TopicCountDetails msTopic;
    private ArrayList<TopicCountDetails> chartAnalysis;
    
        
     /**
     *function sets the chartAnalysis with the static arraylist topicCount of Message Utility Class that contain object of Participant Details
     * @return
     */
    @Override
    public String execute() {
            //MessageUtility a_utility = new MessageUtility();
            ConferenceUtility conferenceUtility = new ConferenceUtility();
             HttpServletRequest req = ServletActionContext.getRequest();
            int groupId=Integer.parseInt(req.getParameter("gid").toString());
               conferenceUtility.messageList(groupId);
            setChartAnalysis(ConferenceUtility.topicCount);
            
            
            return "success";
    }

    public ArrayList<TopicCountDetails> getChartAnalysis() {
        return chartAnalysis;
    }

    public void setChartAnalysis(ArrayList<TopicCountDetails> chartAnalysis) {
        this.chartAnalysis = chartAnalysis;
    }

    public TopicCountDetails getMsTopic() {
        return msTopic;
    }

  

  
}
