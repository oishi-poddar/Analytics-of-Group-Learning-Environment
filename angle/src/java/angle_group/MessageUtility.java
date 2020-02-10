/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package angle_group;

import bean.ParticipantsDetail;
import bean.TopicCountDetails;
import com.opensymphony.xwork2.ActionSupport;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import utilities.DBConnection;

/**
 *
 * @author apurv and Rohit
 */
public class MessageUtility extends ActionSupport {

    private Connection con;
    Statement s;
    ResultSet res;
     static HashMap<String,ArrayList<String>> messageMap;
     static HashMap<String,Integer> topicMessageCount;
     static ArrayList<TopicCountDetails> topicCount;
    /**
     *function returns ArrayList of object of ParticipantsDetail which is class containing information regarding Participants of Conference.
     * @return
     */
    public ArrayList<ParticipantsDetail> messageList(int groupId) {
        ArrayList<ParticipantsDetail> messageList = new ArrayList<ParticipantsDetail>();
         ArrayList<String> newMessageList = new ArrayList<String>();
         messageMap = new HashMap<String,ArrayList<String>>();
         topicMessageCount = new HashMap<String,Integer>();
         topicCount = new ArrayList<>();
         
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                s = con.createStatement();
                String query1 = "select * from ParticipantsDetail where groupId="+groupId ;
                res = s.executeQuery(query1);
                ParticipantsDetail mdata = null;
                while (res.next()) {
                    mdata = new ParticipantsDetail();
                    mdata.setCid(res.getInt("cid"));
                    mdata.setGroupId(res.getInt("groupId"));
                 
                    String topic=res.getString("Topic");
                    mdata.setTopic(topic);
                    mdata.setJid(res.getString("Jid"));
                    mdata.setNickName(res.getString("NickName"));
                    mdata.setEmail(res.getString("email"));
                   String mes=res.getString("Message");
                    mdata.setMessage(mes);
                      
                    String[] message=mes.split(":");
                    for(int i=1;i<message.length;i++){
                       
                        newMessageList.add(message[i]);
                    }
                    messageMap.put(res.getString("email"), newMessageList);
                    mdata.setTimeDifference(res.getString("TimeDifference"));
                    if(topicMessageCount.containsKey(topic)){
                      int count= topicMessageCount.get(topic);
                      count+=message.length-1;
                      topicMessageCount.put(topic, count);
                    }
                    else{
                        topicMessageCount.put(topic, message.length-1);
                    }
                    messageList.add(mdata);

                }
                for (Map.Entry m : topicMessageCount.entrySet()) {
                  
                    TopicCountDetails topicCountDetails =new TopicCountDetails();
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

}
