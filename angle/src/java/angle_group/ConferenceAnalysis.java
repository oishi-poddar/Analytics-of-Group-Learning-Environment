/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package angle_group;

import bean.AttendanceConferenceMember;
import bean.ConferenceDetails;
import bean.ParticipantsDetail;
import bean.Person;
import bean.TopicCountDetails;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import utilities.Utility;

/**
 *
 * @author apurv and Rohit
 */
public class ConferenceAnalysis extends ActionSupport {

    private ConferenceDetails msdata;
    private ArrayList<ConferenceDetails> conferencelist;
    private ArrayList<ConferenceDetails> topicList;
    private ParticipantsDetail mdata;
    private ArrayList<ParticipantsDetail> listanalytics;
    private ArrayList<TopicCountDetails> topicChat;
    public HashMap<String, Integer> totalTime;
    public HashMap<String, Integer> totalChat;
    public HashMap<String, Integer> totalParticipation;
    public HashMap<String, Integer> noOfConference;
    private ArrayList<ConferenceDetails> averageConference;
    private AttendanceConferenceMember attendanceConferenceMember;

    public ConferenceDetails getAnalytics_list() {
        return msdata;
    }

    /**
     * function sets the conferencelist with the return arraylist that contain
     * object of ConferenceDetails class
     *
     * @return
     */
    @Override
    public String execute() {

        totalChat = new HashMap<>();
        totalTime = new HashMap<>();
        totalParticipation = new HashMap<>();
        noOfConference = new HashMap<>();


        ConferenceUtility conferenceUtility = new ConferenceUtility();
        //setListanalytics(conferenceUtility.conferenceList());
        HttpSession session = ServletActionContext.getRequest().getSession();
        HttpServletRequest req = ServletActionContext.getRequest();
        int groupId = Integer.parseInt(req.getParameter("gid"));
        Person person = (Person) session.getAttribute(Utility.USER_HANDLE);
        String email = person.getEmail();
        setTopicList(conferenceUtility.getTopics(email, groupId));
        setConferencelist(conferenceUtility.conferenceList(email, groupId));
        conferenceUtility.messageList(groupId);
        setTopicChat(ConferenceUtility.topicCount);

        for (int i = 0; i < topicChat.size(); i++) {
            totalChat.put(topicChat.get(i).getTopic(), topicChat.get(i).getCount());

        }
        for (int i = 0; i < topicList.size(); i++) {
            totalTime.put(topicList.get(i).getTopic(), topicList.get(i).getTimedifference());
        }

        for (int i = 0; i < conferencelist.size(); i++) {
            String tempTopic = conferencelist.get(i).getTopic();
            if (totalParticipation.containsKey(tempTopic)) {
                int count = totalParticipation.get(tempTopic);
                count += conferencelist.get(i).getNoOfParticipants();
                int tempCount= noOfConference.get(tempTopic)+1;
                noOfConference.put(tempTopic, tempCount);

                totalParticipation.put(tempTopic, count);
            } else {

                totalParticipation.put(tempTopic, conferencelist.get(i).getNoOfParticipants());
                noOfConference.put(tempTopic, 1);
            }
        }
          
        ArrayList<ConferenceDetails> tempConference = new ArrayList<ConferenceDetails>();
        Iterator it = totalTime.entrySet().iterator();
        int totalMember = conferencelist.get(0).getTotalMember();
       
        while (it.hasNext()) {
            Map.Entry pair = (Map.Entry) it.next();
           
            String tempTopic = pair.getKey().toString();
            ConferenceDetails cd = new ConferenceDetails();
            double attendance = 0;
            if(totalMember!=1){
                attendance = Math.round((double)totalParticipation.get(tempTopic)*100/((totalMember-1)*noOfConference.get(tempTopic))*10000.0)/10000.0;
                if(attendance>100){
                    attendance=100;
                }
            }
            cd.setAttendance(attendance);
            if (totalChat.containsKey(tempTopic)) {
                cd.setChatCount(totalChat.get(tempTopic));
            } else {
                cd.setChatCount(0);
            }
            cd.setEmail(conferencelist.get(0).getEmail());
            cd.setGroupId(conferencelist.get(0).getGroupId());
            cd.setId(0);
            cd.setNoOfParticipants(noOfConference.get(tempTopic));
            cd.setStartConferenceTime("null");
            cd.setStopConferenceTime("null");
            cd.setTimedifference(Integer.parseInt(pair.getValue().toString()));
            cd.setTopic(pair.getKey().toString());
            cd.setTotalMember(totalMember);
            tempConference.add(cd);

        }
        setAverageConference(tempConference);
        setAttendanceConferenceMember(new ConferenceUtility().AttendanceMember(email, groupId));
       
       
      
        return "success";
    }

    public ArrayList<ConferenceDetails> getConferencelist() {
        return conferencelist;
    }

    public void setConferencelist(ArrayList<ConferenceDetails> conferencelist) {
        this.conferencelist = conferencelist;
    }

    public ConferenceDetails getMsdata() {
        return msdata;
    }

    public void setMsdata(ConferenceDetails msdata) {
        this.msdata = msdata;
    }

    public ArrayList<ConferenceDetails> getTopicList() {
        return topicList;
    }

    public void setTopicList(ArrayList<ConferenceDetails> topicList) {
        this.topicList = topicList;
    }

    public ParticipantsDetail getMdata() {
        return mdata;
    }

    public void setMdata(ParticipantsDetail mdata) {
        this.mdata = mdata;
    }

    public ArrayList<ParticipantsDetail> getListanalytics() {
        return listanalytics;
    }

    public void setListanalytics(ArrayList<ParticipantsDetail> listanalytics) {
        this.listanalytics = listanalytics;
    }

    public ArrayList<TopicCountDetails> getTopicChat() {
        return topicChat;
    }

    public void setTopicChat(ArrayList<TopicCountDetails> topicChat) {
        this.topicChat = topicChat;
    }

    public ArrayList<ConferenceDetails> getAverageConference() {
        return averageConference;
    }

    public void setAverageConference(ArrayList<ConferenceDetails> averageConference) {
        this.averageConference = averageConference;
    }

    public AttendanceConferenceMember getAttendanceConferenceMember() {
        return attendanceConferenceMember;
    }

    public void setAttendanceConferenceMember(AttendanceConferenceMember attendanceConferenceMember) {
        this.attendanceConferenceMember = attendanceConferenceMember;
    }
}
