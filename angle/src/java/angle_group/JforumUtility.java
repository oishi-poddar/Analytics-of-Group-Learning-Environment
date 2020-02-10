/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package angle_group;

import bean.JforumData;
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
 * @author Chirag
 */
public class JforumUtility extends ActionSupport {

    private Connection con;
    Statement s, s1, s2, s3, s4, s5;

    ResultSet res, res1, res2, res3, res4, res5, res6;

    /**
     * function returns ArrayList of object of ParticipantsDetail which is class
     * containing information regarding Participants of Conference.
     *
     * @return
     */
    public ArrayList<JforumData> messageList(int groupId) {
        ArrayList<JforumData> messageList = new ArrayList<JforumData>();
        JforumData jd = new JforumData();

        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                s = con.createStatement();
                s1 = con.createStatement();
                s2 = con.createStatement();
                s3 = con.createStatement();
                s4 = con.createStatement();
                s5 = con.createStatement();
                //analytics user vs no. of posts

                String query = "select count(distinct(user_id)) from jforum_user_groups where group_id=" + groupId;
                String query1 = "select * from jforum_topics where forum_id=" + groupId;

                res = s.executeQuery(query1);
                res2 = s1.executeQuery(query);

                if (res2.next()) {
                    int totalUsers = 0;
                    jd.setTotalUsers(res2.getInt("count(distinct(user_id))"));
                }

                while (res.next()) {
                    JforumData jdata = new JforumData();
                    jdata.setQuery(res.getString("topic_title"));
                    jdata.setReplies(res.getInt("topic_replies"));
                    jdata.setTime(res.getString("topic_time"));
                    jdata.setUserId(res.getInt("user_id"));
                    jdata.setQueryId(res.getInt("topic_id"));
                    int userId = 0;
                    int topicId = 0;
                    topicId = res.getInt("topic_id");
                    userId = res.getInt("user_id");
                    String query2 = "select count(distinct(user_id)),max(post_time) from jforum_posts where topic_id=" + topicId;
                    String query3 = "select * from Login_Info where LoginId=" + userId;

                    res1 = s1.executeQuery(query2);
                    res3 = s2.executeQuery(query3);

                    if (res3.next()) {
                        jdata.setUserName(res3.getString("name"));
                    }

                    if (res1.next()) {
                        jdata.setNumberOfUsers(res1.getInt("count(distinct(user_id))"));
                        jdata.setLastTime(res1.getString("max(post_time)"));
                        int notUsers = 0;
                        notUsers = (jd.getTotalUsers() - res1.getInt("count(distinct(user_id))"));
                        jdata.setNoParticipants(notUsers);
                    }
                    messageList.add(jdata);

                }

            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();

        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closeStatement(s);
            DBConnection.closeResultSet(res2);
            DBConnection.closeResultSet(res1);
            DBConnection.closeStatement(s1);
            DBConnection.closeStatement(s2);
            DBConnection.closeDBConnection(con);
        }

        return messageList;
    }

//user count
    public ArrayList<JforumData> userList(int groupId) {
        ArrayList<JforumData> userList = new ArrayList<JforumData>();

        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                s = con.createStatement();
                s1 = con.createStatement();
                s2 = con.createStatement();

                String postVsUser = "select distinct(user_id) from jforum_user_groups where group_id=" + groupId;
                res = s.executeQuery(postVsUser);
                while (res.next()) {
                    JforumData forumdata = new JforumData();
                    int uID = 0;
                    uID = res.getInt("user_id");
                    String getCount = "select count(distinct(post_id)) from jforum_posts where user_id =" + uID;
                    String getName = "select * from Login_Info where LoginId=" + uID;
                    res1 = s1.executeQuery(getCount);
                    res2 = s2.executeQuery(getName);
                    if (res1.next()) {
                        forumdata.setPostCount(res1.getInt("count(distinct(post_id))"));
                    }
                    if (res2.next()) {
                        forumdata.setPostedBy(res2.getString("name"));
                    }
                    userList.add(forumdata);
                }
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();

        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closeResultSet(res1);
            DBConnection.closeStatement(s);
            DBConnection.closeStatement(s1);
            DBConnection.closeStatement(s2);
            DBConnection.closeDBConnection(con);
        }

        return userList;
    }

    //user participation info
    public ArrayList<JforumData> tableList(int queryId) {
        ArrayList<JforumData> tableList = new ArrayList<JforumData>();

        HashMap<Integer, Integer> attendance = new HashMap<Integer, Integer>();

        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                s = con.createStatement();
                s1 = con.createStatement();
                s2 = con.createStatement();
                s3 = con.createStatement();
                s4 = con.createStatement();

                JforumData jdata = new JforumData();
                String query = "select distinct(forum_id) from jforum_posts where topic_id=" + queryId;
                String query1 = "select distinct(user_id) from jforum_posts where topic_id=" + queryId;
                System.out.println(query);
                System.out.println(query1);
                res = s.executeQuery(query);
                res1 = s1.executeQuery(query1);

                if (res.next()) {

                    jdata.setGroupId(res.getInt("forum_id"));
                }

                while (res1.next()) {
                    int uID = 0;
                    uID = res1.getInt("user_id");
                    System.out.println(uID);
                    attendance.put(uID, 1);

                }

                String query2 = "select distinct(user_id) from jforum_user_groups where group_id=" + jdata.getGroupId();
                System.out.println(query2);
                res2 = s2.executeQuery(query2);
                while (res2.next()) {
                    JforumData jforumdata = new JforumData();
                    int uID = 0;
                    uID = res2.getInt("user_id");
                    if (attendance.containsKey(uID)) {
                        jforumdata.setStatus("Participated");

                    } else {
                        jforumdata.setStatus("Not Participated");
                    }

                    String getName = "select * from Login_Info where LoginId=" + uID;
                    System.out.println(getName);
                    res3 = s3.executeQuery(getName);
                    if (res3.next()) {
                        jforumdata.setUserName(res3.getString("name"));
                    }
                    String getEmail = "select * from User where UserId=" + uID;
                    System.out.println(getEmail);
                    res4 = s4.executeQuery(getEmail);
                    if (res4.next()) {
                        jforumdata.setEmail(res4.getString("email"));
                    }

                    tableList.add(jforumdata);
                        
                }

            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();

        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closeResultSet(res1);
            DBConnection.closeStatement(s);
            DBConnection.closeStatement(s1);
            DBConnection.closeStatement(s2);
            DBConnection.closeDBConnection(con);
        }

        return tableList;
    }

}
