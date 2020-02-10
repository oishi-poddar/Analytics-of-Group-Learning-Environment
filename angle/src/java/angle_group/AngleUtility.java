/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package angle_group;

import bean.AssignmentBean;
import bean.Group;
import bean.GroupTree;
import bean.Notes;
import bean.Notification;
import bean.UserGroup;
import bean.Topic;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import utilities.DBConnection;
import bean.Person;
import bean.Poll;
import bean.PollAnalytics;
import bean.PostBean;
import bean.Profile;
import bean.Question;
import bean.Quiz;
import bean.QuizResponse;
import bean.Subgroup;
import bean.ToDoList;
import bean.TopicToDo;
import bean.UserNameEmails;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Objects;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import utilities.Utility;

/**
 *
 * @author pratik
 */
public class AngleUtility {

    private Connection con;
    private PreparedStatement pstmt, pstmt1, pstmt2, pstmt3, pstmt4;
    private ResultSet rs, res, res1, res2, res3;
    ArrayList<Notes> datalist = new ArrayList<Notes>();
    ArrayList<Integer> userIdList = new ArrayList<Integer>();
    ArrayList<Notes> listOfNotes = new ArrayList<Notes>();
    ArrayList<PostBean> GroupPost = new ArrayList<PostBean>();
    ArrayList<Notes> listanalytics = new ArrayList<Notes>();

    public ArrayList<Notes> getDatalist() {
        return datalist;
    }

    public static void setDatalist(ArrayList<Notes> datalist) {
        datalist = datalist;
    }

    public ArrayList<Notes> getListOfNotes() {
        return listOfNotes;
    }

    public void setListOfNotes(ArrayList<Notes> listOfNotes) {
        this.listOfNotes = listOfNotes;
    }

    /*
    Function called while creating a new group
    output :
        true if group added successfully
        false if unsuccessful
     */
    public boolean insertGroup(Group g, Profile p, String featureList, int defaultProfileId, String profileIdList) {
        int status = 0;
        int jforum_status = 0;
        int status1 = 0;

        int jforum_status1 = 0;
        int jforum_status2 = 0;
        int jforum_status3 = 0;
        int jforum_status4 = 0;
        int jforum_status5 = 0;
        int jforum_status6 = 0;
        int jforum_status7 = 0;
        int jforum_status8 = 0;
        int jforum_status9 = 0;
        int jforum_status10 = 0;
        int gid;
        int user_id = 0;
        int role_id = 0;
        String gcode;
        HttpSession session = ServletActionContext.getRequest().getSession();
        Person person = (Person) session.getAttribute(Utility.USER_HANDLE);

        if (person != null) {
            try {
                if (con == null || con.isClosed()) {
                    con = DBConnection.getDBConnection();
                }
                if (con != null) {
                    pstmt = con.prepareStatement("select max(groupId) as last_id from GroupInfo");
                    res = pstmt.executeQuery();
                    if (res.next()) {
                        gid = res.getInt("last_id");
                    } else {
                        gid = 0;
                    }

                    GroupCode gc = new GroupCode();
                    gcode = gc.generate(gid);
                    gid++;

                    con.setAutoCommit(false);

                    pstmt = con.prepareStatement("INSERT INTO GroupInfo"
                            + " (`groupId`,"
                            + " `groupCode`,"
                            + " `groupType`,"
                            + " `name`, "
                            + "`owner`,"
                            + " `description`,"
                            + " `createdOn`, "
                            + "`lastUsedOn`,"
                            + " `groupState`,"
                            + " `lockState`,"
                            + " `defaultProfileId`,"
                            + " `profileIdList`)"
                            + " VALUES (?, ?, ?, ?, ?, ?, now(), now(), '1', ?, ?, ?)");
                    pstmt.setInt(1, gid);
                    pstmt.setString(2, gcode);
                    pstmt.setInt(3, g.getGroupType());
                    pstmt.setString(4, g.getGroupName());
                    pstmt.setInt(5, g.getCreatedBy());
                    pstmt.setString(6, g.getDescription());
                    pstmt.setInt(7, g.getLockState());
                    pstmt.setInt(8, defaultProfileId);
                    pstmt.setString(9, profileIdList);
                    status = pstmt.executeUpdate();
                    //jforum
                    g.setGroupId(gid);
                    pstmt = con.prepareStatement("INSERT INTO jforum_groups(group_id,group_name) values (?,?);");
                    pstmt.setInt(1, gid);
                    pstmt.setString(2, g.getGroupName());
                    jforum_status = pstmt.executeUpdate();

                    pstmt = con.prepareStatement("INSERT INTO jforum_categories(categories_id,title,display_order) values (?,?,?);");
                    pstmt.setInt(1, gid);
                    pstmt.setString(2, g.getGroupName());
                    pstmt.setInt(3, gid);
                    jforum_status1 = pstmt.executeUpdate();

                    //setting permissions for category
                    pstmt = con.prepareStatement("INSERT INTO jforum_roles(group_id,name) values (?,?);");
                    pstmt.setInt(1, gid);
                    pstmt.setString(2, "perm_category");
                    jforum_status2 = pstmt.executeUpdate();
                    pstmt = con.prepareStatement("select max(role_id) as last_role_id from jforum_roles");
                    res = pstmt.executeQuery();
                    while (res.next()) {
                        role_id = res.getInt("last_role_id");
                    }

                    pstmt = con.prepareStatement("INSERT INTO jforum_role_values(role_id,role_value) values (?,?);");
                    pstmt.setInt(1, role_id);
                    pstmt.setInt(2, gid);
                    jforum_status3 = pstmt.executeUpdate();

                    //setting permissions for forum
                    pstmt = con.prepareStatement("INSERT INTO jforum_roles(group_id,name) values (?,?);");
                    pstmt.setInt(1, gid);
                    pstmt.setString(2, "perm_forum");
                    jforum_status4 = pstmt.executeUpdate();

                    pstmt = con.prepareStatement("select max(role_id) as last_role_id from jforum_roles");
                    res = pstmt.executeQuery();
                    while (res.next()) {
                        role_id = res.getInt("last_role_id");
                    }

                    pstmt = con.prepareStatement("INSERT INTO jforum_role_values(role_id,role_value) values (?,?);");
                    pstmt.setInt(1, role_id);
                    pstmt.setInt(2, gid);
                    jforum_status5 = pstmt.executeUpdate();

                    //setting permissions for reply only
                    pstmt = con.prepareStatement("INSERT INTO jforum_roles(group_id,name) values (?,?);");
                    pstmt.setInt(1, gid);
                    pstmt.setString(2, "perm_reply_only");
                    jforum_status7 = pstmt.executeUpdate();

                    pstmt = con.prepareStatement("select max(role_id) as last_role_id from jforum_roles");
                    res = pstmt.executeQuery();
                    while (res.next()) {
                        role_id = res.getInt("last_role_id");
                    }

                    pstmt = con.prepareStatement("INSERT INTO jforum_role_values(role_id,role_value) values (?,?);");
                    pstmt.setInt(1, role_id);
                    pstmt.setInt(2, gid);
                    jforum_status8 = pstmt.executeUpdate();

                    //setting permissions for read only forums
                    pstmt = con.prepareStatement("INSERT INTO jforum_roles(group_id,name) values (?,?);");
                    pstmt.setInt(1, gid);
                    pstmt.setString(2, "perm_read_only_forums");
                    jforum_status9 = pstmt.executeUpdate();

                    pstmt = con.prepareStatement("select max(role_id) as last_role_id from jforum_roles");
                    res = pstmt.executeQuery();
                    while (res.next()) {
                        role_id = res.getInt("last_role_id");
                    }

                    pstmt = con.prepareStatement("INSERT INTO jforum_role_values(role_id,role_value) values (?,?);");
                    pstmt.setInt(1, role_id);
                    pstmt.setInt(2, gid);
                    jforum_status10 = pstmt.executeUpdate();

                    pstmt = con.prepareStatement("INSERT INTO jforum_forums(forum_id,categories_id,forum_name,forum_desc) values (?,?,?,?);");
                    pstmt.setInt(1, gid);
                    pstmt.setInt(2, gid);
                    pstmt.setString(3, g.getGroupName());
                    pstmt.setString(4, g.getDescription());
                    jforum_status6 = pstmt.executeUpdate();
                    //jforum
                    if (status > 0 && jforum_status > 0 && jforum_status1 > 0 && jforum_status2 > 0 && jforum_status3 > 0 && jforum_status4 > 0 && jforum_status5 > 0 && jforum_status6 > 0 && jforum_status7 > 0 && jforum_status8 > 0 && jforum_status9 > 0 && jforum_status10 > 0) {
                        /*(
                        pstmt = con.prepareStatement("select user_id from jforum_users where username = ? ");
                        pstmt.setString(1, person.getEmail());
                        res = pstmt.executeQuery();
                        while(res.next())
                        user_id = res.getInt("user_id");
                         */
                        status = 0;
                        pstmt = con.prepareStatement("INSERT INTO jforum_user_groups (group_id,user_id) VALUES (?,?);");
                        pstmt.setInt(1, gid);
                        pstmt.setInt(2, g.getCreatedBy());
                        status1 = pstmt.executeUpdate();

                        pstmt = con.prepareStatement("INSERT INTO UserGroup (`groupId`, `userId`, `profileId`) VALUES (?, ?, ?);");
                        pstmt.setInt(1, gid);
                        pstmt.setInt(2, g.getCreatedBy());
                        pstmt.setInt(3, p.getProfileId());
                        status = pstmt.executeUpdate();

                        if (status > 0 && status1 > 0) {
                            status = 0;
                            pstmt = con.prepareStatement("INSERT INTO GroupFeatures (`groupId`, `featureList`) VALUES (?, ?)");
                            pstmt.setInt(1, gid);
                            pstmt.setString(2, featureList);
                            status = pstmt.executeUpdate();

                            if (status > 0) {
                                con.commit();
                            } else {
                                con.rollback();
                            }
                        } else {
                            con.rollback();
                        }
                    }
                    con.setAutoCommit(true);
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                DBConnection.closePStatement(pstmt);
                DBConnection.closeDBConnection(con);
            }
        }
        return status > 0;
    }

    /*
    Arraylist of Groups
     */
    public ArrayList<UserGroup> listGroup(int uid) {
        ArrayList<UserGroup> userGroupList = new ArrayList<UserGroup>();
        UserGroup ug = null;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("SELECT ug.groupId, "
                        + "ug.profileId, "
                        + "gi.groupCode, "
                        + "gi.name,"
                        + "gi.lockState, "
                        + "gi.description, "
                        + "gi.lastUsedOn "
                        + "from UserGroup ug, "
                        + "GroupInfo gi "
                        + "where gi.groupId=ug.groupId and ug.userId = ?");
                pstmt.setInt(1, uid);
                res = pstmt.executeQuery();

                while (res.next()) {
                    ug = new UserGroup();
                    ug.setGroupId(res.getInt("groupId"));
                    ug.setProfileId(res.getInt("profileId"));
                    ug.setGroupCode(res.getString("groupCode"));
                    int profileId = res.getInt("profileId");
                    int lockedState = res.getInt("lockState");
                    if (lockedState == 1) {
                        ug.setLockedState("Private");
                    } else {
                        ug.setLockedState("Public");
                    }
                    pstmt1 = con.prepareStatement("SELECT profileName from Profile where profileId = ?");
                    pstmt1.setInt(1, profileId);
                    res1 = pstmt1.executeQuery();
                    if (res1.next()) {
                        ug.setProfileName(res1.getString("profileName"));
                    }
                    ug.setUserId(uid);
                    ug.setGroupName(res.getString("name"));
                    ug.setDescription(res.getString("description"));
                    ug.setLastUsedOn(res.getTimestamp("lastUsedOn"));
                    int id = ug.getGroupId();
                    pstmt1 = con.prepareStatement("SELECT count(userId) as noOfMembers from UserGroup where groupId=?");
                    pstmt1.setInt(1, id);
                    res1 = pstmt1.executeQuery();

                    if (res1.next()) {
                        ug.setNoOfMembers(res1.getInt("noOfMembers"));
                    }
                    userGroupList.add(ug);
                }

            }
        } catch (SQLException sqle) {
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closePStatement(pstmt1);
            DBConnection.closeResultSet(res1);
            DBConnection.closeDBConnection(con);
        }
        return userGroupList;
    }

    /*
    true - Group name is updated
    false - update unsuccessful
     */
    public boolean updateGroup(Group g) {
        int result = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("update GroupInfo set name = ? where groupId = ?");
                pstmt.setString(1, g.getGroupName());
                pstmt.setInt(2, g.getGroupId());
                result = pstmt.executeUpdate();
            }
        } catch (SQLException e) {
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return result > 0;
    }

    /*
 * @author Chirag & Sakshi
     */
    public int addTopic(Topic t) {
        int result = 0;

        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {

                pstmt = con.prepareStatement("INSERT INTO topicList (topic_name,group_id,user_id,topic_time) VALUES (?, ?,?, now())");

                pstmt.setString(1, t.getName());
                pstmt.setInt(2, t.getGroupId());
                pstmt.setInt(3, t.getCreatedById());

                result = pstmt.executeUpdate();

                pstmt = con.prepareStatement("select max(topic_id) as tid from topicList");
                res = pstmt.executeQuery();
                if (res.next()) {
                    t.setTopicId(res.getInt("tid"));
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return result;
    }

    public ArrayList<Topic> viewTopic(int uid, int gid) {
        Topic t = null;
        ArrayList<Topic> listOfTopics = new ArrayList<Topic>();

        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select * from UserGroup where groupId = ? and userId = ?");
                pstmt.setInt(1, gid);
                pstmt.setInt(2, uid);
                res = pstmt.executeQuery();
                if (res.next()) {
                    pstmt = con.prepareStatement("select * from topicList where group_id=?");
                    pstmt.setInt(1, gid);
                    res = pstmt.executeQuery();
                    while (res.next()) {
                        t = new Topic();
                        t.setTopicId(res.getInt("topic_id"));
                        t.setGroupId(res.getInt("group_id"));
                        t.setName(res.getString("topic_name"));
                        t.setCreatedById(res.getInt("user_id"));
                        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
                        t.setCreatedOn(simpleDateFormat.format(res.getDate("topic_time")));
                        listOfTopics.add(t);
                    }
                } else {
                    return null;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return listOfTopics;
    }

    /*
 * @author Chirag & Sakshi
     */
    public int updateTopic(String name, int tid) {

        int result = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("update group_topic set name = ? where id = ?");
                pstmt.setString(1, name);
                pstmt.setInt(2, tid);
                result = pstmt.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return result;
    }

    /*
 * @author Chirag & Sakshi
     */
    public Topic getTopicDetails(int tid) {

        Topic t = new Topic();
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select * from topicList where topic_id= ?");
                pstmt.setInt(1, tid);

                res = pstmt.executeQuery();
                if (res.next()) {
                    t.setName(res.getString("topic_name"));
                    t.setCreatedById(res.getInt("user_id"));
                    t.setGroupId(res.getInt("group_id"));
                    t.setTopicId(res.getInt("topic_id"));
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return t;
    }

    /*
 * @author Chirag & Sakshi
     */
    public int checkExistingTopic(String name, int gid) {
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select topic_id from topicList where group_id = ? and topic_name = ?");
                pstmt.setInt(1, gid);
                pstmt.setString(2, name);
                res = pstmt.executeQuery();

                if (res.next()) {

                    return 0;
                } else {

                    return 1;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return 0;
    }

    /*
    Check if there exists a group of same name
    output :
        0 - name exists
        1 - name accepted
        -1 - error
     */
    public int checkExistingGroup(String name, int uid) {
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select id from GroupInfo where owner = ? and name = ?");
                pstmt.setInt(1, uid);
                pstmt.setString(2, name);
                res = pstmt.executeQuery();

                if (res.next()) {
                    return 0;
                } else {
                    return 1;
                }
            }
        } catch (SQLException e) {
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return -1;
    }

    /*
    add new user (Sign up)
    output :
        true - new user inserted successfully
        false - new user unsuccessful
     */
    public boolean insertNewUser(String email, String password, String name, String gender, int Type) {
        int result = 0;
        int status = 0;
        int prevUid = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
//      
                pstmt = con.prepareStatement("select max(LoginId) as last_id from Login_Info");
                res = pstmt.executeQuery();

                if (res.next()) {
                    prevUid = res.getInt("last_id");
                } else {
                    prevUid = 0;
                }

                prevUid++;
                con.setAutoCommit(false);
                String ipAddress = ServletActionContext.getRequest().getHeader("X-FORWARDED-FOR");
                if (ipAddress == null) {
                    ipAddress = ServletActionContext.getRequest().getRemoteAddr();
                }

                pstmt = con.prepareStatement("INSERT INTO User (UserId, email, password, userIP, lastLoggedOn, loginStatus) VALUES (?, ?, md5(?), ?, now(), '1')");
                pstmt.setInt(1, prevUid);
                pstmt.setString(2, email);
                pstmt.setString(3, password);
                pstmt.setString(4, ipAddress);
                result = pstmt.executeUpdate();

                if (result > 0) {
                    pstmt = con.prepareStatement("INSERT INTO Login_Info (LoginId, name, gender, createdOn) VALUES (?, ?, ?, now())");
                    pstmt.setInt(1, prevUid);
                    pstmt.setString(2, name);
                    pstmt.setString(3, String.valueOf(gender.charAt(0)));
                    result = pstmt.executeUpdate();
                    if (result > 0) {
                        con.commit();
                        result = 1;
                    } else {
                        con.rollback();
                        result = 0;
                    }
                }
                try {
                    pstmt = con.prepareStatement("INSERT INTO jforum_users(user_id,username, user_password,user_email, user_regdate) values (?, ?, ?,?,now())");
                    pstmt.setInt(1, prevUid);
                    pstmt.setString(2, email);
                    pstmt.setString(3, "sso");
                    pstmt.setString(4, "sso@user");
                    status = pstmt.executeUpdate();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                con.setAutoCommit(true);

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return result > 0;
    }

    /*
    login validation and load the person details of the logged in user
     */
    public Person userLogin(String user_name, String password) {
        int result = 0;
        Person p = null;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }

            if (con != null) {
                pstmt = con.prepareStatement("select u.UserId, l.gender, l.name from User u, Login_Info l where u.email = ? and u.password = md5(?) and u.loginStatus = '1'");
                pstmt.setString(1, user_name);
                pstmt.setString(2, password);
                res = pstmt.executeQuery();
                if (res.next()) {
                    p = new Person();
                    p.setLoginId(res.getInt("UserId"));
                    p.setFirstName(res.getString("name"));
                    p.setEmail(user_name);
                    p.setGender(res.getString("gender"));

                    String ipAddress = ServletActionContext.getRequest().getHeader("X-FORWARDED-FOR");
                    if (ipAddress == null) {
                        ipAddress = ServletActionContext.getRequest().getRemoteAddr();
                    }
                    p.setIpAddress(ipAddress);
                    pstmt = con.prepareStatement("update User set userIP=? where UserId = ?");
                    pstmt.setString(1, ipAddress);
                    pstmt.setInt(2, p.getLoginId());
                    result = pstmt.executeUpdate();

                    if (result == 0) {
                        p = null;
                    }
                }
            }
        } catch (SQLException e) {
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return p;
    }

    public Person validateEmail(String username) {
        Person person = null;
        int id = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select * from User where email=lower(?)");
                //binding the userid and password to the query
                pstmt.setString(1, username);

                //executing the query
                res = pstmt.executeQuery();
                //checking whether any person exist with this userid or password
                if (res.next()) { //if exist then set all the details in Person class object.
                    //creating the object of Person class.
                    person = new Person();
                    //setting the values into variable of Person class

                    person.setEmail(res.getString("email"));
                    person.setLoginId(res.getInt("UserId"));

                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return person;
    }

    public Person updatePassword(String email, String password) {
        Person person = null;
        int id = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("update User set password = md5(?) where email=lower(?)");
                //binding the email and password to the query
                pstmt.setString(1, password);
                pstmt.setString(2, email);

                //executing the update query
                int val = pstmt.executeUpdate();
                person = new Person();
                person.setVal(val);   //no. of rows effected

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return person;
    }

    /*
    arraylist of all users
     */
    public ArrayList<Person> getListOfUsers() {
        Person p = null;
        ArrayList<Person> listOfUsers = new ArrayList<Person>();
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select u.UserId, l.name, u.email, l.gender, u.lastLoggedOn, u.loginStatus from User u, Login_Info l where u.UserId = l.LoginId");
                res = pstmt.executeQuery();

                while (res.next()) {
                    p = new Person();
                    p.setLoginId(res.getInt("UserId"));
                    p.setFirstName(res.getString("name"));
                    p.setEmail(res.getString("email"));
                    p.setUsername(res.getString("email"));
                    p.setGender(res.getString("gender"));
                    p.setLastLogin(res.getTimestamp("lastLoggedOn"));
                    p.setLoginStatus(res.getBoolean("loginStatus"));
                    listOfUsers.add(p);
                }
            }
        } catch (SQLException e) {
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return listOfUsers;
    }

    /*
*    0 - email exists
*    1 - email accepted
*    -1 - error
     */
    public int checkExistingEmail(String email) {
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select UserId from User where email = ?");
                pstmt.setString(1, email);
                res = pstmt.executeQuery();

                if (res.next()) {
//                    email check : false
                    return 0;
                } else {
//                    email check : true
                    return 1;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return -1;
    }

    public Person validateLogin(String username, String password) {
        Person person = null;
        int id = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select * from User U, Login_Info L where U.email=lower(?) and U.password=md5(?) and U.UserId=L.LoginId;");
                //binding the userid and password to the query
                pstmt.setString(1, username);
                pstmt.setString(2, password);
                //executing the query
                res = pstmt.executeQuery();
                //checking whether any person exist with this userid or password
                if (res.next()) {
                    //if exist then set all the details in Person class object.
                    person = new Person();
                    person.setLoginId(res.getInt("UserId"));
                    person.setLoginName(res.getString("name"));
                    person.setEmail(res.getString("email"));
                    person.setGender(res.getString("gender"));
                    person.setLastLogin(res.getTimestamp("lastLoggedOn"));
                    pstmt1 = con.prepareStatement("UPDATE User SET lastLoggedOn = now() WHERE UserId=?");
                    pstmt1.setInt(1, person.getLoginId());
                    int s = pstmt1.executeUpdate();
                    if (s <= 0) {
                        return null;
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return person;
    }

    /*
    get all profiles
     */
    public ArrayList<Profile> getListOfProfiles() {
        Profile p = null;
        ArrayList<Profile> listOfProfiles = new ArrayList<Profile>();
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }

            if (con != null) {
                pstmt = con.prepareStatement("select * from Profile");
                res = pstmt.executeQuery();
                while (res.next()) {
                    p = new Profile();
                    p.setProfileId(res.getInt("profileId"));
                    p.setProfileName(res.getString("profileName"));
                    p.setModifyGroup(res.getBoolean("modifyGroup"));
                    p.setCreateTopic(res.getBoolean("createTopic"));
                    p.setModifyTopics(res.getBoolean("modifyTopic"));
                    p.setPostNote(res.getBoolean("postingNote"));
                    p.setHideNote(res.getBoolean("hideNote"));
                    p.setCreateAssignment(res.getBoolean("createAssignment"));
                    p.setViewAssignment(res.getBoolean("viewAssignment"));
                    p.setAnswerAssignment(res.getBoolean("submitAnswer"));
                    p.setGradeAssignment(res.getBoolean("gradeAssignment"));
                    p.setViewGrades(res.getBoolean("viewGrades"));
                    p.setCreateQuiz(res.getBoolean("createQuiz"));
                    p.setViewQuiz(res.getBoolean("viewQuiz"));
                    p.setSendInvite(res.getBoolean("sendInvite"));
                    p.setAnswerQuiz(res.getBoolean("submitQuiz"));
                    p.setGradeQuiz(res.getBoolean("gradeQuiz"));
                    p.setStartVideoChat(res.getBoolean("startVideoChat"));
                    p.setStartDiscussionForum(res.getBoolean("startDiscussionForum"));
                    p.setCreatePoll(res.getBoolean("createPoll"));
                    p.setViewPoll(res.getBoolean("viewPoll"));
                    p.setAcceptInvite(res.getBoolean("acceptInvite"));
                    listOfProfiles.add(p);
                }
            }
        } catch (SQLException e) {
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return listOfProfiles;
    }

    /*    
    get default Profile or Owner
     */
    public Profile getGroupOwner() {

        Profile p = null;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("Select * from Profile where profileId=1");
                res = pstmt.executeQuery();
                while (res.next()) {
                    p = new Profile();
                    p.setProfileId(res.getInt("profileId"));
                    p.setProfileName(res.getString("profileName"));
                    p.setModifyGroup(res.getBoolean("modifyGroup"));
                    p.setCreateTopic(res.getBoolean("createTopic"));
                    p.setModifyTopics(res.getBoolean("modifyTopic"));
                    p.setPostNote(res.getBoolean("postingNote"));
                    p.setHideNote(res.getBoolean("hideNote"));
                    p.setCreateAssignment(res.getBoolean("createAssignment"));
                    p.setViewAssignment(res.getBoolean("viewAssignment"));
                    p.setAnswerAssignment(res.getBoolean("submitAnswer"));
                    p.setGradeAssignment(res.getBoolean("gradeAssignment"));
                    p.setViewGrades(res.getBoolean("viewGrades"));
                    p.setCreateQuiz(res.getBoolean("createQuiz"));
                    p.setViewQuiz(res.getBoolean("viewQuiz"));
                    p.setSendInvite(res.getBoolean("sendInvite"));
                    p.setAnswerQuiz(res.getBoolean("submitQuiz"));
                    p.setGradeQuiz(res.getBoolean("gradeQuiz"));
                    p.setStartVideoChat(res.getBoolean("startVideoChat"));
                    p.setStartDiscussionForum(res.getBoolean("startDiscussionForum"));
                    p.setCreatePoll(res.getBoolean("createPoll"));
                    p.setViewPoll(res.getBoolean("viewPoll"));
                    p.setAcceptInvite(res.getBoolean("acceptInvite"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeDBConnection(con);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeResultSet(res);
        }
        return p;
    }

    /*
    get all accessrights by profileId
     */
    public Profile getRightsByProfileId(int profileId) {
        Profile p = new Profile();

        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select * from Profile where profileId = ?");
                pstmt.setInt(1, profileId);
                res = pstmt.executeQuery();
                if (res.next()) {
                    p.setProfileId(profileId);
                    p.setProfileName(res.getString("profileName"));
                    p.setModifyGroup(res.getBoolean("modifyGroup"));
                    p.setCreateTopic(res.getBoolean("createTopic"));
                    p.setModifyTopics(res.getBoolean("modifyTopic"));
                    p.setPostNote(res.getBoolean("postingNote"));
                    p.setHideNote(res.getBoolean("hideNote"));
                    p.setCreateAssignment(res.getBoolean("createAssignment"));
                    p.setViewAssignment(res.getBoolean("viewAssignment"));
                    p.setAnswerAssignment(res.getBoolean("submitAnswer"));
                    p.setGradeAssignment(res.getBoolean("gradeAssignment"));
                    p.setViewGrades(res.getBoolean("viewGrades"));
                    p.setCreateQuiz(res.getBoolean("createQuiz"));
                    p.setViewQuiz(res.getBoolean("viewQuiz"));
                    p.setSendInvite(res.getBoolean("sendInvite"));
                    p.setAnswerQuiz(res.getBoolean("submitQuiz"));
                    p.setGradeQuiz(res.getBoolean("gradeQuiz"));
                    p.setStartVideoChat(res.getBoolean("startVideoChat"));
                    p.setStartDiscussionForum(res.getBoolean("startDiscussionForum"));
                    p.setCreatePoll(res.getBoolean("createPoll"));
                    p.setViewPoll(res.getBoolean("viewPoll"));
                    p.setAcceptInvite(res.getBoolean("acceptInvite"));
                }
            }
        } catch (SQLException e) {
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return p;
    }

    /*
    add a new profile
    output :
        true - successfully added
        false - unsuccessful
     */
    public String addNewProfile(Profile p) {
        int result = 0;
        String lastMinute = "";
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("INSERT INTO Profile ( `profileName`, `modifyGroup`, `createTopic`, `modifyTopic`, `postingNote`, `hideNote`, `createAssignment`, `viewAssignment`, `submitAnswer`, `gradeAssignment`, `viewGrades`, `createQuiz`, `viewQuiz`, `sendInvite`, `submitQuiz`, `gradeQuiz`, `startVideoChat`, `startDiscussionForum`, `createPoll`, `viewPoll`, `acceptInvite`) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
                //  pstmt.setInt(1, p.getProfileId());
                pstmt.setString(1, p.getProfileName());
                pstmt.setBoolean(2, p.isModifyGroup());
                pstmt.setBoolean(3, p.isCreateTopic());
                pstmt.setBoolean(4, p.isModifyTopics());
                pstmt.setBoolean(5, p.isPostNote());
                pstmt.setBoolean(6, p.isHideNote());
                pstmt.setBoolean(7, p.isCreateAssignment());
                pstmt.setBoolean(8, p.isViewAssignment());
                pstmt.setBoolean(9, p.isAnswerAssignment());
                pstmt.setBoolean(10, p.isGradeAssignment());
                pstmt.setBoolean(11, p.isViewGrades());
                pstmt.setBoolean(12, p.isCreateQuiz());
                pstmt.setBoolean(13, p.isViewQuiz());
                pstmt.setBoolean(14, p.isSendInvite());
                pstmt.setBoolean(15, p.isAnswerQuiz());
                pstmt.setBoolean(16, p.isGradeQuiz());
                pstmt.setBoolean(17, p.isStartVideoChat());
                pstmt.setBoolean(18, p.isStartDiscussionForum());
                pstmt.setBoolean(19, p.isCreatePoll());
                pstmt.setBoolean(20, p.isViewPoll());
                pstmt.setBoolean(21, p.isAcceptInvite());
                result = pstmt.executeUpdate();
                Statement S = con.createStatement();
                String query1 = "select  max(profileId) as profileId from Profile;";

                res1 = S.executeQuery(query1);
                res1.next();
                result = res1.getInt("profileId");
                pstmt1 = con.prepareStatement("select profileId,profileName from Profile where profileId=?;");
                pstmt1.setInt(1, result);
                res = pstmt1.executeQuery();
                res.next();
                lastMinute += res.getString("profileId");
                lastMinute += ":";
                lastMinute += res.getString("profileName");

            }
        } catch (SQLException e) {
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }

        return lastMinute;
    }


    /*
        Group Code needed for the webRTC Group Part.
        Matching the database with groupCode and accessing
        the groupCode and the email and username.           
     */
    public ArrayList<UserNameEmails> groupCode(String groupId) {
        ArrayList<UserNameEmails> userNameEmail = new ArrayList<UserNameEmails>();
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                ArrayList<Integer> uidList = new ArrayList<Integer>();
                pstmt = con.prepareStatement("select userId from UserGroup where groupId=?;");
                pstmt.setString(1, groupId);

                res = pstmt.executeQuery();
                while (res.next()) {
                    uidList.add(Integer.parseInt(res.getString("userId")));
                }

                UserNameEmails us = new UserNameEmails();

                for (int i = 0; i < uidList.size(); i++) {
                    pstmt = con.prepareStatement("select u.email, l.name from User u, Login_Info l where u.UserId=? and l.Login_Id = ?");
                    pstmt.setInt(1, uidList.get(i));
                    pstmt.setInt(2, uidList.get(i));
                    res = pstmt.executeQuery();

                    if (res.next()) {
                        us.setName(res.getString("name"));
                        us.setEmail(res.getString("email"));
                        us.setId(uidList.get(i));
                    }
                    userNameEmail.add(us);
                }
            }
        } catch (SQLException e) {
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return userNameEmail;
    }

    /**
     * ASSIGNMENT MODULE CREATED BY MANUSHI
     *
     *
     *
     *
     */
    private static PreparedStatement ps;

    public int insert(AssignmentBean r) {
        int status = 0;
        int result1 = 0;

        ArrayList<Integer> userIdList = new ArrayList<>();
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                HttpSession session = ServletActionContext.getRequest().getSession();
                Person person = (Person) session.getAttribute(Utility.USER_HANDLE);

                ps = con.prepareStatement("insert into group_assignment(gid,name,givenOn,lastSubmissionDate,attachment,referenceLink,description,topicName,uid) values(?,?,now(),?,?,?,?,?,?)");
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
                String s = r.getDatepicker() + " " + r.getHour() + ":" + r.getMin() + ":00";
                Date d = simpleDateFormat.parse(s);
                ((SimpleDateFormat) simpleDateFormat).applyPattern("yyyy-MM-dd HH:mm:ss");
                s = simpleDateFormat.format(d);

                Timestamp dateTime = Timestamp.valueOf(s);
                ps.setInt(1, r.getGroupid());
                ps.setString(2, r.getName());
                ps.setTimestamp(3, dateTime);
                ps.setString(4, r.getMyFileFileName());
                ps.setString(5, r.getReferenceLink());
                ps.setString(6, r.getDescription());
                ps.setString(7, r.getTopicName());
                ps.setInt(8, person.getLoginId());

                status = ps.executeUpdate();

                pstmt1 = con.prepareStatement("select max(id) as id from group_assignment where name= ?");
                pstmt1.setString(1, r.getName());
                res = pstmt1.executeQuery();
                if (res.next()) {
                    r.setId(res.getInt("id"));

                }

                pstmt2 = con.prepareStatement("insert into group_post(type,Toolid,gid) values(?,?,?)");
                pstmt2.setInt(1, 2);
                pstmt2.setInt(2, r.getId());
                pstmt2.setInt(3, r.getGroupid());

                result1 = pstmt2.executeUpdate();

                pstmt = con.prepareStatement("Select userId from UserGroup where groupId = ?");
                pstmt.setInt(1, r.getGroupid()); //set groupId
                res = pstmt.executeQuery();

                while (res.next()) {
                    userIdList.add(res.getInt("userId"));
                }

                Notification newNotification = null;
                for (int i = 0; i < userIdList.size(); i++) {
                    newNotification = new Notification();
                    newNotification.setUserId(userIdList.get(i));
                    newNotification.setGroupId(r.getGroupid());
                    newNotification.setNotificationType(0); //Let the parameter be 0 unless there is some change in standard notification format
                    newNotification.setTitle("New Assignment");
                    newNotification.setContent(r.getName());
                    addNotification(newNotification);
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closePStatement(ps);
            DBConnection.closePStatement(pstmt1);
            DBConnection.closePStatement(pstmt2);
            DBConnection.closeResultSet(res);
            DBConnection.closeDBConnection(con);
        }
        return status;

    }

    public AssignmentBean previousAssignmentInsert(int id) {

        AssignmentBean b = null;
        ResultSet rs = null;
        int status = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                ps = con.prepareStatement("select * from group_assignment where id =?");
                ps.setInt(1, id);

                rs = ps.executeQuery();

                if (rs.next()) {
                    b = new AssignmentBean();

                    b.setName(rs.getString("name"));
                    b.setDescription(rs.getString("description"));
                    b.setLastSubmissionDate(rs.getTimestamp("lastSubmissionDate"));

                    String dateTime = b.getLastSubmissionDate().toString();
                    String[] dateTimeArr = dateTime.split(" ");
                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    Date d = simpleDateFormat.parse(dateTime);
                    ((SimpleDateFormat) simpleDateFormat).applyPattern("MM/dd/yyyy");
                    String date = simpleDateFormat.format(d);
                    b.setDatepicker(date);

                    String[] timeArr = dateTimeArr[1].split(":");
                    b.setHour(timeArr[0]);
                    b.setMin(timeArr[1]);
                    b.setGivenOn(rs.getTimestamp("givenOn"));
                    b.setReferenceLink(rs.getString("referenceLink"));
                    b.setAttachment(rs.getString("attachment"));
                    b.setId(rs.getInt("id"));
                    b.setGid(rs.getInt("gid"));
                    b.setTopicName(rs.getString("topicName"));

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closePStatement(ps);
            DBConnection.closeDBConnection(con);
            DBConnection.closeResultSet(rs);
        }
        return b;
    }

    public ArrayList<AssignmentBean> viewAssignment(int gid) {
        AssignmentBean b = null;
        ResultSet rs = null;
        ArrayList<AssignmentBean> listOfAssignments = new ArrayList<AssignmentBean>();

        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select * from group_assignment where gid = ? order by id desc");
                pstmt.setInt(1, gid);
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    b = new AssignmentBean();
                    b.setName(rs.getString("name"));
                    b.setDescription(rs.getString("description"));
                    b.setLastSubmissionDate(rs.getTimestamp("lastSubmissionDate"));

                    String dateTime = b.getLastSubmissionDate().toString();
                    String[] dateTimeArr = dateTime.split(" ");
                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    Date d = simpleDateFormat.parse(dateTime);
                    ((SimpleDateFormat) simpleDateFormat).applyPattern("MM/dd/yyyy");
                    String date = simpleDateFormat.format(d);
                    b.setDatepicker(date);

                    String[] timeArr = dateTimeArr[1].split(":");
                    b.setHour(timeArr[0]);
                    b.setMin(timeArr[1]);
                    b.setGivenOn(rs.getTimestamp("givenOn"));
                    b.setReferenceLink(rs.getString("referenceLink"));
                    b.setTopicName(rs.getString("topicName"));
                    b.setId(rs.getInt("id"));
                    b.setGid(rs.getInt("gid"));
                    b.setAttachment(rs.getString("attachment"));
                    b.setUid(rs.getInt("uid"));
                    pstmt2 = con.prepareStatement("select Login_Info.name from Login_Info where Login_Info.LoginId= ?");
                    pstmt2.setInt(1, b.getUid());
                    res1 = pstmt2.executeQuery();
                    if (res1.next()) {
                        String foundType = res1.getString(1);
                        b.setCreatedBy(res1.getString("name"));

                    }

                    listOfAssignments.add(b);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
            return listOfAssignments;
        }
    }

    public ArrayList<AssignmentBean> viewAssignmentSubmission(int gid, int userid) {
        AssignmentBean b = null;
        ResultSet rs = null;
        ResultSet rs1 = null;
        ArrayList<AssignmentBean> listOfAssignmentForSubmission = new ArrayList<AssignmentBean>();

        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select * from group_assignment where gid = ? order by id desc");
                pstmt.setInt(1, gid);
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    b = new AssignmentBean();
                    b.setName(rs.getString("name"));
                    b.setDescription(rs.getString("description"));
                    b.setLastSubmissionDate(rs.getTimestamp("lastSubmissionDate"));

                    String dateTime = b.getLastSubmissionDate().toString();
                    String[] dateTimeArr = dateTime.split(" ");
                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    Date d = simpleDateFormat.parse(dateTime);
                    ((SimpleDateFormat) simpleDateFormat).applyPattern("MM/dd/yyyy");
                    String date = simpleDateFormat.format(d);
                    b.setDatepicker(date);

                    String[] timeArr = dateTimeArr[1].split(":");
                    b.setHour(timeArr[0]);
                    b.setMin(timeArr[1]);
                    b.setGivenOn(rs.getTimestamp("givenOn"));
                    b.setReferenceLink(rs.getString("referenceLink"));
                    b.setTopicName(rs.getString("topicName"));
                    b.setId(rs.getInt("id"));
                    b.setGid(rs.getInt("gid"));
                    b.setAttachment(rs.getString("attachment"));
                    b.setUid(rs.getInt("uid"));
                    pstmt2 = con.prepareStatement("select Login_Info.name from Login_Info where Login_Info.LoginId= ?");
                    pstmt2.setInt(1, b.getUid());
                    res1 = pstmt2.executeQuery();
                    if (res1.next()) {
                        String foundType = res1.getString(1);
                        b.setCreatedBy(res1.getString("name"));

                    }

                    pstmt1 = con.prepareStatement("Select assignment_submission.submittedFile AS FILE from  assignment_submission where assignment_submission.aid = ? and uid=?");
                    pstmt1.setInt(1, b.getId());
                    pstmt1.setInt(2, userid);
                    res = pstmt1.executeQuery();
                    if (res.next()) {
                        b.setSubmittedFile(res.getString("FILE"));

                    }

                    listOfAssignmentForSubmission.add(b);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(rs);
            DBConnection.closeResultSet(rs1);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
            return listOfAssignmentForSubmission;
        }
    }

    public ArrayList<AssignmentBean> viewAssignmentGrading(int gid) {
        AssignmentBean b = null;
        ResultSet rs = null;
        ArrayList<AssignmentBean> listOfAssignmentForGrading = new ArrayList<AssignmentBean>();

        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select * from group_assignment where gid = ? order by id desc");
                pstmt.setInt(1, gid);
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    b = new AssignmentBean();
                    b.setName(rs.getString("name"));
                    b.setDescription(rs.getString("description"));
                    b.setLastSubmissionDate(rs.getTimestamp("lastSubmissionDate"));

                    String dateTime = b.getLastSubmissionDate().toString();
                    String[] dateTimeArr = dateTime.split(" ");
                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    Date d = simpleDateFormat.parse(dateTime);
                    ((SimpleDateFormat) simpleDateFormat).applyPattern("MM/dd/yyyy");
                    String date = simpleDateFormat.format(d);
                    b.setDatepicker(date);

                    String[] timeArr = dateTimeArr[1].split(":");
                    b.setHour(timeArr[0]);
                    b.setMin(timeArr[1]);
                    b.setGivenOn(rs.getTimestamp("givenOn"));
                    b.setReferenceLink(rs.getString("referenceLink"));
                    b.setTopicName(rs.getString("topicName"));
                    b.setId(rs.getInt("id"));
                    b.setGid(rs.getInt("gid"));
                    b.setAttachment(rs.getString("attachment"));
                    b.setUid(rs.getInt("uid"));
                    pstmt2 = con.prepareStatement("select Login_Info.name from Login_Info where Login_Info.LoginId= ?");
                    pstmt2.setInt(1, b.getUid());
                    res1 = pstmt2.executeQuery();
                    if (res1.next()) {
                        String foundType = res1.getString(1);
                        b.setCreatedBy(res1.getString("name"));

                    }

                    pstmt1 = con.prepareStatement("Select COUNT(assignment_submission.uid) AS no_of_submission from  assignment_submission where assignment_submission.aid = ?");
                    pstmt1.setInt(1, b.getId());
                    res = pstmt1.executeQuery();
                    if (res.next()) {
                        b.setCount1(res.getInt("no_of_submission"));

                    }

                    listOfAssignmentForGrading.add(b);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
            return listOfAssignmentForGrading;
        }
    }

    //method for submitting assignment
    public int submitAssignment(AssignmentBean r) {
        int status = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                HttpSession session = ServletActionContext.getRequest().getSession();
                Person person = (Person) session.getAttribute(Utility.USER_HANDLE);

                ps = con.prepareStatement("insert into assignment_submission(aid,uid,submittedOn,submittedFile,grade,comment) values(?,?,now(),?,?,?)");

                ps.setInt(1, r.getGroupid());
                ps.setInt(2, person.getLoginId());
                ps.setString(3, r.getMyFileFileName());
                ps.setString(4, r.getGrade());
                ps.setString(5, r.getComment());

                status = ps.executeUpdate();

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closePStatement(ps);
            DBConnection.closeDBConnection(con);
        }
        return status;

    }

    public int updateSubmitAssignment(AssignmentBean r) {
        int status = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                HttpSession session = ServletActionContext.getRequest().getSession();
                Person person = (Person) session.getAttribute(Utility.USER_HANDLE);

                ps = con.prepareStatement("update assignment_submission set submittedFile = ?,comment = ?,grade=? where aid= ? and uid = ? ");
                ps.setString(1, r.getMyFileFileName());
                ps.setString(2, r.getComment());
                ps.setString(3, r.getGrade());
                ps.setInt(4, r.getGroupid());
                ps.setInt(5, person.getLoginId());

                status = ps.executeUpdate();

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closePStatement(ps);
            DBConnection.closeDBConnection(con);
        }
        return status;

    }

    //method for grading
    public ArrayList<AssignmentBean> viewStudentList(int id) {
        AssignmentBean b = null;
        ResultSet rs = null;
        ResultSet rs1 = null;
        ArrayList<AssignmentBean> listOfStudents = new ArrayList<AssignmentBean>();

        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select * from assignment_submission where aid = ?");
                pstmt.setInt(1, id);
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    b = new AssignmentBean();
                    b.setUid(rs.getInt("uid"));
                    String S = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(rs.getTimestamp("submittedOn"));
                    b.setTempDate(S);
                    b.setSubmittedFile(rs.getString("submittedFile"));
                    b.setId(rs.getInt("aid"));
                    b.setGrade(rs.getString("grade"));
                    b.setGradeBy(rs.getString("gradedBy"));
                    pstmt1 = con.prepareStatement("select Login_Info.name from Login_Info where Login_Info.LoginId= ?");
                    pstmt1.setInt(1, b.getUid());
                    res = pstmt1.executeQuery();
                    if (res.next()) {
                        String foundType = res.getString(1);
                        b.setUsername(res.getString("name"));

                    }
                    listOfStudents.add(b);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(rs);
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
            return listOfStudents;
        }
    }

    public AssignmentBean countSubmission(int id) {

        ResultSet res = null;
        ResultSet res1 = null;
        AssignmentBean b = null;

        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                b = new AssignmentBean();
                ps = con.prepareStatement("Select COUNT(uid) AS no_of_submission from assignment_submission where aid = ?");
                ps.setInt(1, id);
                res = ps.executeQuery();
                if (res.next()) {

                    b.setCount1(res.getInt("no_of_submission"));
                }
                pstmt = con.prepareStatement("Select COUNT(uid) AS no_of_graded_submission from  assignment_submission where aid = ? and grade is not null");
                pstmt.setInt(1, id);
                res1 = pstmt.executeQuery();
                if (res1.next()) {

                    b.setCount2(res1.getInt("no_of_graded_submission"));

                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closePStatement(ps);
            DBConnection.closeResultSet(res);
            DBConnection.closeResultSet(res1);
            DBConnection.closeDBConnection(con);
        }
        return b;

    }

    public int submitGrade(int Gradedby, int aid, String grade, int id) {
        AssignmentBean b = null;
        int status = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                b = new AssignmentBean();
                pstmt1 = con.prepareStatement("select Login_Info.name from Login_Info where Login_Info.LoginId= ?");
                pstmt1.setInt(1, Gradedby);
                res = pstmt1.executeQuery();
                if (res.next()) {

                    String foundType = res.getString(1);
                    b.setUsername(res.getString("name"));

                }
                ps = con.prepareStatement("UPDATE assignment_submission set grade= ?,gradedBy=? where uid= ? and aid=?");

                ps.setString(1, grade);
                ps.setString(2, b.getUsername());
                ps.setInt(3, id);
                ps.setInt(4, aid);

                status = ps.executeUpdate();

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closePStatement(ps);
            DBConnection.closeDBConnection(con);
        }
        return status;

    }

    public ArrayList<AssignmentBean> viewGradelist(int uid, int gid) {
        AssignmentBean b = null;
        ResultSet rs = null;
        ResultSet rs1 = null;
        ArrayList<AssignmentBean> listOfGrade = new ArrayList<AssignmentBean>();

        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select assignment_submission.gradedBy,assignment_submission.aid,assignment_submission.uid,assignment_submission.submittedOn,assignment_submission.submittedFile,assignment_submission.grade,group_assignment.name from assignment_submission,group_assignment where assignment_submission.aid =group_assignment.id and assignment_submission.uid = ? and group_assignment.gid=?");
                pstmt.setInt(1, uid);
                pstmt.setInt(2, gid);
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    b = new AssignmentBean();
                    b.setId(rs.getInt("aid"));
                    b.setUid(rs.getInt("uid"));
                    String S = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(rs.getTimestamp("submittedOn"));
                    b.setTempDate(S);
                    b.setSubmittedFile(rs.getString("submittedFile"));
                    b.setGrade(rs.getString("grade"));
                    b.setName(rs.getString("name"));
                    b.setGradeBy(rs.getString("gradedBy"));

//                    pstmt1 = con.prepareStatement("select group_assignment.name from group_assignment where group_assignment.id= ?");
//                    pstmt1.setInt(1, b.getId());
//                    res = pstmt1.executeQuery();
//                    if (res.next()) {
//                        String foundType = res.getString(1);
//                        b.setName(res.getString("name"));
//
//                    }
                    listOfGrade.add(b);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(rs);
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
            return listOfGrade;
        }
    }

    public ArrayList<AssignmentBean> postAssignment(int id) {

        AssignmentBean b = null;
        ResultSet rs = null;
        int status = 0;
        ArrayList<AssignmentBean> listOfPostAssignments = new ArrayList<AssignmentBean>();

        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                ps = con.prepareStatement("select * from group_assignment where gid =? order by id desc");
                ps.setInt(1, id);

                rs = ps.executeQuery();

                while (rs.next()) {
                    b = new AssignmentBean();

                    b.setName(rs.getString("name"));
                    b.setDescription(rs.getString("description"));
                    b.setLastSubmissionDate(rs.getTimestamp("lastSubmissionDate"));

                    String dateTime = b.getLastSubmissionDate().toString();
                    String[] dateTimeArr = dateTime.split(" ");
                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    Date d = simpleDateFormat.parse(dateTime);
                    ((SimpleDateFormat) simpleDateFormat).applyPattern("MM/dd/yyyy");
                    String date = simpleDateFormat.format(d);
                    b.setDatepicker(date);

                    String[] timeArr = dateTimeArr[1].split(":");
                    b.setHour(timeArr[0]);
                    b.setMin(timeArr[1]);
                    String S = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(rs.getTimestamp("givenOn"));
                    b.setPostDate(S);
                    b.setGivenOn(rs.getTimestamp("givenOn"));
                    b.setReferenceLink(rs.getString("referenceLink"));
                    b.setAttachment(rs.getString("attachment"));
                    b.setId(rs.getInt("id"));
                    b.setGid(rs.getInt("gid"));
                    //System.out.println(rs.getString("topicName"));
                    b.setTopicName(rs.getString("topicName"));
                    listOfPostAssignments.add(b);
                }
            }
        } catch (Exception e) {
            System.out.println("Exception " + e);
        } finally {
            DBConnection.closePStatement(ps);
            DBConnection.closeDBConnection(con);
            DBConnection.closeResultSet(rs);
        }

        return listOfPostAssignments;

    }

    /*analytics for assignment*/
 /*highest,average,lowest grades for a specific assignment*/
    public ArrayList<AssignmentBean> analyseGrades(int gid) {

        AssignmentBean b = null;
        ArrayList<AssignmentBean> listOfAllGrades = new ArrayList<AssignmentBean>();

        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {

                pstmt = con.prepareStatement(" select * from group_assignment where gid=?");
                pstmt.setInt(1, gid);
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    b = new AssignmentBean();
                    b.setId(rs.getInt("id"));
                    b.setName(rs.getString("name"));

                    ps = con.prepareStatement("select max(grade) as max_grade from assignment_submission where aid = ?");
                    ps.setInt(1, b.getId());
                    res = ps.executeQuery();
                    if (res.next()) {

                        b.setCount1(res.getInt("max_grade"));
                    }
                    pstmt1 = con.prepareStatement("Select min(grade) AS min_grade from  assignment_submission where aid = ? and grade is not null");
                    pstmt1.setInt(1, b.getId());
                    res1 = pstmt1.executeQuery();
                    if (res1.next()) {

                        b.setCount2(res1.getInt("min_grade"));

                    }
                    pstmt2 = con.prepareStatement("Select avg(grade) AS avg_grade from  assignment_submission where aid = ? and grade is not null");
                    pstmt2.setInt(1, b.getId());
                    res2 = pstmt2.executeQuery();
                    if (res2.next()) {

                        b.setCount3(res2.getFloat("avg_grade"));

                    }
                    listOfAllGrades.add(b);
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closePStatement(ps);
            DBConnection.closePStatement(pstmt);
            DBConnection.closePStatement(pstmt1);
            DBConnection.closeResultSet(res);
            DBConnection.closeResultSet(res1);
            DBConnection.closeResultSet(res2);
            DBConnection.closeDBConnection(con);
        }
        return listOfAllGrades;

    }

    public ArrayList<AssignmentBean> viewNumberOfSubmission(int gid) {
        System.out.println(gid);
        AssignmentBean b = null;
        ResultSet rs = null;
        ResultSet rs1 = null;
        ArrayList<AssignmentBean> listOfSubmission = new ArrayList<AssignmentBean>();

        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement(" select * from group_assignment where gid=?");
                pstmt.setInt(1, gid);
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    b = new AssignmentBean();
                    b.setId(rs.getInt("id"));
                    b.setName(rs.getString("name"));

                    pstmt1 = con.prepareStatement("select count(*) as no_of_submission from  assignment_submission where assignment_submission.aid = ?");
                    pstmt1.setInt(1, b.getId());
                    res = pstmt1.executeQuery();
                    if (res.next()) {
                        b.setCount1(res.getInt("no_of_submission"));
                    }

                    listOfSubmission.add(b);
                }

            }
        } catch (Exception e) {
            System.out.println("exception" + e);
        } finally {
            DBConnection.closeResultSet(rs);
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
            return listOfSubmission;
        }
    }

    /* analyis for late submission of assignments  */
    public ArrayList<AssignmentBean> viewLateSubmit(int gid) {
        AssignmentBean b = null;
        ResultSet rs = null;
        ArrayList<AssignmentBean> listOfLateSubmission = new ArrayList<AssignmentBean>();

        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select group_assignment.name,group_assignment.lastSubmissionDate,assignment_submission.uid,assignment_submission.submittedOn from assignment_submission,group_assignment where group_assignment.id=assignment_submission.aid and group_assignment.gid= ? and group_assignment.lastSubmissionDate < assignment_submission.submittedOn");
                pstmt.setInt(1, gid);
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    b = new AssignmentBean();
                    b.setName(rs.getString("name"));
                    b.setLastSubmissionDate(rs.getTimestamp("lastSubmissionDate"));

                    String dateTime = b.getLastSubmissionDate().toString();
                    String[] dateTimeArr = dateTime.split(" ");
                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    Date d = simpleDateFormat.parse(dateTime);
                    ((SimpleDateFormat) simpleDateFormat).applyPattern("yyyy-MM-dd");
                    String date = simpleDateFormat.format(d);
                    b.setDatepicker(date);

                    String[] timeArr = dateTimeArr[1].split(":");
                    b.setHour(timeArr[0]);
                    b.setMin(timeArr[1]);
                    b.setUid(rs.getInt("uid"));
                    b.setSubmittedOn(rs.getTimestamp("submittedOn"));
                    String S = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(rs.getTimestamp("submittedOn"));

                    b.setTempDate(S);
                    pstmt1 = con.prepareStatement("select Login_Info.name from Login_Info where Login_Info.LoginId= ?");
                    pstmt1.setInt(1, b.getUid());
                    res = pstmt1.executeQuery();
                    if (res.next()) {
                        String foundType = res.getString(1);
                        b.setUsername(res.getString("name"));
                    }
                    listOfLateSubmission.add(b);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return listOfLateSubmission;
    }

    /*Analysis of toppers for each assignment*/
    public ArrayList<AssignmentBean> viewToppers(int gid) {
        AssignmentBean b = null;
        ResultSet rs = null;
        ArrayList<AssignmentBean> listOfToppers = new ArrayList<AssignmentBean>();

        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement(" select id,name,uid from group_assignment where gid= ?");
                pstmt.setInt(1, gid);
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    b = new AssignmentBean();
                    b.setId(rs.getInt("id"));
                    b.setName(rs.getString("name"));
                    b.setUid(rs.getInt("uid"));
                    pstmt1 = con.prepareStatement("select Login_Info.name from Login_Info where Login_Info.LoginId= ?");
                    pstmt1.setInt(1, b.getUid());
                    res = pstmt1.executeQuery();
                    if (res.next()) {
                        String foundType = res.getString(1);
                        b.setGradeBy(res.getString("name"));
                    }
                    pstmt2 = con.prepareStatement("select max(assignment_submission.grade)as highest,assignment_submission.uid from assignment_submission where assignment_submission.aid=?");
                    pstmt2.setInt(1, b.getId());
                    res1 = pstmt2.executeQuery();
                    if (res1.next()) {
                        String foundType = res1.getString(1);
                        b.setGrade(res1.getString("highest"));
                        if (b.getGrade() != null) {

                            b.setUid(rs.getInt("uid"));
                            System.out.println(b.getUid());
                            pstmt3 = con.prepareStatement("select Login_Info.name from Login_Info where Login_Info.LoginId= ?");
                            pstmt3.setInt(1, b.getUid());
                            res2 = pstmt3.executeQuery();
                            if (res2.next()) {

                                b.setUsername(res2.getString("name"));
                                System.out.println(b.getUsername());
                            }
                        } else {
                            b.setUsername("Not Graded");
                            b.setGrade("Not Graded ");

                        }
                    }

                    listOfToppers.add(b);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return listOfToppers;
    }

    /*analytics of overall grade topic-wise*/
    public ArrayList<AssignmentBean> topicGrades(int gid) {

        AssignmentBean b = null;
        ArrayList<AssignmentBean> listOfTopicGrades = new ArrayList<AssignmentBean>();

        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {

                pstmt = con.prepareStatement(" select distinct(topicName) from group_assignment where gid=?");
                pstmt.setInt(1, gid);
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    b = new AssignmentBean();
                    b.setTopicName(rs.getString("topicName"));
                    pstmt1 = con.prepareStatement(" select avg(assignment_submission.grade) as average from assignment_submission,group_assignment where group_assignment.id=assignment_submission.aid and group_assignment.gid=? and topicName=?");
                    pstmt1.setInt(1, gid);
                    pstmt1.setString(2, b.getTopicName());
                    res1 = pstmt1.executeQuery();
                    if (res1.next()) {

                        b.setCount3(res1.getFloat("average"));

                    }

                    listOfTopicGrades.add(b);
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closePStatement(ps);
            DBConnection.closePStatement(pstmt);
            DBConnection.closePStatement(pstmt1);
            DBConnection.closeResultSet(res);
            DBConnection.closeResultSet(res1);
            DBConnection.closeResultSet(res2);
            DBConnection.closeDBConnection(con);
        }
        return listOfTopicGrades;

    }

    /*analytics for assignment */

 /*
    Add new notification
    output :
        true - notification added successfully
        false - notification could not be added
     */
    public boolean addNotification(Notification n) {
        int result = 0;
        int notificationId;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                //generate next notificationId
                pstmt = con.prepareStatement("select max(notificationId) as last_id from Notification");
                res = pstmt.executeQuery();
                if (res.next()) {
                    notificationId = res.getInt("last_id");
                } else {
                    notificationId = 0;
                }

                notificationId++; //notificationId of the current notification

                pstmt = con.prepareStatement("INSERT INTO Notification (`notificationId`, `uid`, `gid`, `title`, `content`, `notificationType`, `viewedFlag`, `dateTime`) VALUES (?, ?, ?, ?, ?, ?, '0', now())");
                pstmt.setInt(1, notificationId);
                pstmt.setInt(2, n.getUserId());
                pstmt.setInt(3, n.getGroupId());
                pstmt.setString(4, n.getTitle());
                pstmt.setString(5, n.getContent());
                pstmt.setInt(6, n.getNotificationType());

                result = pstmt.executeUpdate(); //Add notification to the database
            }
        } catch (SQLException e) {
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return result > 0;
    }

    /*
    Mark all notifications as read
    Output :
        0 - no unread notifications
        -1 - error in connection
        any other positive number represents the number of notifications read
     */
    public int readAllUnreadNotification(int userId) {
        int result = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("UPDATE Notification SET `viewedFlag`='1', `dateTime`=`dateTime` WHERE `uid`=? and `viewedFlag`='0'");
                pstmt.setInt(1, userId);

                result = pstmt.executeUpdate(); //flag marked the notification as read
            } else {
                result = -1;
            }
        } catch (SQLException e) {
            result = -1;
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return result;
    }

    /*
    Mark all notifications as read in that group
    Output :
        0 - no unread notifications
        -1 - error in connection
        any other positive number represents the number of notifications read in that group
     */
    public int readAllUnreadGroupNotification(int userId, int groupId) {
        int result = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("UPDATE Notification SET `viewedFlag`='1', `dateTime`=`dateTime` WHERE `uid`=? and `gid`=? and `viewedFlag`='0'");
                pstmt.setInt(1, userId);
                pstmt.setInt(2, groupId);

                result = pstmt.executeUpdate();
            }
        } catch (SQLException e) {
            result = -1;
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return result;
    }

    /*
    Get the notification content and store it in the ArrayList of notification bean
     */
    public ArrayList<Notification> getNotificationForUser(int userId) {
        ArrayList<Notification> notificationList = new ArrayList<Notification>();
        Notification n = null;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select * from Notification where uid = ?");
                pstmt.setInt(1, userId);
                res = pstmt.executeQuery(); //fetch all notifications for the user
                while (res.next()) { //traverse throught each notification
                    n = new Notification();
                    n.setNotificationId(res.getInt("notificationId"));
                    n.setUserId(userId);
                    n.setGroupId(res.getInt("gid"));
                    n.setTitle(res.getString("title"));
                    n.setContent(res.getString("content"));
                    n.setNotificationType(res.getInt("notificationType"));
                    n.setViewedFlag(res.getBoolean("viewedFlag"));
                    n.setDateTime(res.getTimestamp("dateTime"));
                    notificationList.add(n); //add the notification to the list
                }
            }
        } catch (SQLException e) {
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return notificationList;
    }

    /*
    Get only the notification content which are unread and store it in the ArrayList of notification bean
     */
    public ArrayList<Notification> getUnreadNotificationForUser(int userId) {
        ArrayList<Notification> notificationList = new ArrayList<Notification>();
        Notification n = null;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select * from Notification where uid = ? and viewedFlag = '0'");
                pstmt.setInt(1, userId);
                res = pstmt.executeQuery(); //fetch all notifications for the user
                while (res.next()) { //traverse throught each notification
                    n = new Notification();
                    n.setGroupId(res.getInt("gid"));
                    pstmt1 = con.prepareStatement("select name from GroupInfo where groupId = ?");
                    pstmt1.setInt(1, n.getGroupId());
                    res1 = pstmt1.executeQuery();
                    if (res1.next()) {
                        n.setGroupName(res1.getString("name"));
                    }
                    n.setTitle(res.getString("title"));
                    n.setNotificationId(res.getInt("notificationId"));
                    n.setUserId(userId);
                    n.setContent(res.getString("content"));
                    n.setNotificationType(res.getInt("notificationType"));
                    n.setViewedFlag(res.getBoolean("viewedFlag"));
                    n.setDateTime(res.getTimestamp("dateTime"));
                    //set the required date format
                    SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yy HH:mm");
                    n.setDateCustomFormat(dateFormat.format(n.getDateTime()));
                    notificationList.add(n); //add the notification to the list
                }
            }
        } catch (SQLException e) {
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return notificationList;
    }

    /*
    Get the notification Count of the unread notifications
    returns an integer denoting the number of unread notifications
     */
    public int getUnreadNotificationCountForUser(int userId) {
        int count = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("SELECT COUNT(notificationId) AS notificationCount FROM Notification WHERE uid = ? AND viewedFlag = '0'");
                pstmt.setInt(1, userId);
                res = pstmt.executeQuery();
                if (res.next()) {
                    count = res.getInt("notificationCount");
                }
            }
        } catch (SQLException e) {
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return count;
    }


    /*
   
     */
    public boolean respondToInvite(int userId, int groupId, int choice) {
        int result = 0;
        int profileId;
        if (choice > 0) {
            try {
                if (con == null || con.isClosed()) {
                    con = DBConnection.getDBConnection();
                }
                if (con != null) {
                    pstmt = con.prepareStatement("SELECT defaultProfileId from GroupInfo where groupId = ?");
                    pstmt.setInt(1, groupId);
                    res = pstmt.executeQuery();

                    if (res.next()) {
                        profileId = res.getInt("defaultProfileId");
                        pstmt = con.prepareStatement("INSERT INTO UserGroup (`groupId`, `userId`, `profileId`) VALUES (?, ?, ?)");
                        pstmt.setInt(1, userId);
                        pstmt.setInt(2, groupId);
                        pstmt.setInt(3, profileId);

                        /*
                        update notification for the updated invite status
                         */
//                        pstmt = con.prepareStatement("UPDATE Notification SET `viewedFlag`='1' WHERE `uid`=? and `gid`=? and `viewedFlag`='0'");
                        result = pstmt.executeUpdate();
                    }
                }
            } catch (SQLException e) {
                result = -1;
            } finally {
                DBConnection.closeResultSet(res);
                DBConnection.closePStatement(pstmt);
                DBConnection.closeDBConnection(con);
            }
        } else {

        }
        return false;
    }

    public ArrayList<String> searchGroup(String groupname) {
        ArrayList<String> groups = new ArrayList<String>();
        PreparedStatement ps;
        ResultSet rs;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {

                if (groupname.length() >= 1) {
                    ps = con.prepareStatement("select * from GroupInfo where name LIKE ? ;");
                    ps.setString(1, groupname + "%");
                    rs = ps.executeQuery();
                    while (rs.next()) {
                        StringBuilder groupName = new StringBuilder().append(rs.getString("name"));
                        Integer groupId = rs.getInt("groupId");
                        String group = groupName.toString() + ":" + String.valueOf(groupId) + ":";
                        groups.add(group);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(AngleUtility.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return groups;
    }


    /*
   
    Check for the Profile Names if they exist or not
   
     */
    public int getMatchingProfileName(String profileName) throws SQLException {
        Statement s = null;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                s = con.createStatement();
                String queryProfile = "select lower(profileName) from Profile where profileName=lower('" + profileName + "');";
                res = s.executeQuery(queryProfile);
                if (res.next()) {
                    return 1;
                } else {
                    return 0;
                }
            }
        } catch (Exception e) {
            System.err.println(e);
        } finally {
            s.close();
            con.close();

        }
        return 1;
    }

    public ArrayList<Profile> getListOfProfileForGroup(int groupId) {
        Profile p = null;
        ArrayList<Profile> listOfProfiles = new ArrayList<Profile>();
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select profileIdList from GroupInfo");
                res = pstmt.executeQuery();
                while (res.next()) {
                    String[] profileList = res.getString("profileIdList").split(":");
                    for (int i = 0; i < profileList.length; i++) {
                        p = new Profile();
                        pstmt1 = con.prepareStatement("select * from Profile where profileId = ?");
                        pstmt1.setInt(1, Integer.parseInt(profileList[i]));
                        res1 = pstmt.executeQuery();
                        p.setProfileId(res1.getInt("profileId"));
                        p.setProfileName(res1.getString("profileName"));
                        p.setModifyGroup(res1.getBoolean("modifyGroup"));
                        p.setCreateTopic(res1.getBoolean("createTopic"));
                        p.setModifyTopics(res1.getBoolean("modifyTopic"));
                        p.setPostNote(res1.getBoolean("postingNote"));
                        p.setHideNote(res1.getBoolean("hideNote"));
                        p.setCreateAssignment(res1.getBoolean("createAssignment"));
                        p.setViewAssignment(res1.getBoolean("viewAssignment"));
                        p.setAnswerAssignment(res1.getBoolean("submitAnswer"));
                        p.setGradeAssignment(res1.getBoolean("gradeAssignment"));
                        p.setViewGrades(res1.getBoolean("viewGrades"));
                        p.setCreateQuiz(res1.getBoolean("createQuiz"));
                        p.setViewQuiz(res1.getBoolean("viewQuiz"));
                        p.setSendInvite(res1.getBoolean("sendInvite"));
                        p.setAnswerQuiz(res1.getBoolean("submitQuiz"));
                        p.setGradeQuiz(res1.getBoolean("gradeQuiz"));
                        p.setStartVideoChat(res1.getBoolean("startVideoChat"));
                        p.setStartDiscussionForum(res1.getBoolean("startDiscussionForum"));
                        p.setCreatePoll(res1.getBoolean("createPoll"));
                        p.setViewPoll(res1.getBoolean("viewPoll"));
                        p.setAcceptInvite(res1.getBoolean("acceptInvite"));
                        listOfProfiles.add(p);
                    }
                }
            }
        } catch (SQLException e) {
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return listOfProfiles;
    }

    /*
        Adding user using group code
     */
    public int addUserUsingGroupCode(String code, String email) {
        int userId = -1, groupId = -1, profileId;
        ResultSet resultSet1, resultSet2;
        PreparedStatement ps1, ps2;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {

                ps1 = con.prepareStatement("select * from User where email=?;");
                ps1.setString(1, email);
                resultSet1 = ps1.executeQuery();
                ps2 = con.prepareStatement("select * from GroupInfo where groupCode=?;");
                ps2.setString(1, code);
                resultSet2 = ps2.executeQuery();
                if (resultSet2.next()) //group exists
                {
                    groupId = resultSet2.getInt("groupId");
                    profileId = resultSet2.getInt("defaultProfileId");
                    while (resultSet1.next()) {
                        userId = resultSet1.getInt("UserId");
                    }
                    if (userId >= 0) {
                        ps1 = con.prepareStatement("select * from UserGroup where groupId=? and userId=?;");
                        ps1.setInt(1, groupId);
                        ps1.setInt(2, userId);
                        resultSet1 = ps1.executeQuery();
                        if (resultSet1.next()) {
                            return -1;               //already in the group
                        } else {
                            // jforum

                            pstmt = con.prepareStatement("INSERT INTO jforum_user_groups (group_id,user_id) VALUES (?,?);");
                            pstmt.setInt(1, groupId);
                            pstmt.setInt(2, userId);
                            int status1 = pstmt.executeUpdate();

                            ps2 = con.prepareStatement("insert into UserGroup values(?, ?, ?);");
                            ps2.setInt(1, groupId);
                            ps2.setInt(2, userId);
                            ps2.setInt(3, profileId);
                            int status = ps2.executeUpdate();
                            return status;
                        }
                    }
                } else {
                    return 0;        //no such group exists
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(AngleUtility.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
        return 0;
    }

    /*
        Adding an already existing user using the invitation link sent through email
        adding in the group
     */
    public int addInvitedUser(String email, String groupCode) {
        int userId, status = 0;
        ResultSet resultSet1, resultSet2;
        PreparedStatement ps1, ps2;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                ps1 = con.prepareStatement("select * from User where email=?;");
                ps1.setString(1, email);
                resultSet1 = ps1.executeQuery();
                if (resultSet1.next()) //is a registered user
                {
                    userId = resultSet1.getInt("UserId");
                    status = addUserUsingGroupCode(groupCode, email);
                } else //new user
                {
                    status = 2;           //for new users
                }
                return status;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(AngleUtility.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return 0;
    }

    /*
        Adding a new user using the invitation link sent through email
        registering the new user and adding in the group
     */
    public Boolean insertNewUserUsingInvite(String email, String password, String name, String gender, String groupCode, int type) {

        if (insertNewUser(email, password, name, gender, type)) //adding new user
        {
            //  new user is signed up successfully
            //  now adding the user into the group
            return addUserUsingGroupCode(groupCode, email) == 1;          //then adding in the group
        } else {
            return false;
        }
    }

    /*                             
    *                               *
    *  Getting the Features List    *
    *                               *                             
    *                                                *
    *  Getting the Features List                     *                        
    *    And Corresponding  Options                  *
    *   According to User Profile                    *
     */
    public HashMap<String, ArrayList<HashMap<String, String>>> getFeatureList(int gid, int uid) {
        String featureList = "";
        int profileId = 0;
        String profileList = "";
        HashMap<String, ArrayList<HashMap<String, String>>> hs = new HashMap<String, ArrayList<HashMap<String, String>>>();
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {

                pstmt = con.prepareStatement("select featureList from GroupFeatures where groupId=?;");
                pstmt.setInt(1, gid);
                res = pstmt.executeQuery();
                if (res.next()) {
                    featureList = res.getString("featureList");
                }
                String sttr[] = featureList.split(":");
                System.out.println(featureList);
                for (int i = 0; i < sttr.length; i++) {
                    System.out.println("keys " + sttr[i]);
                    if (sttr[i].compareTo("null") != 0) {
                        hs.put(sttr[i], new ArrayList<HashMap<String, String>>());
                    }
                }
                pstmt1 = con.prepareStatement("select profileId from UserGroup where groupId=? and userId=?;");
                pstmt1.setInt(1, gid);
                pstmt1.setInt(2, uid);
                res1 = pstmt1.executeQuery();
                if (res1.next()) {
                    profileId = res1.getInt("profileId");
                }
                pstmt2 = con.prepareStatement("select * from Profile where profileId=?;");
                pstmt2.setInt(1, profileId);
                res2 = pstmt2.executeQuery();

                while (res2.next()) {
                    ArrayList<HashMap<String, String>> ar = new ArrayList<HashMap<String, String>>();

                    if (res2.getBoolean("postingNote")) {
                        if (hs.containsKey("Notes")) {
                            HashMap<String, String> hash = new HashMap<String, String>();
                            ar = hs.get("Notes");
                            hash.put("Post Note", "Post_Note");
                            ar.add(hash);
                            hs.put("Notes", ar);
                        }
                    }
                    if (res2.getBoolean("hideNote")) {
                        if (hs.containsKey("Notes")) {
                            HashMap<String, String> hash = new HashMap<String, String>();
                            ar = hs.get("Notes");
                            hash.put("View Note", "View_Note");
                            ar.add(hash);
                            hs.put("Notes", ar);
                        }
                    }
                    if (res2.getBoolean("createAssignment")) {
                        if (hs.containsKey("Assignment")) {
                            HashMap<String, String> hash = new HashMap<String, String>();
                            ar = hs.get("Assignment");
                            hash.put("Create Assignment", "Create_Assignment");
                            ar.add(hash);
                            hs.put("Assignment", ar);
                        }
                    }
                    if (res2.getBoolean("viewAssignment")) {
                        if (hs.containsKey("Assignment")) {
                            HashMap<String, String> hash = new HashMap<String, String>();
                            ar = hs.get("Assignment");
                            hash.put("View Assignment", "View_Assignment");
                            ar.add(hash);
                            hs.put("Assignment", ar);
                        }
                    }
                    if (res2.getBoolean("submitAnswer")) {
                        if (hs.containsKey("Assignment")) {
                            HashMap<String, String> hash = new HashMap<String, String>();
                            ar = hs.get("Assignment");
                            hash.put("Submit Assignment", "Submit_Assignment");
                            ar.add(hash);
                            hs.put("Assignment", ar);
                        }
                    }
                    if (res2.getBoolean("gradeAssignment")) {
                        if (hs.containsKey("Assignment")) {
                            HashMap<String, String> hash = new HashMap<String, String>();
                            ar = hs.get("Assignment");
                            hash.put("Grade Assignment", "Grade_Assignment");
                            ar.add(hash);
                            hs.put("Assignment", ar);
                        }
                    }
                    if (res2.getBoolean("viewGrades")) {
                        if (hs.containsKey("Assignment")) {
                            HashMap<String, String> hash = new HashMap<String, String>();
                            ar = hs.get("Assignment");
                            hash.put("View Grades", "View_Grades");
                            ar.add(hash);
                            hs.put("Assignment", ar);
                        }
                    }
                    if (res2.getBoolean("createQuiz")) {
                        if (hs.containsKey("Quiz")) {
                            HashMap<String, String> hash = new HashMap<String, String>();
                            ar = hs.get("Quiz");
                            hash.put("Create Quiz", "Create_Quiz");
                            ar.add(hash);
                            hs.put("Quiz", ar);
                        }
                    }
                    if (res2.getBoolean("viewQuiz")) {
                        if (hs.containsKey("Quiz")) {
                            HashMap<String, String> hash = new HashMap<String, String>();
                            ar = hs.get("Quiz");
                            hash.put("View Quiz", "View_Quiz");
                            ar.add(hash);
                            hs.put("Quiz", ar);
                        }
                    }
                    if (res2.getBoolean("submitQuiz")) {
                        if (hs.containsKey("Quiz")) {
                            HashMap<String, String> hash = new HashMap<String, String>();
                            ar = hs.get("Quiz");
                            hash.put("Submit Quiz", "Submit_Quiz");
                            ar.add(hash);
                            hs.put("Quiz", ar);
                        }
                    }
                    if (res2.getBoolean("gradeQuiz")) {
                        if (hs.containsKey("Quiz")) {
                            HashMap<String, String> hash = new HashMap<String, String>();
                            ar = hs.get("Quiz");
                            hash.put("Grade Quiz", "Grade_Quiz");
                            ar.add(hash);
                            hs.put("Quiz", ar);
                        }
                    }
                    if (res2.getBoolean("startVideoChat")) {
                        if (hs.containsKey("Video Chat")) {
                            System.out.println("Inside The Container");
                            HashMap<String, String> hash = new HashMap<String, String>();
                            ar = hs.get("Video Chat");
                            hash.put("Start Video", "Start_Video");
                            ar.add(hash);
                            hs.put("Video Chat", ar);
                            System.out.println(hs.get("Video Chat").size());
                        }
                    }
//                    if (res2.getBoolean("startDiscussionForum")) {
//                        if (hs.containsKey("Discuss")) {
//                            ar = hs.get("discuss");
//                            ar.add("Start");
//                            hs.put("discuss", ar);
//                        }
//                    }
                    if (res2.getBoolean("createPoll")) {
                        if (hs.containsKey("Poll")) {
                            HashMap<String, String> hash = new HashMap<String, String>();
                            ar = hs.get("Poll");
                            hash.put("Create Poll", "Create_Poll");
                            ar.add(hash);
                            hs.put("Poll", ar);
                        }
                    }
                    if (res2.getBoolean("viewPoll")) {
                        if (hs.containsKey("Poll")) {
                            HashMap<String, String> hash = new HashMap<String, String>();
                            ar = hs.get("Poll");
                            hash.put("View Answered Poll", "View_Answered_Poll");
                            ar.add(hash);
                            hs.put("Poll", ar);
                        }
                    }
                    if (res2.getBoolean("viewPoll")) {
                        if (hs.containsKey("Poll")) {
                            HashMap<String, String> hash = new HashMap<String, String>();
                            ar = hs.get("Poll");
                            hash.put("Answer Poll", "Answer_Poll");
                            ar.add(hash);
                            hs.put("Poll", ar);
                        }
                    }

                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(AngleUtility.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
        return hs;
    }

    /*
    *
    *  Getting the Features List
    *
     */

 /*
        Checking if a user is already added in a group or not
     */
    public boolean checkExistingUserInGroup(String email, Integer groupId) {
        PreparedStatement ps;
        ResultSet rs;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                ps = con.prepareStatement("select * from UserGroup, User where groupId=? AND email=? AND UserGroup.userId=User.UserId;");
                ps.setInt(1, groupId);
                ps.setString(2, email);
                rs = ps.executeQuery();
                if (rs.next()) // if present already, return true
                {
                    return true;
                }
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(AngleUtility.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return false;
    }

    /**
     * info for index page
     */
    public String countUserGroup() {
        PreparedStatement ps = null;
        ResultSet rs = null;
        String result = null;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                ps = con.prepareStatement("select count(UserId) as userCount from User;");

                rs = ps.executeQuery();
                if (rs.next()) // if present already, return true
                {
                    result = "" + rs.getInt("userCount");

                } else {
                    result = "" + 0;
                }
                ps = con.prepareStatement("select count(groupId) as groupCount from GroupInfo;");

                rs = ps.executeQuery();
                if (rs.next()) // if present already, return true
                {
                    result = result + ":" + rs.getInt("groupCount");

                } else {
                    result = result + ":" + 0;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

            DBConnection.closeResultSet(rs);
            DBConnection.closePStatement(ps);
            DBConnection.closeDBConnection(con);

        }
        return result;
    }

    /*
    **    notifying all the moderators
    **    when a new user joins through invitation 
     */
    public void notifyOwner(String userName, String groupCode) {
        Integer groupId = -1;
        ArrayList<Integer> userIdList = new ArrayList<>();
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                //  fetching all the moderators' Id
                pstmt = con.prepareStatement("Select ug.userId, ug.groupId from UserGroup ug, angledb1.Profile p where ug.groupId = (select groupId from GroupInfo where groupCode = ?) and ug.profileId = p.profileId and p.acceptInvite = '1';");
                pstmt.setString(1, groupCode);     //set groupCode
                res = pstmt.executeQuery();

                if (res.next()) {
                    userIdList.add(res.getInt("userId"));
                    groupId = res.getInt("groupId");
                }
                while (res.next()) {
                    userIdList.add(res.getInt("userId"));
                }

                Notification newNotification = null;

                if (groupId != -1) {
                    //  Adding notification for each moderator in that group               
                    for (int i = 0; i < userIdList.size(); i++) {
                        newNotification = new Notification();
                        newNotification.setUserId(userIdList.get(i));
                        newNotification.setGroupId(groupId);
                        newNotification.setNotificationType(0); //Let the parameter be 0 unless there is some change in standard notification format
                        newNotification.setTitle("New User Joined");
                        newNotification.setContent(userName + " has joined the group");
                        addNotification(newNotification);
                    }
                }
            }
        } catch (SQLException e) {
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
    }

    public ArrayList<Notes> displayNote(Notes n, Group currGroup) throws SQLException {
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt2 = con.prepareStatement("SELECT * FROM group_note where gid=? order by id desc");
                pstmt2.setInt(1, currGroup.getGroupId());
                rs = pstmt2.executeQuery();
                n = null;
                while (rs.next()) {
                    n = new Notes();
                    n.setNote(rs.getString("note"));
                    n.setCreatedById(rs.getInt("createdBy"));
                    n.setGroupName(currGroup.getGroupName());
                    n.setNoteId(rs.getInt("id"));
                    n.setReferenceLink(rs.getString("noteLink"));

                    String S = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(rs.getTimestamp("date_time"));
                    n.setDate_time(S);

                    n.setMyFileFileName(rs.getString("noteFile"));

                    pstmt3 = con.prepareStatement("SELECT name FROM Login_Info where LoginId=?");
                    pstmt3.setInt(1, n.getCreatedById());

                    res1 = pstmt3.executeQuery();
                    while (res1.next()) {
//                      //  System.out.println("name"+res1.getString("name"));
                        n.setName(res1.getString("name"));
                    }
                    datalist.add(n);

                }

            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("error in displayNote");
        } finally {
            DBConnection.closeResultSet(res1);
            DBConnection.closeResultSet(rs);
            DBConnection.closePStatement(pstmt2);
            DBConnection.closePStatement(pstmt3);
            DBConnection.closeDBConnection(con);

        }

        return datalist;
    }

    public String insertNote(Notes n) {
        int result1 = 0;
        int result = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {

                ps = con.prepareStatement("insert into group_note(note,gid,date_time,noteLink,noteFile,createdBy) values(?,?,NOW(),?,?,?)");
                ps.setString(1, n.getNote());
                ps.setInt(2, n.getGroupId());
                ps.setString(3, n.getReferenceLink());
                ps.setString(4, n.getMyFileFileName());
                ps.setInt(5, n.getCreatedById());
                result = ps.executeUpdate();
                pstmt1 = con.prepareStatement("select max(id) as id from group_note where note=?");
                pstmt1.setString(1, n.getNote());
                res2 = pstmt1.executeQuery();
                while (res2.next()) {
                    n.setNoteId(res2.getInt("id"));
                }
                //System.out.println("note id"+n.getNoteId());
                pstmt2 = con.prepareStatement("insert into group_post(type,Toolid,gid) values(?,?,?)");
                pstmt2.setInt(1, 1);
                pstmt2.setInt(2, n.getNoteId());
                pstmt2.setInt(3, n.getGroupId());

                result1 = pstmt2.executeUpdate();
                pstmt = con.prepareStatement("Select userId from UserGroup where groupId = ?");
                pstmt.setInt(1, n.getGroupId()); //set groupId
                res = pstmt.executeQuery();

                while (res.next()) {
                    userIdList.add(res.getInt("userId"));
                }

                Notification newNotification = null;

//Add notification for each user in group              
                for (int i = 0; i < userIdList.size(); i++) {
                    newNotification = new Notification();
                    newNotification.setUserId(userIdList.get(i));
                    newNotification.setGroupId(n.getGroupId());
                    newNotification.setNotificationType(0); //Let the parameter be 0 unless there is some change in standard notification format
                    newNotification.setTitle("New Note");
                    newNotification.setContent(n.getNote());
                    addNotification(newNotification);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res2);
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(ps);
            DBConnection.closePStatement(pstmt1);
            DBConnection.closePStatement(pstmt2);
            DBConnection.closeDBConnection(con);
        }
        return (Integer.toString(result));
    }

    /*   
            Getting group Id with the given group code   
     */
    public int getGroupId(String groupName) {
        int groupId = -1;
        PreparedStatement ps;
        ResultSet rs;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                ps = con.prepareStatement("select groupId from groupInfo where name= ?;");
                ps.setString(1, groupName);
                rs = ps.executeQuery();
                if (rs.next()) {
                    groupId = rs.getInt("groupId");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeDBConnection(con);
        }
        return groupId;
    }

    public ArrayList<Notes> viewNotes(int gid) {
        Notes n = null;
        ResultSet rs = null;

        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select * from group_note where gid = ? order by id desc");
                pstmt.setInt(1, gid);
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    n = new Notes();
                    n.setNote(rs.getString("note"));
                    n.setCreatedById(rs.getInt("createdBy"));
                    //n.setGroupName(currGroup.getGroupName());
                    n.setNoteId(rs.getInt("id"));
                    n.setReferenceLink(rs.getString("noteLink"));

                    String S = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(rs.getTimestamp("date_time"));
                    n.setDate_time(S);

                    n.setMyFileFileName(rs.getString("noteFile"));

                    listOfNotes.add(n);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(ps);
            DBConnection.closeDBConnection(con);
            return listOfNotes;
        }
    }

    public String getJoinInfo() {

        String result = null;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select * from JoinConference;");

                res = pstmt.executeQuery();
                if (res.next()) // if present already, return true
                {
                    result = "" + res.getString("NickName");
                    result += ":" + res.getString("email");

                } else {
                    result = "0";
                }
                pstmt = con.prepareStatement("delete from JoinConference;");
                pstmt.execute();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
            System.out.println("res :" + result);
        }
        return result;
    }

    /*
           To change user name of a user
     */
    public boolean changeUserName(String email, String userName) {
        PreparedStatement ps;
        Integer result = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                ps = con.prepareStatement("UPDATE Login_Info SET name=? where LoginId = (Select UserId from User where email=?) ;");
                ps.setString(1, userName);
                ps.setString(2, email);
                result = ps.executeUpdate();
                return result > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(AngleUtility.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return false;
    }

    /*
           To change the password of a user
     */
    public boolean changePassword(String email, String oldPassword, String newPassword) {
        PreparedStatement ps;
        Integer result = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                ps = con.prepareStatement("UPDATE User SET password=md5(?) where User.email=? AND User.password=md5(?);");
                ps.setString(1, newPassword);
                ps.setString(2, email);
                ps.setString(3, oldPassword);
                result = ps.executeUpdate();
                return result > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(AngleUtility.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return false;
    }

    /*
    *    To create a poll
    *   graph_type :  1 for Bar Graph, 2 for Pie Chart
     */
    public boolean createPoll(Integer userId, Integer groupId, String question, Date end_date, Integer graph_type, String[] optionsArray) {
        Integer pollId = -1, optionId = -1;
        Integer status = 0, count = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                con.setAutoCommit(false);
                pstmt = con.prepareStatement("select max(pollId) as last_id from PollData");
                res = pstmt.executeQuery();
                if (res.next()) {
                    pollId = res.getInt("last_id");
                } else {
                    pollId = 0;
                }
                pollId++;
                if (pollId > 0) {
                    ps = con.prepareStatement("insert into PollData (`pollId`, `groupId`, `question`, `createdOn`, `endDate`, `createdBy`, `graphType`) values (?, ?, ?, now(), ?, ?, ?)");
                    ps.setInt(1, pollId);
                    ps.setInt(2, groupId);
                    ps.setString(3, question);
                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    ps.setTimestamp(4, Timestamp.valueOf(simpleDateFormat.format(end_date)));
                    ps.setInt(5, userId);
                    ps.setInt(6, graph_type);
                    status = ps.executeUpdate();
                    if (status > 0) {
                        pstmt = con.prepareStatement("select max(optionId) as last_id from PollOptions");
                        res = pstmt.executeQuery();
                        if (res.next()) {
                            optionId = res.getInt("last_id");
                        } else {
                            optionId = 0;
                        }
                        optionId++;
                        if (optionId > 0) {
                            for (int i = 0; i < optionsArray.length; i++) {
                                ps = con.prepareStatement("insert into PollOptions (`optionId`, `pollId`,`option`) values(?, ?, ?)");
                                ps.setInt(1, optionId);
                                ps.setInt(2, pollId);
                                ps.setString(3, optionsArray[i]);
                                status = ps.executeUpdate();
                                if (status > 0) {
                                    count++;
                                }
                                optionId++;
                            }
                            if (count == optionsArray.length) {
                                con.commit();
                                return true;
                            } else {
                                return false;
                            }
                        } else {
                            con.rollback();
                        }
                    } else {
                        con.rollback();
                    }
                } else {
                    return false;
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                con.setAutoCommit(true);
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(AngleUtility.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
        return false;
    }

    public int insertJoinInfo(String email, String nickName) {

        int result = 0;

        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("insert into JoinConference values(?,?);");
                pstmt.setString(1, email);
                pstmt.setString(2, nickName);
                result = pstmt.executeUpdate();

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return result;
    }

    /*
    *   Function to get all the groups
     */
    public ArrayList<UserGroup> getAllGroups() {

        ArrayList<UserGroup> allGroups = new ArrayList<UserGroup>();

        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                ps = con.prepareStatement("select * from GroupInfo;");
                rs = ps.executeQuery();
                while (rs.next()) {
                    UserGroup group = new UserGroup();
                    group.setGroupId(rs.getInt("groupId"));
                    group.setDescription(rs.getString("description"));
                    group.setGroupCode(rs.getString("groupCode"));
                    group.setGroupName(rs.getString("name"));
                    int lockStatus = rs.getInt("lockState");
                    if (lockStatus == 1) {
                        group.setLockedState("Private");
                    } else {
                        group.setLockedState("Public");
                    }
                    ps = con.prepareStatement("select Count(*) as Count from UserGroup where groupId = ?;");
                    ps.setInt(1, group.getGroupId());
                    res = ps.executeQuery();
                    if (res.next()) {
                        group.setNoOfMembers(res.getInt("Count"));
                    }
                    allGroups.add(group);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeDBConnection(con);
            DBConnection.closePStatement(ps);
            DBConnection.closeResultSet(rs);
        }
        System.out.println(allGroups);
        return allGroups;
    }

    /*
    Function to get all members of a group
     */
    public ArrayList<UserGroup> getAllMembers(int groupId) {
        ArrayList<UserGroup> members = new ArrayList<UserGroup>();
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                ps = con.prepareStatement("Select name,profileId,userId,profileName from (select UserGroup.userId, UserGroup.profileId , Profile.profileName  from Profile natural join UserGroup where UserGroup.groupId=?) as First , Login_Info  where  First.userId=Login_Info.LoginId");
                ps.setInt(1, groupId);
                System.out.println(ps);
                rs = ps.executeQuery();
                while (rs.next()) {
                    UserGroup member = new UserGroup();
                    member.setProfileName(rs.getString("profileName"));
                    member.setUserName(rs.getString("name"));
                    member.setProfileId(rs.getInt("profileId"));
                    member.setUserId(rs.getInt("userId"));
                    System.out.println("adsbkjadskjbkbjadskjbkjbadskjbkjadsbkjasdbkjasdbkjasb" + rs.getInt("profileId"));
                    members.add(member);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeDBConnection(con);
            DBConnection.closePStatement(ps);
            DBConnection.closeResultSet(rs);
        }
        System.out.println(members.size());
        return members;
    }

    public HashMap<Integer, String> listAllAvailableProfiles(int groupId) {
        HashMap<Integer, String> profiles = new HashMap<Integer, String>();
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                ps = con.prepareStatement("select profileIdList from GroupInfo where groupId=?;");
                ps.setInt(1, groupId);
                rs = ps.executeQuery();
                if (rs.next()) {
                    String profileList = rs.getString("profileIdList");
                    String[] profileIds = profileList.split(":");
                    for (int i = 0; i < profileIds.length; i++) {
                        ps = con.prepareStatement("select profileName from Profile where profileId=?;");
                        ps.setInt(1, Integer.parseInt(profileIds[i]));
                        rs = ps.executeQuery();
                        if (rs.next()) {
                            profiles.put(Integer.parseInt(profileIds[i]), rs.getString("profileName"));
                        }
                    }
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeDBConnection(con);
            DBConnection.closePStatement(ps);
            DBConnection.closeResultSet(rs);
        }
        return profiles;

    }

    public String getFeatures(int groupId) {
        String Features = "";
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                ps = con.prepareStatement("Select featureList from GroupFeatures where groupId = ?");
                ps.setInt(1, groupId);
                rs = ps.executeQuery();
                // System.out.println("hasdhasd");
                if (rs.next()) {
                    Features = rs.getString("featureList");
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

            DBConnection.closeResultSet(rs);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return Features;
    }

    /*
        To get all the polls of a group
     */
    public Integer getAllPolls(int groupId) {
        Integer totalPolls = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select Count(*) as Count from PollData where groupId = ?");
                pstmt.setInt(1, groupId);
                res = pstmt.executeQuery();
                if (res.next()) {
                    totalPolls = res.getInt("Count");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(rs);
            DBConnection.closePStatement(ps);
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return totalPolls;
    }

    /*
        To get all the submitted polls of a user of a particular group
     */
    public ArrayList<Poll> getSubmittedPolls(int groupId, int userId) {
        PreparedStatement ps2;
        ResultSet rs2;
        ArrayList<Poll> pollList = new ArrayList<Poll>();
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select * from PollData pd, PollVotes pv where pd.groupId = ? and pd.pollId = pv.pollId and pv.userId IN (select userId from PollVotes p where pd.pollId = p.pollId and p.userId=?);");
                pstmt.setInt(1, groupId);
                pstmt.setInt(2, userId);
                res = pstmt.executeQuery();
                while (res.next()) {
                    Poll poll = new Poll();
                    poll.setPollId(res.getInt("pollId"));
                    poll.setQuestion(res.getString("question"));
                    poll.setCreatedBy(res.getInt("createdBy"));
                    poll.setCreatedOn(res.getTimestamp("createdOn"));
                    poll.setEndDate(res.getTimestamp("endDate"));
                    poll.setGraphType(res.getInt("graphType"));
                    poll.setSelectedOption(res.getInt("optionId"));
                    poll.setGroupId(groupId);

                    ps = con.prepareStatement("select * from PollOptions where pollId = ?");
                    ps.setInt(1, poll.getPollId());
                    rs = ps.executeQuery();
                    ArrayList<Integer> noOfVotes = new ArrayList<Integer>();
                    ArrayList<Integer> optionsId = new ArrayList<Integer>();
                    ArrayList<String> options = new ArrayList<String>();
                    while (rs.next()) {
                        optionsId.add(rs.getInt("optionId"));
                        options.add(rs.getString("option"));
                        ps2 = con.prepareStatement("Select Count(*) as Count from PollVotes where optionId=?;");
                        ps2.setInt(1, rs.getInt("optionId"));
                        rs2 = ps2.executeQuery();
                        if (rs2.next()) {
                            int count = rs2.getInt("Count");
                            noOfVotes.add(count);
                        }
                    }
                    poll.setNoOfVotes(noOfVotes);
                    poll.setOptions(options);
                    poll.setOptionsId(optionsId);
                    pollList.add(poll);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(rs);
            DBConnection.closePStatement(ps);
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return pollList;
    }

    /*
        To get all the unanswered polls of a user of a particular group
     */
    public ArrayList<Poll> getUnansweredPolls(int groupId, int userId) {
        PreparedStatement ps2;
        ResultSet rs2;
        ArrayList<Poll> pollList = new ArrayList<Poll>();
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select * from PollData p where groupId = ? and Date(p.endDate) >= CURDATE() and NOT EXISTS (select * from PollData pd, PollVotes pv where p.pollId = pv.pollId and pv.userId=?)");
                pstmt.setInt(1, groupId);
                pstmt.setInt(2, userId);
                res = pstmt.executeQuery();
                while (res.next()) {
                    Poll poll = new Poll();
                    poll.setPollId(res.getInt("pollId"));
                    poll.setQuestion(res.getString("question"));
                    poll.setCreatedBy(res.getInt("createdBy"));
                    poll.setCreatedOn(res.getTimestamp("createdOn"));
                    poll.setEndDate(res.getTimestamp("endDate"));
                    poll.setGraphType(res.getInt("graphType"));
                    poll.setGroupId(groupId);

                    ps = con.prepareStatement("select * from PollOptions where pollId = ?");
                    ps.setInt(1, poll.getPollId());
                    rs = ps.executeQuery();
                    ArrayList<Integer> noOfVotes = new ArrayList<Integer>();
                    ArrayList<Integer> optionsId = new ArrayList<Integer>();
                    ArrayList<String> options = new ArrayList<String>();
                    while (rs.next()) {
                        optionsId.add(rs.getInt("optionId"));
                        options.add(rs.getString("option"));
                        ps2 = con.prepareStatement("Select Count(*) as Count from PollVotes where optionId=?;");
                        ps2.setInt(1, rs.getInt("optionId"));
                        rs2 = ps2.executeQuery();
                        if (rs2.next()) {
                            int count = rs2.getInt("Count");
                            noOfVotes.add(count);
                        }
                    }
                    poll.setNoOfVotes(noOfVotes);
                    poll.setOptions(options);
                    poll.setOptionsId(optionsId);
                    pollList.add(poll);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(rs);
            DBConnection.closePStatement(ps);
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return pollList;
    }

    /*
        To submit a vote for a poll
     */
    public int votePoll(int pollId, int optionId, int userId) {
        int voteId = 0;
        int result = -1;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select max(voteId) as last_id from PollVotes");
                res = pstmt.executeQuery();
                if (res.next()) {
                    voteId = res.getInt("last_id");
                } else {
                    voteId = 0;
                }
                voteId++;

                pstmt = con.prepareStatement("INSERT INTO PollVotes (`voteId`, `pollId`, `optionId`, `userId`, `voteTime`) VALUES (?, ?, ?, ?, now())");
                pstmt.setInt(1, voteId);
                pstmt.setInt(2, pollId);
                pstmt.setInt(3, optionId);
                pstmt.setInt(4, userId);
                result = pstmt.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return result;
    }

    /*       
    Create new Quiz
    output :
        1#QuizId - quiz data saved successfully
        0#QuizId - saving quiz data unsuccessful
        empty string - unable to connect to database
     */
    public String saveQuizDetails(int userId, int groupId, String title, String dateStr) {
//        int userId = 4;
        Timestamp qdate = null;
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
            Date parsedDate = dateFormat.parse(dateStr);
            qdate = new Timestamp(parsedDate.getTime());
        } catch (Exception e) {
        }
        int result = 0;
        String resultStr = "";
        int Qid = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select max(QuizId) as last_id from Quiz");
                res = pstmt.executeQuery();
                if (res.next()) {
                    Qid = res.getInt("last_id");
                } else {
                    Qid = 0;
                }
                Qid++;
                pstmt = con.prepareStatement("INSERT INTO Quiz (QuizId, groupId, title, qdate, createdOn, createdBy) VALUES (?, ?, ?, ?, now(), ?)");
                pstmt.setInt(1, Qid);
                pstmt.setInt(2, groupId);
                pstmt.setString(3, title);
                pstmt.setTimestamp(4, qdate);
                pstmt.setInt(5, userId);
                result = pstmt.executeUpdate();
                resultStr = Integer.toString(result) + "#" + Integer.toString(Qid);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return resultStr;
    }

    /*
    Gives analysis of the number for voters in a poll
    output :
        -1 - error in db connection
        any other non negative number - number of voters in the poll
     */
    public int votersInPoll(int pollId) {
        int noOfVotes = -1;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select count(voteId) as votes from PollVotes where pollId = ?");
                pstmt.setInt(1, pollId);
                res = pstmt.executeQuery();
                if (res.next()) {
                    noOfVotes = res.getInt("votes");
                } else {
                    noOfVotes = 0;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return noOfVotes;
    }

    /*
    Gives analysis of the number for non voters in a poll
    output :
        -1 - error in db connection
        any other non negative number - number of members who did not in the poll
     */
    public int nonVotersInPoll(int pollId) {
        int noOfUsers = -1;
        int nonVoters = -1;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select count(userId) as noOfUsers from UserGroup where groupId = (select groupId from PollData where pollId = ?)");
                pstmt.setInt(1, pollId);
                res = pstmt.executeQuery();
                if (res.next()) {
                    noOfUsers = res.getInt("noOfUsers");
                } else {
                    noOfUsers = 0;
                }
            }
            if (noOfUsers > 0) {
                nonVoters = noOfUsers - votersInPoll(pollId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return nonVoters;
    }

    /*
        To get the votes count for each option for the poll
            -   using poll id
     */
    public HashMap<Integer, HashMap<String, Integer>> getOptionsVoteCount(int pollId) {
        HashMap<Integer, HashMap<String, Integer>> options = new HashMap<Integer, HashMap<String, Integer>>();
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select * from PollOptions where  pollId = ?;");
                pstmt.setInt(1, pollId);
                res = pstmt.executeQuery();
                while (res.next()) {
                    HashMap<String, Integer> option = new HashMap<String, Integer>();
                    String optionsName = res.getString("option");
                    int optionId = res.getInt("optionId");
                    ps = con.prepareStatement("select count(*) as count from PollVotes where optionId=?;");
                    ps.setInt(1, optionId);
                    rs = ps.executeQuery();
                    int votesCount = 0;
                    if (rs.next()) {
                        votesCount = rs.getInt("count");
                    }
                    option.put(optionsName, votesCount);
                    options.put(optionId, option);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return options;
    }

    /*
    To get all the data of a poll 
                -   using group Id
     */
    public ArrayList<PollAnalytics> getAllPollsOfGroup(Integer groupId) {
        PreparedStatement preparedStatement = null;
        ResultSet resultSet1 = null;
        ArrayList<PollAnalytics> poll = new ArrayList<PollAnalytics>();
        try {
            Connection con2 = null;
            if (con2 == null || con2.isClosed()) {
                con2 = DBConnection.getDBConnection();
            }
            if (con2 != null) {
                preparedStatement = con2.prepareStatement("select * from PollData where groupId=?;");
                preparedStatement.setInt(1, groupId);
                resultSet1 = preparedStatement.executeQuery();
                while (resultSet1.next()) {
                    PollAnalytics p = new PollAnalytics();
                    HashMap<Integer, HashMap<String, Integer>> options = new HashMap<Integer, HashMap<String, Integer>>();
                    p.setPollId(resultSet1.getInt("pollId"));
                    p.setGroupId(resultSet1.getInt("groupId"));
                    p.setCreatedBy(resultSet1.getInt("createdBy"));
                    p.setCreatedOn(resultSet1.getTimestamp("createdOn"));
                    p.setQuestion(resultSet1.getString("question"));
                    p.setEndDate(resultSet1.getTimestamp("endDate"));
                    int voters = votersInPoll(p.getPollId());
                    int non_voters = nonVotersInPoll(p.getPollId());
                    p.setVotersCount(voters);
                    p.setNonVotersCount(non_voters);
                    options = getOptionsVoteCount(p.getPollId());
                    p.setOptions(options);
                    poll.add(p);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(resultSet1);
            DBConnection.closePStatement(preparedStatement);
            DBConnection.closeDBConnection(con);
        }
        return poll;
    }

    /*
    Gives analysis of the number for votes given by the user in that group
    output :
        -1 - error in db connection
        any other non negative number - number of votes by the user in a particular group
     */
    public int votesByUserInGroup(int userId, int groupId) {
        int noOfVotes = -1;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select count(voteId) as votes from PollVotes where userId = ? and pollId IN (select pollId from PollData where groupId = ?)");
                pstmt.setInt(1, userId);
                pstmt.setInt(2, groupId);
                res = pstmt.executeQuery();
                if (res.next()) {
                    noOfVotes = res.getInt("votes");
                } else {
                    noOfVotes = 0;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return noOfVotes;
    }

    /*
        Function to save question details for quiz
     */
    public boolean saveQuestionDetails(Integer quizId, String question, Integer marks, String[] option, Integer answerId) {
        Integer questionId = 0, optionId = 0, count = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select max(questionId) as max from QuizQuestion;");
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    questionId = rs.getInt("max");
                }
                questionId++;
                pstmt1 = con.prepareStatement("select max(optionId) as max from QuizOption;");
                res2 = pstmt1.executeQuery();
                if (res2.next()) {
                    optionId = res2.getInt("max");
                }
                optionId++;
                answerId += optionId;
                for (int i = 0; i < option.length; i++) {
                    pstmt = con.prepareStatement("INSERT INTO `QuizOption` (`optionId`, `questionId`, `option`) VALUES (?, ?, ?);");
                    pstmt.setInt(1, optionId);
                    pstmt.setInt(2, questionId);
                    pstmt.setString(3, option[i]);
                    res1 = pstmt.executeQuery();
                    if (res1.next()) {
                        count++;
                    }
                    optionId++;
                }
                if (count == option.length) {
                    ps = con.prepareStatement("insert into QuizQuestion (questionId, quizId, question, marks, answer) values(?, ?, ?, ?, ?);");
                    ps.setInt(1, questionId);
                    ps.setInt(2, quizId);
                    ps.setString(3, question);
                    ps.setInt(4, marks);
                    ps.setInt(5, answerId);
                    res = ps.executeQuery();
                    if (res.next()) {
                        return true;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return false;
    }

    public int getProfileId(int gid, int uid) {
        int profileId = 0;
        try {

            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("Select profileId from UserGroup where groupId=? and userId=?");
                pstmt.setInt(1, gid);
                pstmt.setInt(2, uid);
                res = pstmt.executeQuery();
                if (res.next()) {
                    profileId = res.getInt("profileId");
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return profileId;

    }

    public String updateRoleOfMember(int gid, int uid, int pid) {
        int status = 0;
        String profileName = "";
        System.out.println(gid + " " + uid + " " + pid);
        try {

            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                ps = con.prepareStatement("UPDATE UserGroup set profileId = ? where groupId=? and userId=?");
                ps.setInt(1, pid);
                ps.setInt(2, gid);
                ps.setInt(3, uid);
                status = ps.executeUpdate();

                pstmt = con.prepareStatement("Select profileName from Profile where profileId=?");
                pstmt.setInt(1, pid);
                res = pstmt.executeQuery();
                if (res.next()) {
                    profileName = res.getString("profileName");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closePStatement(ps);
            DBConnection.closeDBConnection(con);
        }
        return profileName;
    }

    // Function to get details of a group to copy it's settings
    /*
    get group details by the groupId
     */
    public Group getGroupById(int gid) {
        Group g = new Group();
        Statement stmt = null;
        ArrayList<String> Features;
        ArrayList<Profile> Profiles = new ArrayList<Profile>();
        String profiles = "";
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select * from GroupInfo where GroupId = ?");
                pstmt.setInt(1, gid);
                res = pstmt.executeQuery();

                if (res.next()) {

                    g.setGroupId(gid);
                    g.setLockState(res.getInt("lockState"));
                    g.setGroupType(res.getInt("groupType"));
                    g.setGroupName(res.getString("name"));
                    g.setDescription(res.getString("description"));
                    g.setGroupCode(res.getString("groupCode"));
                    g.setCreatedBy(res.getInt("owner"));
                    g.setGroupState(res.getInt("groupState"));
                    g.setLastUsedOn(res.getDate("lastUsedOn"));
                    g.setCreatedOn(res.getDate("createdOn"));
                    g.setDefaultProfileId(res.getInt("defaultProfileId"));
                    stmt = con.createStatement();
                    String queryToFethDefaultProfileName = "select profileName from Profile where profileId=" + res.getInt("defaultProfileId");
                    res2 = stmt.executeQuery(queryToFethDefaultProfileName);
                    if (res2.next()) {
                        g.setDefaultProfileName(res2.getString("profileName"));
                    }
                    profiles = res.getString("profileIdList");

                }
                String[] profileIds = profiles.split(":");
                for (int i = 0; i < profileIds.length; i++) {
                    Profile p = new Profile();
                    pstmt2 = con.prepareStatement("Select * from Profile where profileId = ?");
                    pstmt2.setInt(1, Integer.parseInt(profileIds[i]));
                    res2 = pstmt2.executeQuery();
                    if (res2.next()) {

                        p.setProfileId(res2.getInt("profileId"));
                        p.setProfileName(res2.getString("profileName"));
                        p.setModifyGroup(res2.getBoolean("modifyGroup"));
                        p.setCreateTopic(res2.getBoolean("createTopic"));
                        p.setModifyTopics(res2.getBoolean("modifyTopic"));
                        p.setPostNote(res2.getBoolean("postingNote"));
                        p.setHideNote(res2.getBoolean("hideNote"));
                        p.setCreateAssignment(res2.getBoolean("createAssignment"));
                        p.setViewAssignment(res2.getBoolean("viewAssignment"));
                        p.setAnswerAssignment(res2.getBoolean("submitAnswer"));
                        p.setGradeAssignment(res2.getBoolean("gradeAssignment"));
                        p.setViewGrades(res2.getBoolean("viewGrades"));
                        p.setCreateQuiz(res2.getBoolean("createQuiz"));
                        p.setViewQuiz(res2.getBoolean("viewQuiz"));
                        p.setSendInvite(res2.getBoolean("sendInvite"));
                        p.setAnswerQuiz(res2.getBoolean("submitQuiz"));
                        p.setGradeQuiz(res2.getBoolean("gradeQuiz"));
                        p.setStartVideoChat(res2.getBoolean("startVideoChat"));
                        p.setStartDiscussionForum(res2.getBoolean("startDiscussionForum"));
                        p.setCreatePoll(res2.getBoolean("createPoll"));
                        p.setViewPoll(res2.getBoolean("viewPoll"));
                        p.setAcceptInvite(res2.getBoolean("acceptInvite"));
                        Profiles.add(p);

                    }
                }
                g.setProfiles(Profiles);

                pstmt1 = con.prepareStatement("Select featureList from GroupFeatures where groupId=?");
                pstmt1.setInt(1, gid);
                res1 = pstmt1.executeQuery();

                if (res1.next()) {
                    Features = new ArrayList<String>();
                    String featureList = res1.getString("featureList");
                    String[] features = featureList.split(":");
                    for (int i = 0; i < features.length; i++) {
                        if (features[i].compareTo("null") != 0) {
                            Features.add(features[i]);
                        }

                    }
                    g.setFeatures(Features);
                }

            }
        } catch (SQLException sqle) {
        } finally {

            DBConnection.closeResultSet(res);
            DBConnection.closeResultSet(res1);
            DBConnection.closeResultSet(res2);
            DBConnection.closePStatement(pstmt);
            DBConnection.closePStatement(pstmt1);
            DBConnection.closePStatement(pstmt2);
            DBConnection.closeStatement(stmt);
            DBConnection.closeDBConnection(con);
        }
        return g;
    }

    public ToDoList getToDoList(int userId, int groupId) {

        String groupName = "";
        ToDoList todoList = new ToDoList();
        HashMap<String, ArrayList<TopicToDo>> map = new HashMap<String, ArrayList<TopicToDo>>();
        ArrayList<TopicToDo> arrTemp;
        try {

            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("Select feature,startDate,endDate,topic from toDoList where groupId=? and userId=?");

                pstmt.setInt(1, groupId);
                pstmt.setInt(2, userId);
                System.out.println(pstmt);
                res = pstmt.executeQuery();

                pstmt2 = con.prepareStatement("select name from GroupInfo where groupId=?");
                pstmt2.setInt(1, groupId);
                System.out.println(pstmt2);
                res1 = pstmt2.executeQuery();
                if (res1.next()) {
                    groupName = res1.getString("name");

                }
                while (res.next()) {
                    System.out.println("hello");
                    String s2 = String.valueOf(res.getDate("endDate"));
                    System.out.println(s2);
                    Date d2 = new Date();
                    String date = String.valueOf(d2.getDate());
                    String month = String.valueOf(d2.getMonth());
                    String year = String.valueOf(d2.getYear());
                    if (date.length() == 2) {
                        if (month.length() != 2) {
                            month = "0" + month;
                        }
                    } else {
                        date = "0" + date;
                    }

                    String arr[] = s2.split("-");
                    for (int i = 0; i < arr.length; i++) {
                        System.out.println(arr[i]);
                    }
                    if ((Integer.parseInt(arr[0]) - Integer.parseInt(year) >= 0) && (Integer.parseInt(arr[1]) - Integer.parseInt(month) < 6) && (Integer.parseInt(arr[1]) - Integer.parseInt(month) > 0)) {

                        arrTemp = map.get(res.getString("feature"));
                        if (arrTemp != null) {
                            System.out.println(arrTemp);
                            arrTemp = map.get(res.getString("feature"));

                            System.out.println(res.getString("feature") + " " + arrTemp);
                            TopicToDo topicToDo = new TopicToDo();
                            topicToDo.setTopic(res.getString("topic"));
                            topicToDo.setEndTime(res.getString("startDate"));
                            topicToDo.setStartTime(res.getString("endDate"));
                            arrTemp.add(topicToDo);
                            System.out.println(res.getString("feature") + " " + arrTemp);
                            map.put(res.getString("feature").toString(), arrTemp);
                        } else {
                            System.out.println("adsadasdadsasdasd\n");
                            arrTemp = new ArrayList<TopicToDo>();
                            TopicToDo topicToDo = new TopicToDo();
                            topicToDo.setTopic(res.getString("topic"));
                            topicToDo.setEndTime(res.getString("startDate"));
                            topicToDo.setStartTime(res.getString("endDate"));
                            arrTemp.add(topicToDo);
                            map.put(res.getString("feature").toString(), arrTemp);
                        }
                    }
                }
            }
        } catch (SQLException e) {
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closeResultSet(res1);
            DBConnection.closePStatement(pstmt);
            DBConnection.closePStatement(pstmt2);
            DBConnection.closeDBConnection(con);
        }
        System.out.println(groupName);
        todoList.setGroupName(groupName);
        todoList.setTodoList(map);
        return todoList;
    }

    public int copyGroup(String name, Group g, Profile p) {
        int gid = 0, status = 0, i, j;
        int jforum_status = 0;
        int status1 = 0;

        int jforum_status1 = 0;
        int jforum_status2 = 0;
        int jforum_status3 = 0;
        int jforum_status4 = 0;
        int jforum_status5 = 0;
        int jforum_status6 = 0;
        int jforum_status7 = 0;
        int jforum_status8 = 0;
        int jforum_status9 = 0;
        int jforum_status10 = 0;

        int user_id = 0;
        int role_id = 0;
        String gcode;
        String profileIds = "";
        String featureList = "";
        ArrayList<Profile> profileList = new ArrayList<Profile>();
        ArrayList<String> Features = new ArrayList<String>();
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select max(groupId) as last_id from GroupInfo");
                res = pstmt.executeQuery();
                if (res.next()) {
                    gid = res.getInt("last_id");
                } else {
                    gid = 0;
                }

                GroupCode gc = new GroupCode();
                gcode = gc.generate(gid);
                gid++;

                con.setAutoCommit(false);

                pstmt = con.prepareStatement("INSERT INTO GroupInfo"
                        + " (`groupId`,"
                        + " `groupCode`,"
                        + " `groupType`,"
                        + " `name`, "
                        + "`owner`,"
                        + " `description`,"
                        + " `createdOn`, "
                        + "`lastUsedOn`,"
                        + " `groupState`,"
                        + " `lockState`,"
                        + " `defaultProfileId`,"
                        + " `profileIdList`)"
                        + " VALUES (?, ?, ?, ?, ?, ?, now(), now(), '1', ?, ?, ?)");
                pstmt.setInt(1, gid);
                pstmt.setString(2, gcode);
                pstmt.setInt(3, g.getGroupType());
                pstmt.setString(4, name);
                pstmt.setInt(5, g.getCreatedBy());
                pstmt.setString(6, g.getDescription());
                pstmt.setInt(7, g.getLockState());
                pstmt.setInt(8, g.getDefaultProfileId());
                profileList = g.getProfiles();
                Features = g.getFeatures();
                for (i = 0; i < profileList.size() - 1; i++) {
                    profileIds += String.valueOf(profileList.get(i).getProfileId());
                    profileIds += ":";
                }
                if (i > 0) {
                    profileIds += String.valueOf(profileList.get(i).getProfileId());
                }

                pstmt.setString(9, profileIds);
                status = pstmt.executeUpdate();
                System.out.println("pstmt " + pstmt);

//jforum
                g.setGroupId(gid);
                pstmt = con.prepareStatement("INSERT INTO jforum_groups(group_id,group_name) values (?,?);");
                pstmt.setInt(1, gid);
                pstmt.setString(2, name);
                jforum_status = pstmt.executeUpdate();

                pstmt = con.prepareStatement("INSERT INTO jforum_categories(categories_id,title,display_order) values (?,?,?);");
                pstmt.setInt(1, gid);
                pstmt.setString(2, name);
                pstmt.setInt(3, gid);
                jforum_status1 = pstmt.executeUpdate();

                //setting permissions for category
                pstmt = con.prepareStatement("INSERT INTO jforum_roles(group_id,name) values (?,?);");
                pstmt.setInt(1, gid);
                pstmt.setString(2, "perm_category");
                jforum_status2 = pstmt.executeUpdate();
                pstmt = con.prepareStatement("select max(role_id) as last_role_id from jforum_roles");
                res = pstmt.executeQuery();
                while (res.next()) {
                    role_id = res.getInt("last_role_id");
                }

                pstmt = con.prepareStatement("INSERT INTO jforum_role_values(role_id,role_value) values (?,?);");
                pstmt.setInt(1, role_id);
                pstmt.setInt(2, gid);
                jforum_status3 = pstmt.executeUpdate();

                //setting permissions for forum
                pstmt = con.prepareStatement("INSERT INTO jforum_roles(group_id,name) values (?,?);");
                pstmt.setInt(1, gid);
                pstmt.setString(2, "perm_forum");
                jforum_status4 = pstmt.executeUpdate();

                pstmt = con.prepareStatement("select max(role_id) as last_role_id from jforum_roles");
                res = pstmt.executeQuery();
                while (res.next()) {
                    role_id = res.getInt("last_role_id");
                }

                pstmt = con.prepareStatement("INSERT INTO jforum_role_values(role_id,role_value) values (?,?);");
                pstmt.setInt(1, role_id);
                pstmt.setInt(2, gid);
                jforum_status5 = pstmt.executeUpdate();

                //setting permissions for reply only
                pstmt = con.prepareStatement("INSERT INTO jforum_roles(group_id,name) values (?,?);");
                pstmt.setInt(1, gid);
                pstmt.setString(2, "perm_reply_only");
                jforum_status7 = pstmt.executeUpdate();

                pstmt = con.prepareStatement("select max(role_id) as last_role_id from jforum_roles");
                res = pstmt.executeQuery();
                while (res.next()) {
                    role_id = res.getInt("last_role_id");
                }

                pstmt = con.prepareStatement("INSERT INTO jforum_role_values(role_id,role_value) values (?,?);");
                pstmt.setInt(1, role_id);
                pstmt.setInt(2, gid);
                jforum_status8 = pstmt.executeUpdate();

                //setting permissions for read only forums
                pstmt = con.prepareStatement("INSERT INTO jforum_roles(group_id,name) values (?,?);");
                pstmt.setInt(1, gid);
                pstmt.setString(2, "perm_read_only_forums");
                jforum_status9 = pstmt.executeUpdate();

                pstmt = con.prepareStatement("select max(role_id) as last_role_id from jforum_roles");
                res = pstmt.executeQuery();
                while (res.next()) {
                    role_id = res.getInt("last_role_id");
                }

                pstmt = con.prepareStatement("INSERT INTO jforum_role_values(role_id,role_value) values (?,?);");
                pstmt.setInt(1, role_id);
                pstmt.setInt(2, gid);
                jforum_status10 = pstmt.executeUpdate();

                pstmt = con.prepareStatement("INSERT INTO jforum_forums(forum_id,categories_id,forum_name,forum_desc) values (?,?,?,?);");
                pstmt.setInt(1, gid);
                pstmt.setInt(2, gid);
                pstmt.setString(3, name);
                pstmt.setString(4, g.getDescription());
                jforum_status6 = pstmt.executeUpdate();
                //jforum

//jforum
                for (j = 0; j < Features.size() - 1; j++) {
                    featureList += Features.get(j);
                    featureList += ":";
                }
                if (j > 0) {
                    featureList += Features.get(j);
                }
                if (status > 0 && jforum_status > 0 && jforum_status1 > 0 && jforum_status2 > 0 && jforum_status3 > 0 && jforum_status4 > 0 && jforum_status5 > 0 && jforum_status6 > 0 && jforum_status7 > 0 && jforum_status8 > 0 && jforum_status9 > 0 && jforum_status10 > 0) {

                    status = 0;

                    pstmt = con.prepareStatement("INSERT INTO jforum_user_groups (group_id,user_id) VALUES (?,?);");
                    pstmt.setInt(1, gid);
                    pstmt.setInt(2, g.getCreatedBy());
                    status1 = pstmt.executeUpdate();

                    pstmt = con.prepareStatement("INSERT INTO GroupFeatures (`groupId`, `featureList`) VALUES (?, ?)");
                    pstmt.setInt(1, gid);
                    pstmt.setString(2, featureList);
                    status = pstmt.executeUpdate();

                    if (status > 0 && status1 > 0) {
                        con.commit();
                    } else {
                        con.rollback();
                    }
                } else {
                    con.rollback();
                }

                if (status > 0) {
                    status = 0;
                    pstmt = con.prepareStatement("INSERT INTO UserGroup values(?,?,?)");
                    pstmt.setInt(1, gid);
                    pstmt.setInt(2, g.getCreatedBy());
                    pstmt.setInt(3, p.getProfileId());
                    status = pstmt.executeUpdate();
                } else {
                    con.rollback();
                }
            }
            con.setAutoCommit(true);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return gid;

    }

    /*group posts  */
    public ArrayList<PostBean> groupPost(PostBean n, Group currGroup) throws SQLException, ParseException {
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {

                pstmt = con.prepareStatement("SELECT * FROM group_post where gid=? order by id desc");
                pstmt.setInt(1, currGroup.getGroupId());
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    n = new PostBean();
                    n.setToolid(rs.getInt("Toolid"));
                    n.setType(rs.getInt("type"));
                    // System.out.println("tpye"+n.getType());
                    int type = rs.getInt("type");
                    if (type == 1) {
                        pstmt2 = con.prepareStatement("SELECT * FROM group_note where gid=? and id=?");
                        pstmt2.setInt(1, currGroup.getGroupId());
                        pstmt2.setInt(2, n.getToolid());
                        res = pstmt2.executeQuery();
                        //System.out.println("toollid"+p.getToolid());

                        while (res.next()) {

                            n.setNote(res.getString("note"));
                            n.setCreatedById(res.getInt("createdBy"));
                            n.setGroupName(currGroup.getGroupName());
                            n.setNoteId(res.getInt("id"));
                            n.setReferenceLink(res.getString("noteLink"));

                            String S = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(res.getTimestamp("date_time"));
                            n.setDate_time(S);

                            n.setMyFileFileName(res.getString("noteFile"));

                            pstmt3 = con.prepareStatement("SELECT name FROM Login_Info where LoginId=?");
                            pstmt3.setInt(1, n.getCreatedById());

                            res1 = pstmt3.executeQuery();
                            while (res1.next()) {
//                      //  System.out.println("name"+res1.getString("name"));
                                n.setUsername(res1.getString("name"));
                            }

                        }
                    }
                    if (type == 2) {
                        pstmt2 = con.prepareStatement("SELECT * FROM group_assignment where gid=? and id=?");
                        pstmt2.setInt(1, currGroup.getGroupId());
                        pstmt2.setInt(2, n.getToolid());
                        res = pstmt2.executeQuery();
                        //System.out.println("toollid"+p.getToolid());

                        while (res.next()) {
                            n.setUid(res.getInt("uid"));
                            n.setName(res.getString("name"));
                            n.setDescription(res.getString("description"));
                            n.setLastSubmissionDate(res.getTimestamp("lastSubmissionDate"));

                            String dateTime = n.getLastSubmissionDate().toString();
                            String[] dateTimeArr = dateTime.split(" ");
                            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                            Date d = simpleDateFormat.parse(dateTime);
                            ((SimpleDateFormat) simpleDateFormat).applyPattern("MM/dd/yyyy");
                            String date = simpleDateFormat.format(d);
                            n.setDatepicker(date);
                            n.setGroupName(currGroup.getGroupName());
                            String[] timeArr = dateTimeArr[1].split(":");
                            n.setHour(timeArr[0]);
                            n.setMin(timeArr[1]);
                            String S = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(res.getTimestamp("givenOn"));
                            n.setPostDate(S);
                            n.setGivenOn(res.getTimestamp("givenOn"));
                            n.setAssignmentBeanreferenceLink(res.getString("referenceLink"));
                            n.setAttachment(res.getString("attachment"));
                            n.setAssignmentid(res.getInt("id"));
                            n.setGroupId(res.getInt("gid"));
                            //System.out.println(rs.getString("topicName"));
                            n.setTopicName(res.getString("topicName"));
                            pstmt3 = con.prepareStatement("SELECT name FROM Login_Info where LoginId=?");
                            pstmt3.setInt(1, n.getUid());

                            res1 = pstmt3.executeQuery();
                            while (res1.next()) {
//                      //  System.out.println("name"+res1.getString("name"));
                                n.setUsername(res1.getString("name"));
                            }
                        }
                    }
                    if (type == 3) {

                    }
                    GroupPost.add(n);
                    System.out.println("size" + GroupPost.size());
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("error in displayNote");
        } finally {
            DBConnection.closeResultSet(res1);
            DBConnection.closeResultSet(rs);
            DBConnection.closePStatement(pstmt);
            DBConnection.closePStatement(pstmt2);
            DBConnection.closePStatement(pstmt3);
            DBConnection.closeDBConnection(con);

        }

        return GroupPost;
    }

    public ArrayList<Notes> NotesAnalysis(int gid) {
        Notes n = null;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt4 = con.prepareStatement("SELECT count(userId) as noOfUsers FROM UserGroup where groupId=?");
                pstmt4.setInt(1, gid);
                res = pstmt4.executeQuery();
                while (res.next()) {
                    pstmt = con.prepareStatement("select * from group_note where gid = ? ");
                    pstmt.setInt(1, gid);

                    rs = pstmt.executeQuery();
                    while (rs.next()) {
                        n = new Notes();
                        n.setCreatedById(rs.getInt("createdBy"));

                        pstmt3 = con.prepareStatement("SELECT name FROM Login_Info where LoginId=?");
                        pstmt3.setInt(1, n.getCreatedById());

                        res1 = pstmt3.executeQuery();
                        while (res1.next()) {
                            n.setName(res1.getString("name"));

                            pstmt2 = con.prepareStatement("SELECT count(note) as count FROM group_note where createdBy=? and gid=?");
                            pstmt2.setInt(1, n.getCreatedById());
                            pstmt2.setInt(2, gid);
                            res2 = pstmt2.executeQuery();
                            while (res2.next()) {
                                n.setCount(res2.getInt("count"));

                            }

                        }
                        listanalytics.add(n);

                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(rs);
            DBConnection.closeResultSet(res);
            DBConnection.closeResultSet(res1);
            DBConnection.closeResultSet(res2);
            DBConnection.closePStatement(pstmt4);
            DBConnection.closePStatement(pstmt);
            DBConnection.closePStatement(pstmt2);
            DBConnection.closePStatement(pstmt3);
            DBConnection.closeDBConnection(con);
            return listanalytics;
        }
    }

    /*       
    Create new Quiz
    output :
        1#QuizId - quiz data saved successfully
        0#QuizId - saving quiz data unsuccessful
        empty string - unable to connect to database
     */
    public String saveQuizDetails(int userId, int groupId, String title, String dateStr, int duration) {
        Timestamp qdate = null;
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy HH:mm");
            Date parsedDate = dateFormat.parse(dateStr);
            qdate = new Timestamp(parsedDate.getTime());
        } catch (Exception e) {
        }
        int result = 0;
        String resultStr = "";
        int Qid = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select max(QuizId) as last_id from QuizData");
                res = pstmt.executeQuery();
                if (res.next()) {
                    Qid = res.getInt("last_id");
                } else {
                    Qid = 0;
                }
                Qid++;
                pstmt = con.prepareStatement("INSERT INTO QuizData (QuizId, groupId, title, qdate, createdOn, createdBy, duration) VALUES (?, ?, ?, ?, now(), ?, ?)");
                pstmt.setInt(1, Qid);
                pstmt.setInt(2, groupId);
                pstmt.setString(3, title);
                pstmt.setTimestamp(4, qdate);
                pstmt.setInt(5, userId);
                pstmt.setInt(6, duration);
                result = pstmt.executeUpdate();
                resultStr = Integer.toString(result) + "#" + Integer.toString(Qid);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return resultStr;
    }

    /*
        Function to save question details for quiz
     */
    public int saveQuestionDetails(int quizId, String question, int marks, String[] option, int answerId) {
        int questionId = 0, optionId = 0, count = 0;
        int result = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select max(questionId) as max from QuizQuestion;");
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    questionId = rs.getInt("max");
                }
                questionId++;
                pstmt1 = con.prepareStatement("select max(optionId) as max from QuizOption;");
                res2 = pstmt1.executeQuery();
                if (res2.next()) {
                    optionId = res2.getInt("max");
                }
                answerId += optionId + 1;

                ps = con.prepareStatement("INSERT INTO `QuizQuestion` (`questionId`, `quizId`, `question`, `marks`, `answer`) VALUES (?, ?, ?, ?, ?)");
                ps.setInt(1, questionId);
                ps.setInt(2, quizId);
                ps.setString(3, question);
                ps.setInt(4, marks);
                ps.setInt(5, answerId);
                result = ps.executeUpdate();
                if (result > 0) {
                    for (int i = 0; i < option.length; i++) {
                        optionId++;
                        result = 0;
                        pstmt = con.prepareStatement("INSERT INTO `QuizOption` (`optionId`, `questionId`, `option`) VALUES (?, ?, ?);");
                        pstmt.setInt(1, optionId);
                        pstmt.setInt(2, questionId);
                        pstmt.setString(3, option[i]);
                        result = pstmt.executeUpdate();
                        if (result > 0) {
                            count++;
                        }
                    }
                }
                if (count == option.length) {
                    return 1;
                }
            } else {
                return -1;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(rs);
            DBConnection.closeResultSet(res2);
            DBConnection.closePStatement(ps);
            DBConnection.closePStatement(pstmt);
            DBConnection.closePStatement(pstmt1);
            DBConnection.closePStatement(pstmt2);
            DBConnection.closeDBConnection(con);
        }
        return 0;
    }

    public ArrayList<Quiz> getUpcomingQuiz(int groupId) {
        ArrayList<Quiz> listOfQuiz = new ArrayList<>();
        Quiz quiz;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select * from QuizData where groupId = ? and qdate between curdate() and adddate(now(),+7) order by qdate");
                pstmt.setInt(1, groupId);
                res = pstmt.executeQuery();
                while (res.next()) {
                    quiz = new Quiz();
                    quiz.setTitle(res.getString("title"));
                    quiz.setGroupId(res.getInt("groupId"));
                    quiz.setQuizDate(res.getTimestamp("qdate"));
                    quiz.setCreatedBy(res.getInt("createdBy"));
                    quiz.setCreationDate(res.getTimestamp("createdOn"));
                    quiz.setDuration(res.getInt("duration"));
                    quiz.setQuizId(res.getInt("quizId"));
                    listOfQuiz.add(quiz);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return listOfQuiz;
    }

    /*
    Returns arraylist of the the quiz that have been attempted in 7 days from quiz date
     */
    public ArrayList<Quiz> getAttemptedQuiz(int groupId) {
        ArrayList<Quiz> listOfQuiz = new ArrayList<>();
        Quiz quiz;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select * from QuizData where groupId = ? and qdate between now() and adddate(now(),+7) order by qdate");
                pstmt.setInt(1, groupId);
                res = pstmt.executeQuery();
                while (res.next()) {
                    quiz = new Quiz();
                    quiz.setTitle(res.getString("title"));
                    quiz.setGroupId(res.getInt("groupId"));
                    quiz.setQuizDate(res.getTimestamp("qdate"));
                    quiz.setCreatedBy(res.getInt("createdBy"));
                    quiz.setCreationDate(res.getTimestamp("createdOn"));
                    quiz.setDuration(res.getInt("duration"));
                    quiz.setQuizId(res.getInt("quizId"));
                    listOfQuiz.add(quiz);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return listOfQuiz;
    }

    /*
        Function to get the questions of a quiz
     */
    public ArrayList<Question> getQuizQuestions(Integer quizId, Integer groupId, Integer userId) {
        ArrayList<Question> questions = new ArrayList<Question>();
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select * from QuizQuestion where quizId=?");
                pstmt.setInt(1, quizId);
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    Question q = new Question();
                    q.setQuizId(quizId);
                    q.setQuestion(rs.getString("question"));
                    q.setAnswerId(rs.getInt("answer"));
                    q.setMarks(rs.getInt("marks"));
                    q.setQuestionId(rs.getInt("questionId"));
                    ps = con.prepareStatement("select * from QuizOption where questionId=?;");
                    ps.setInt(1, q.getQuestionId());
                    res = ps.executeQuery();
                    ArrayList<String> options = new ArrayList<String>();
                    ArrayList<Integer> optionsId = new ArrayList<Integer>();
                    while (res.next()) {
                        options.add(res.getString("option"));
                        optionsId.add(res.getInt("optionId"));
                    }
                    q.setOptions(options);
                    q.setOptionsId(optionsId);
                    questions.add(q);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return questions;
    }

    /*
    *   Function to save quiz response of a user
     */
    public int saveQuizResponse(Integer userId, Integer quizId, Integer totalMarks, ArrayList<Integer> question, ArrayList<Integer> selectedOption) {
        int responseId = 0, quesResponseId = 0, count = 0;
        int result = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select max(responseId) as max from QuizResponse;");
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    responseId = rs.getInt("max");
                }
                responseId++;
                ps = con.prepareStatement("INSERT INTO `QuizResponse` (`responseId`, `quizId`, `submitTime`, `marks`, `userId`) VALUES (?, ?, now(), ?, ?);");
                ps.setInt(1, responseId);
                ps.setInt(2, quizId);
                ps.setInt(3, totalMarks);
                ps.setInt(4, userId);
                result = ps.executeUpdate();
                if (result > 0) {
                    result = 0;
                    pstmt1 = con.prepareStatement("select max(quesResponseId) as max from QuizQuesResponse;");
                    res2 = pstmt1.executeQuery();
                    if (res2.next()) {
                        quesResponseId = res2.getInt("max");
                    }
                    quesResponseId++;
                    for (int i = 0; i < question.size(); i++) {
                        if (selectedOption.get(i) != null) {
                            pstmt = con.prepareStatement("INSERT INTO `QuizQuesResponse` (`quesResponseId`, `quizResponseId`, `quesId`, `submission`) VALUES (?, ?, ?, ?);");
                            pstmt.setInt(1, quesResponseId);
                            pstmt.setInt(2, responseId);
                            pstmt.setInt(3, question.get(i));
                            pstmt.setInt(4, selectedOption.get(i));
                        } else {
                            pstmt = con.prepareStatement("INSERT INTO `QuizQuesResponse` (`quesResponseId`, `quizResponseId`, `quesId`) VALUES (?, ?, ?);");
                            pstmt.setInt(1, quesResponseId);
                            pstmt.setInt(2, responseId);
                            pstmt.setInt(3, question.get(i));
                        }
                        result = pstmt.executeUpdate();
                        if (result > 0) {
                            quesResponseId++;
                            count++;
                        }
                    }
                }
                if (count == question.size()) {
                    return 1;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(rs);
            DBConnection.closeResultSet(res2);
            DBConnection.closePStatement(ps);
            DBConnection.closePStatement(pstmt);
            DBConnection.closePStatement(pstmt1);
            DBConnection.closeDBConnection(con);
        }
        return 0;
    }

    /*
    *   Function to get quiz responses of a user
     */
    public ArrayList<QuizResponse> getQuizResponse(Integer userId, Integer quizId) {
        Integer responseId = 0;
        ResultSet rs2 = null;
        ArrayList<QuizResponse> selections = new ArrayList<QuizResponse>();
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                ps = con.prepareStatement("select * from QuizResponse where userId=? AND quizId=?;");
                ps.setInt(1, userId);
                ps.setInt(2, quizId);
                rs = ps.executeQuery();
                if (rs.next()) {
                    responseId = rs.getInt("responseId");
                }
                if (responseId > 0) {
                    pstmt = con.prepareStatement("select * from QuizQuesResponse where quizResponseId=?;");
                    pstmt.setInt(1, responseId);
                    res = pstmt.executeQuery();
                    while (res.next()) {
                        QuizResponse r = new QuizResponse();
                        r.setQuestionId(res.getInt("quesId"));
                        r.setSelectedOptionId(res.getInt("submission"));
                        pstmt2 = con.prepareStatement("select * from QuizQuestion where questionId=?;");
                        pstmt2.setInt(1, r.getQuestionId());
                        rs2 = pstmt2.executeQuery();
                        if (rs2.next()) {
                            r.setQuestion(rs2.getString("question"));
                            r.setAnswerId(rs2.getInt("answer"));

                            if (!Objects.equals(r.getSelectedOptionId(), r.getAnswerId())) {
                                r.setMarks(0);
                            } else {
                                r.setMarks(rs2.getInt("marks"));
                            }

                            pstmt2 = con.prepareStatement("select * from QuizOption where optionId=? OR optionId=?;");
                            pstmt2.setInt(1, r.getSelectedOptionId());
                            pstmt2.setInt(2, r.getAnswerId());
                            rs2 = pstmt2.executeQuery();
                            while (rs2.next()) {
                                String op1 = rs2.getString("option");
                                Integer opId = rs2.getInt("optionId");
                                if (!Objects.equals(opId, r.getAnswerId())) {
                                    r.setSelectedOption(op1);
                                } else {
                                    r.setCorrectAnswer(op1);
                                    r.setSelectedOption(op1);
                                }
                            }

                        }
                        selections.add(r);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(rs);
            DBConnection.closeResultSet(res2);
            DBConnection.closePStatement(ps);
            DBConnection.closePStatement(pstmt);
            DBConnection.closePStatement(pstmt1);
            DBConnection.closeDBConnection(con);
        }
        return selections;
    }

    public int insertSubgroup(Subgroup g, Profile p, String featureList, int defaultProfileId, String profileIdList, int parentId) {
        int status = 0;
        int jforum_status = 0;
        int status1 = 0;

        int jforum_status1 = 0;
        int jforum_status2 = 0;
        int jforum_status3 = 0;
        int jforum_status4 = 0;
        int jforum_status5 = 0;
        int jforum_status6 = 0;
        int jforum_status7 = 0;
        int jforum_status8 = 0;
        int jforum_status9 = 0;
        int jforum_status10 = 0;
        int gid;
        int user_id = 0;
        int role_id = 0;
        String gcode;
        HttpSession session = ServletActionContext.getRequest().getSession();
        Person person = (Person) session.getAttribute(Utility.USER_HANDLE);

        if (person != null) {
            try {
                if (con == null || con.isClosed()) {
                    con = DBConnection.getDBConnection();
                }
                if (con != null) {
                    pstmt = con.prepareStatement("select max(groupId) as last_id from GroupInfo");
                    res = pstmt.executeQuery();
                    if (res.next()) {
                        gid = res.getInt("last_id");
                    } else {
                        gid = 0;
                    }

                    GroupCode gc = new GroupCode();
                    gcode = gc.generate(gid);
                    gid++;

                    con.setAutoCommit(false);

                    pstmt = con.prepareStatement("INSERT INTO GroupInfo"
                            + " (`groupId`,"
                            + " `groupCode`,"
                            + " `groupType`,"
                            + " `name`, "
                            + "`owner`,"
                            + " `description`,"
                            + " `createdOn`, "
                            + "`lastUsedOn`,"
                            + " `groupState`,"
                            + " `lockState`,"
                            + " `defaultProfileId`,"
                            + " `profileIdList`,"
                            + "`parentId`)"
                            + " VALUES (?, ?, ?, ?, ?, ?, now(), now(), '1', ?, ?, ? , ?)");
                    pstmt.setInt(1, gid);
                    pstmt.setString(2, gcode);
                    pstmt.setInt(3, g.getGroupType());
                    pstmt.setString(4, g.getGroupName());
                    pstmt.setInt(5, g.getCreatedBy());
                    pstmt.setString(6, g.getDescription());
                    pstmt.setInt(7, g.getLockState());
                    pstmt.setInt(8, defaultProfileId);
                    pstmt.setString(9, profileIdList);
                    pstmt.setInt(10, parentId);
                    status = pstmt.executeUpdate();

//jforum
                    g.setGroupId(gid);
                    pstmt = con.prepareStatement("INSERT INTO jforum_groups(group_id,group_name,parent_id) values (?,?, ?);");
                    pstmt.setInt(1, gid);
                    pstmt.setString(2, g.getGroupName());
                    pstmt.setInt(3, parentId);
                    jforum_status = pstmt.executeUpdate();

                    pstmt = con.prepareStatement("INSERT INTO jforum_categories(categories_id,title,display_order) values (?,?,?);");
                    pstmt.setInt(1, gid);
                    pstmt.setString(2, g.getGroupName());
                    pstmt.setInt(3, gid);
                    jforum_status1 = pstmt.executeUpdate();

                    //setting permissions for category
                    pstmt = con.prepareStatement("INSERT INTO jforum_roles(group_id,name) values (?,?);");
                    pstmt.setInt(1, gid);
                    pstmt.setString(2, "perm_category");
                    jforum_status2 = pstmt.executeUpdate();
                    pstmt = con.prepareStatement("select max(role_id) as last_role_id from jforum_roles");
                    res = pstmt.executeQuery();
                    while (res.next()) {
                        role_id = res.getInt("last_role_id");
                    }

                    pstmt = con.prepareStatement("INSERT INTO jforum_role_values(role_id,role_value) values (?,?);");
                    pstmt.setInt(1, role_id);
                    pstmt.setInt(2, gid);
                    jforum_status3 = pstmt.executeUpdate();

                    //setting permissions for forum
                    pstmt = con.prepareStatement("INSERT INTO jforum_roles(group_id,name) values (?,?);");
                    pstmt.setInt(1, gid);
                    pstmt.setString(2, "perm_forum");
                    jforum_status4 = pstmt.executeUpdate();

                    pstmt = con.prepareStatement("select max(role_id) as last_role_id from jforum_roles");
                    res = pstmt.executeQuery();
                    while (res.next()) {
                        role_id = res.getInt("last_role_id");
                    }

                    pstmt = con.prepareStatement("INSERT INTO jforum_role_values(role_id,role_value) values (?,?);");
                    pstmt.setInt(1, role_id);
                    pstmt.setInt(2, gid);
                    jforum_status5 = pstmt.executeUpdate();

                    //setting permissions for reply only
                    pstmt = con.prepareStatement("INSERT INTO jforum_roles(group_id,name) values (?,?);");
                    pstmt.setInt(1, gid);
                    pstmt.setString(2, "perm_reply_only");
                    jforum_status7 = pstmt.executeUpdate();

                    pstmt = con.prepareStatement("select max(role_id) as last_role_id from jforum_roles");
                    res = pstmt.executeQuery();
                    while (res.next()) {
                        role_id = res.getInt("last_role_id");
                    }

                    pstmt = con.prepareStatement("INSERT INTO jforum_role_values(role_id,role_value) values (?,?);");
                    pstmt.setInt(1, role_id);
                    pstmt.setInt(2, gid);
                    jforum_status8 = pstmt.executeUpdate();

                    //setting permissions for read only forums
                    pstmt = con.prepareStatement("INSERT INTO jforum_roles(group_id,name) values (?,?);");
                    pstmt.setInt(1, gid);
                    pstmt.setString(2, "perm_read_only_forums");
                    jforum_status9 = pstmt.executeUpdate();

                    pstmt = con.prepareStatement("select max(role_id) as last_role_id from jforum_roles");
                    res = pstmt.executeQuery();
                    while (res.next()) {
                        role_id = res.getInt("last_role_id");
                    }

                    pstmt = con.prepareStatement("INSERT INTO jforum_role_values(role_id,role_value) values (?,?);");
                    pstmt.setInt(1, role_id);
                    pstmt.setInt(2, gid);
                    jforum_status10 = pstmt.executeUpdate();

                    pstmt = con.prepareStatement("INSERT INTO jforum_forums(forum_id,categories_id,forum_name,forum_desc) values (?,?,?,?);");
                    pstmt.setInt(1, gid);
                    pstmt.setInt(2, gid);
                    pstmt.setString(3, g.getGroupName());
                    pstmt.setString(4, g.getDescription());
                    jforum_status6 = pstmt.executeUpdate();
                    //jforum

                    if (status > 0 && jforum_status > 0 && jforum_status1 > 0 && jforum_status2 > 0 && jforum_status3 > 0 && jforum_status4 > 0 && jforum_status5 > 0 && jforum_status6 > 0 && jforum_status7 > 0 && jforum_status8 > 0 && jforum_status9 > 0 && jforum_status10 > 0) {
                        /*(
                        pstmt = con.prepareStatement("select user_id from jforum_users where username = ? ");
                        pstmt.setString(1, person.getEmail());
                        res = pstmt.executeQuery();
                        while(res.next())
                        user_id = res.getInt("user_id");
                         */
                        status = 0;
                        pstmt = con.prepareStatement("INSERT INTO jforum_user_groups (group_id,user_id) VALUES (?,?);");
                        pstmt.setInt(1, gid);
                        pstmt.setInt(2, g.getCreatedBy());
                        status1 = pstmt.executeUpdate();

                        pstmt = con.prepareStatement("INSERT INTO UserGroup (`groupId`, `userId`, `profileId`) VALUES (?, ?, ?);");
                        pstmt.setInt(1, gid);
                        pstmt.setInt(2, g.getCreatedBy());
                        pstmt.setInt(3, p.getProfileId());
                        status = pstmt.executeUpdate();

                        if (status > 0 && status1 > 0) {
                            status = 0;
                            pstmt = con.prepareStatement("INSERT INTO GroupFeatures (`groupId`, `featureList`) VALUES (?, ?)");
                            pstmt.setInt(1, gid);
                            pstmt.setString(2, featureList);
                            status = pstmt.executeUpdate();

                            if (status > 0) {
                                con.commit();
                            } else {
                                con.rollback();
                            }
                        } else {
                            con.rollback();
                        }
                    }
                    con.setAutoCommit(true);
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                DBConnection.closePStatement(pstmt);
                DBConnection.closeDBConnection(con);
            }
        }
        return status;
    }

    public GroupTree getTheGroupTree(int groupId) {
        GroupTree groupTree = null;
        HashMap<Integer, ArrayList<HashMap<Integer, String>>> hash = new HashMap<Integer, ArrayList<HashMap<Integer, String>>>();
        ArrayList<HashMap<Integer, String>> arr;

        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select groupId,name from GroupInfo where parentId = ?");
                pstmt.setInt(1, groupId);
                res = pstmt.executeQuery();
                hash.put(groupId, new ArrayList<HashMap<Integer, String>>());

                groupTree = new GroupTree();
                while (res.next()) {
                    HashMap<Integer, String> mp = new HashMap<Integer, String>();
                    arr = hash.get(groupId);
                    mp.put(res.getInt("groupId"), res.getString("name"));
                    arr.add(mp);
                }

                groupTree.setRa(hash); 
            }
        } catch (SQLException sqle) {
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closeResultSet(res1);
            DBConnection.closeResultSet(res2);
            DBConnection.closePStatement(pstmt);
            DBConnection.closePStatement(pstmt1);
            DBConnection.closePStatement(pstmt2);
            DBConnection.closeDBConnection(con);
        }
        return groupTree;
    }

}
