/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package angle_group;

import bean.Person;
import bean.Poll;
import bean.PollAnalytics;
import bean.UserGroup;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import utilities.Utility;

/**
 *
 */
public class AnalyticsForPoll extends ActionSupport {

    HashMap<Integer, HashMap<String, Integer>> userVsVotes = new HashMap<Integer,HashMap<String, Integer>>();
    int groupId;
    AngleUtility utility;
    Person person;
    String email;
    Integer totalPolls;
    ArrayList<PollAnalytics> poll = new ArrayList<PollAnalytics>();

    public Integer getTotalPolls() {
        return totalPolls;
    }

    public void setTotalPolls(Integer totalPolls) {
        this.totalPolls = totalPolls;
    }
    
    
    public ArrayList<PollAnalytics> getPoll() {
        return poll;
    }

    public void setPoll(ArrayList<PollAnalytics> poll) {
        this.poll = poll;
    }
    
    public HashMap<Integer, HashMap<String, Integer>> getUserVsVotes() {
        return userVsVotes;
    }

    public void setUserVsVotes(HashMap<Integer, HashMap<String, Integer>> userVsVotes) {
        this.userVsVotes = userVsVotes;
    }
    
    public String getPollAnalytics() {
        try {
            utility = new AngleUtility();
            HttpServletRequest req = ServletActionContext.getRequest();
            groupId = Integer.parseInt(req.getParameter("gid").toString());
            poll = utility.getAllPollsOfGroup(groupId);
            
        } catch (Exception e) {
            e.printStackTrace();
            return Utility.ERROR;
        }
        return Utility.SUCCESS;
    }

    public String getUserVotes() {
        try {
            userVsVotes = new HashMap<Integer, HashMap<String, Integer>>();
            ArrayList<UserGroup> allMembers;
            utility = new AngleUtility();
            HttpServletRequest req = ServletActionContext.getRequest();
            groupId = Integer.parseInt(req.getParameter("gid").toString());
            allMembers = utility.getAllMembers(groupId);

            for (UserGroup member : allMembers) {
                HashMap<String, Integer> userNameVotes = new HashMap<String, Integer>();
                userNameVotes.put(member.getUserName(), utility.votesByUserInGroup(member.getUserId(), groupId));
                userVsVotes.put(member.getUserId(), userNameVotes);
            }
            totalPolls=utility.getAllPolls(groupId);
        }
         catch(Exception e)
        {
            e.printStackTrace();
            return Utility.ERROR;
        }

          return Utility.SUCCESS;
     }
}