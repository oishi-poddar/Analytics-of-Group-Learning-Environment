/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package angle_group;

import static angle_group.MessageUtility.topicMessageCount;
import bean.AttendanceConference;
import bean.AttendanceConferenceMember;
import bean.ConferenceDetails;
import bean.ParticipantsDetail;
import bean.TopicCountDetails;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import utilities.DBConnection;

/**
 *
 * @author Apurv and Rohit
 */
public class ConferenceUtility {

    private Connection con;
    PreparedStatement ps;
    Statement s;
    ResultSet res, resPresent;
    int totalMember = 0;
    ResultSet resAttendance, resChat;
    static HashMap<String, ArrayList<String>> messageMap;
    static HashMap<String, Integer> topicMessageCount;
    public static ArrayList<TopicCountDetails> topicCount;
  

    /**
     * function returns arraylist of object of conferenceList which is class
     * having information regarding Conference.
     *
     * @author rohit
     * @return
     */
    public ArrayList<ConferenceDetails> conferenceList(String user, int groupId) {
        ArrayList<ConferenceDetails> conferenceList = new ArrayList<ConferenceDetails>();
        HashMap<Integer, Integer> conferenceMessageCount = new HashMap<Integer, Integer>();
        System.out.println("hello");
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                ps = con.prepareStatement("select count(*) as count from UserGroup  group by groupId having groupId=?;");
                ps.setInt(1, groupId);
                res = ps.executeQuery();

                if (res.next()) {
                    totalMember = res.getInt("count");
                }
                s = con.createStatement();

                String query2 = "select * from ParticipantsDetail where groupId=" + groupId;
                resChat = s.executeQuery(query2);

                while (resChat.next()) {
                    int cid = resChat.getInt("cid");
                    String mes = resChat.getString("Message");
                    String[] message = mes.split(":");
                    if (conferenceMessageCount.containsKey(cid)) {
                        int count = conferenceMessageCount.get(cid);
                        count += message.length - 1;
                        conferenceMessageCount.put(cid, count);
                    } else {
                        conferenceMessageCount.put(cid, message.length - 1);
                    }

                }
                String query1 = "select * from ConferenceDetails where email='" + user + "' and groupId=" + groupId;

                res = s.executeQuery(query1);

                while (res.next()) {
                    ConferenceDetails mdata = new ConferenceDetails();
                    mdata = new ConferenceDetails();
                    mdata.setGroupId(groupId);
                    mdata.setTotalMember(totalMember);
                    mdata.setEmail(res.getString("email"));
                    mdata.setTopic(res.getString("Topic"));
                    int noOfParticipants = res.getInt("NoOfParticipants")-1;
                    if (noOfParticipants > totalMember) {
                        noOfParticipants = totalMember;
                    }

                    mdata.setNoOfParticipants(noOfParticipants);
                    mdata.setStartConferenceTime(String.valueOf(res.getTimestamp("StartTime")));
                    mdata.setStopConferenceTime(String.valueOf(res.getTimestamp("EndTime")));
                    mdata.setId(res.getInt("cid"));
                    double attendance =0;
                    if(mdata.getTotalMember()!=1){
                        attendance = (double) mdata.getNoOfParticipants() * 100 / (mdata.getTotalMember()-1);
                      if (attendance > 100) {
                          attendance = 100;
                      }
                    }
                    mdata.setAttendance(attendance);
                    long diff = res.getTimestamp("EndTime").getTime() - res.getTimestamp("StartTime").getTime();

                    int min = (int) (diff / 1000);
                    if (min < 60) {
                        min = 1;
                    } else {
                        min = (min / 60);
                    }
                    mdata.setTimedifference(min);
                    if (conferenceMessageCount.containsKey(mdata.getId())) {
                        mdata.setChatCount(conferenceMessageCount.get(mdata.getId()));
                    }

                    conferenceList.add(mdata);

                }
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();

        } finally {
            DBConnection.closePStatement(ps);
            DBConnection.closeResultSet(res);
            DBConnection.closeResultSet(resChat);
            DBConnection.closeStatement(s);
            DBConnection.closeDBConnection(con);
        }

        return conferenceList;
    }

    /**
     * function takes parameter user which is email ,returns Arraylist of object
     * of ConferenceDetails (with topic and and time devoted on each topic).
     *
     * @author rohit
     * @return
     */
    public ArrayList<ConferenceDetails> getTopics(String user, int groupId) {
        ArrayList<ConferenceDetails> topics = new ArrayList<ConferenceDetails>();

        HashMap<String, HashMap<String, Integer>> hs = new HashMap<String, HashMap<String, Integer>>();
        HashMap<String, Integer> hashMap_temp = new HashMap<String, Integer>();
        ConferenceDetails mdata = new ConferenceDetails();
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();

            }
            if (con != null) {
                String query1 = "select * from ConferenceDetails where email='" + user + "' and groupId=" + groupId ;

                s = con.createStatement();
                res = s.executeQuery(query1);

                while (res.next()) {
                    // hashMap_temp = hs.get(user);
                    if (hashMap_temp == null) {
                        hashMap_temp = new HashMap<String, Integer>();
                    }

                    long diff = res.getTimestamp("EndTime").getTime() - res.getTimestamp("StartTime").getTime();

                    int min = (int) (diff / 1000);

                    if (min < 60) {
                        min = 1;
                    } else {
                        min = (min / 60);
                    }

                    String topic = res.getString("Topic").toString();

                    if (hashMap_temp.containsKey(topic)) {
                        int temp = hashMap_temp.get(topic);
                        temp += min;
                        
                        hashMap_temp.replace(topic, temp);
                    } else {
                        hashMap_temp.put(topic, min);
                    }

                }
                Iterator it = hashMap_temp.entrySet().iterator();

                while (it.hasNext()) {
                    ConferenceDetails temp = new ConferenceDetails();
                    Map.Entry pair = (Map.Entry) it.next();

                    temp.setTopic(pair.getKey().toString());
                    temp.setTimedifference(Integer.parseInt(pair.getValue().toString()));
                    topics.add(temp);
                    it.remove(); // avoids a ConcurrentModificationException
                }

            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();

        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closeStatement(s);
            DBConnection.closeDBConnection(con);
        }
      
        return topics;
    }

    /**
     * @author rohit
     */
    public ArrayList<AttendanceConference> attendanceList(int cid, int groupId) {
        ArrayList<AttendanceConference> attendanceList = new ArrayList<AttendanceConference>();
        HashMap<String, Integer> markAttendance = new HashMap<String, Integer>();
        HashMap<String, Integer> userTime = new HashMap<String, Integer>();
        HashMap<String, Integer> userChat = new HashMap<String, Integer>();
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                ps = con.prepareStatement("select ParticipantsDetail.email,ParticipantsDetail.TimeDifference,ParticipantsDetail.Message from ParticipantsDetail,ConferenceDetails where ParticipantsDetail.cid=ConferenceDetails.cid and ParticipantsDetail.cid=?;");
                ps.setInt(1, cid);
                resPresent = ps.executeQuery();

                while (resPresent.next()) {
                    String email = resPresent.getString("email");
                    markAttendance.put(email, 1);
                    userTime.put(email, resPresent.getInt("TimeDifference"));
                   
                    String [] mes = resPresent.getString("Message").toString().split(":");
                    int length = mes.length-1;
                    
                   
                    userChat.put(email, length);
                    
                }

                ps = con.prepareStatement("select email,name from UserGroup,User,Login_Info where User.UserId = UserGroup.userId and User.UserId = Login_Info.LoginId and groupId=?;");
                ps.setInt(1, groupId);
                resAttendance = ps.executeQuery();
                while (resAttendance.next()) {
                    AttendanceConference attendanceConference = new AttendanceConference();
                    String email = resAttendance.getString("email");
                    attendanceConference.setEmail(email);
                    attendanceConference.setName(resAttendance.getString("name"));
                    if (markAttendance.containsKey(email)) {

                        attendanceConference.setStatus("Present");
                        attendanceConference.setTimeDifference(userTime.get(email));
                        attendanceConference.setTotalChats(userChat.get(email));
                        
                    } else {
                        attendanceConference.setStatus("Absent");
                    }
                    attendanceList.add(attendanceConference);
                }
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();

        } finally {
            DBConnection.closePStatement(ps);
            DBConnection.closeResultSet(res);
            DBConnection.closeStatement(s);
            DBConnection.closeDBConnection(con);
        }

        return attendanceList;
    }

    /**
     * function returns ArrayList of object of ParticipantsDetail which is class
     * containing information regarding Participants of Conference.
     *
     * @author rohit
     * @return
     */
    public ArrayList<ParticipantsDetail> messageList(int groupId) {
        ArrayList<ParticipantsDetail> messageList = new ArrayList<ParticipantsDetail>();
        ArrayList<String> newMessageList = new ArrayList<String>();
        messageMap = new HashMap<String, ArrayList<String>>();
        topicMessageCount = new HashMap<String, Integer>();
        topicCount = new ArrayList<>();

        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                s = con.createStatement();
                String query1 = "select * from ParticipantsDetail where groupId=" + groupId;
                res = s.executeQuery(query1);
                ParticipantsDetail mdata = null;
                while (res.next()) {
                    mdata = new ParticipantsDetail();
                    mdata.setCid(res.getInt("cid"));
                    mdata.setGroupId(res.getInt("groupId"));

                    String topic = res.getString("Topic");
                    mdata.setTopic(topic);
                    mdata.setJid(res.getString("Jid"));
                    mdata.setNickName(res.getString("NickName"));
                    mdata.setEmail(res.getString("email"));
                    String mes = res.getString("Message");
                    mdata.setMessage(mes);

                    String[] message = mes.split(":");
                    for (int i = 1; i < message.length; i++) {

                        newMessageList.add(message[i]);
                    }
                    messageMap.put(res.getString("email"), newMessageList);
                    mdata.setTimeDifference(res.getString("TimeDifference"));
                    if (topicMessageCount.containsKey(topic)) {
                        int count = topicMessageCount.get(topic);
                        count += message.length - 1;
                        topicMessageCount.put(topic, count);
                    } else {
                        topicMessageCount.put(topic, message.length - 1);
                    }
                    messageList.add(mdata);

                }
                for (Map.Entry m : topicMessageCount.entrySet()) {

                    TopicCountDetails topicCountDetails = new TopicCountDetails();
                    topicCountDetails.setTopic(m.getKey().toString());
                    topicCountDetails.setCount(Integer.parseInt(m.getValue().toString()));
                    topicCount.add(topicCountDetails);
                }
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();

        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closeStatement(s);
            DBConnection.closeDBConnection(con);
        }

        return messageList;
    }
    /**
     * @author rohit
     */
   public AttendanceConferenceMember AttendanceMember(String email,int groupId){

          int totalTime=0,totalConference=0,confyouAttended=0,timeYouGive=0;
          double attendance=0;
          AttendanceConferenceMember attendanceConferenceMember = new AttendanceConferenceMember();
       try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
               
                ps = con.prepareStatement("SELECT sum(TIMESTAMPDIFF(MINUTE,StartTime,EndTime)) as time from ConferenceDetails where groupId=? and not email=?;");
                ps.setInt(1, groupId);
                ps.setString(2, email);
                res=ps.executeQuery();
                if(res.next()){
                    totalTime = res.getInt("time");
                    
                }
                ps= con.prepareStatement("select count(cid) as count from ConferenceDetails where groupId = ? and not email=?;");
                ps.setInt(1, groupId);
                ps.setString(2, email);
                res = ps.executeQuery();
                if(res.next()){
                    totalConference = res.getInt("count");
                }
                ps = con.prepareStatement("select count(ParticipantsDetail.email) as count from ConferenceDetails,ParticipantsDetail where ConferenceDetails.cid=ParticipantsDetail.cid and not ParticipantsDetail.email = ConferenceDetails.email and ParticipantsDetail.email=? and ParticipantsDetail.groupId=?;");
                ps.setString(1,email);
                ps.setInt(2,groupId);
                res = ps.executeQuery();
                if(res.next()){
                    confyouAttended = res.getInt("count");
                    
                }
                ps = con.prepareStatement("select sum(TimeDifference) as td from ParticipantsDetail group by email,groupId having ParticipantsDetail.email=? and groupId=?;");
                ps.setString(1, email);
                ps.setInt(2,groupId);
                res = ps.executeQuery();
                if(res.next()){
                    timeYouGive = res.getInt("td");
                }
                if(totalConference!=0){
                    attendance = ((double)confyouAttended * 100) /totalConference;
                }
                
                attendanceConferenceMember.setConfyouAttended(confyouAttended);
                attendanceConferenceMember.setTimeYouGive(timeYouGive);
                attendanceConferenceMember.setTotalConference(totalConference);
                attendanceConferenceMember.setTotalTimeConference(totalTime);
                attendanceConferenceMember.setAttendance(attendance);
                
                 
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();

        } finally {
            DBConnection.closePStatement(ps);
            DBConnection.closeResultSet(res);
            DBConnection.closeStatement(s);
            DBConnection.closeDBConnection(con);
        }

        return attendanceConferenceMember;
       
        
   }
    
}
