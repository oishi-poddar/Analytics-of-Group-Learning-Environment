/**
    author Rohit
*/

package utilities;

import angle_group.AngleUtility;
import bean.Notification;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

public class StoreMessageInDb {

    private Connection conn;
    PreparedStatement ps;
    int status = 0;
    Statement s;
    ResultSet res;
    int maxCid;

    public StoreMessageInDb() throws SQLException {

        if (conn == null || conn.isClosed()) {
            conn = DBConnection.getDBConnection();
        }

    }

    public boolean checkJoin(String jid, String email, String nickname, String starttime, String topic, String message, int groupId) throws SQLException {

        PreparedStatement ps = null;
        ResultSet res;

        try {
            ps = conn.prepareStatement("select max(cid) as max from ConferenceDetails;");
            res = ps.executeQuery();
            if (res.next()) {
                maxCid = res.getInt("max");
                 if(maxCid==0){
                ps=conn.prepareStatement("Alter table ConferenceDetails AUTO_INCREMENT=1;");
                ps.execute();
                maxCid=1;
                }
                 else{
                     maxCid++;
                 }
                

            }
           

            ps = conn.prepareStatement("select * from ParticipantsDetail where email= ? and Topic = ?  and groupId=? and cid=? ;");
            ps.setString(1, email);
            ps.setString(2, topic);
            ps.setInt(3, groupId);
            ps.setInt(4, maxCid);

            res = ps.executeQuery();

            if (res.next()) {

//                     String mes = res.getString("Message");
//
//                    String name = res.getString("NickName");
//                    mes += ":" + message + "asdf";
                String query3 = "update ParticipantsDetail set  StartTime='" + starttime + "',Jid='" + jid + "' where email='" + email + "' and Topic='" + topic + "' and groupId='" + groupId + "' and cid='" + maxCid + "';";
                s = conn.createStatement();
                int temp = s.executeUpdate(query3);

                return true;

            } else {
                setValues(jid, email, nickname, starttime, topic, message, groupId, maxCid);
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(StoreMessageInDb.class.getName()).log(Level.SEVERE, null, ex);
        } finally {

            DBConnection.closePStatement(ps);
            DBConnection.closeStatement(s);
            DBConnection.closeDBConnection(conn);
        }

        return false;

    }

    public void checkLeft(String jid, String lefttime, String topic) throws SQLException, SQLException {

        PreparedStatement ps = null;
        ResultSet res = null;
        s = conn.createStatement();

        try {

            ps = conn.prepareStatement("select * from ParticipantsDetail where jid=? ;");
            ps.setString(1, jid);

            res = ps.executeQuery();

            if (res.next()) {

                ps = conn.prepareStatement("update ParticipantsDetail set TimeDifference = TimeDifference +(SELECT TIMESTAMPDIFF(MINUTE,StartTime,?)) where Jid= ? and topic = ?;");

                ps.setString(1, lefttime);
                ps.setString(2, jid);
                ps.setString(3, topic);

                boolean x = ps.execute();

            } else {

            }
        } catch (SQLException ex) {
            Logger.getLogger(StoreMessageInDb.class.getName()).log(Level.SEVERE, null, ex);
        } finally {

            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(ps);
            DBConnection.closeDBConnection(conn);
        }

    }

    public void setMessage(String jid, String message, String topic, int groupId) throws SQLException, SQLException {

        PreparedStatement ps = null;
        ResultSet res = null;
        s = conn.createStatement();

        try {
            ps = conn.prepareStatement("select * from ParticipantsDetail where jid=? and topic=? and groupId = ?;");
            ps.setString(1, jid);
            ps.setString(2, topic);
            ps.setInt(3, groupId);

            res = ps.executeQuery();
            if (res.next()) {
                String mes = res.getString("Message");
                mes += ":" + message;
                ps = conn.prepareStatement("update ParticipantsDetail set Message = ? where Jid= ? and topic = ? and groupId = ?;");

                ps.setString(1, mes);
                ps.setString(2, jid);
                ps.setString(3, topic);
                ps.setInt(4, groupId);
                boolean x = ps.execute();

            } else {

            }
        } catch (SQLException ex) {
            Logger.getLogger(StoreMessageInDb.class.getName()).log(Level.SEVERE, null, ex);
        } finally {

            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(ps);
            DBConnection.closeDBConnection(conn);
        }

    }

    public void setValues(String jid, String email, String nickname, String starttime, String topic, String message, int groupId, int cid) throws SQLException {

        PreparedStatement ps = null;

        //Long timedifference = 0L;
        if (conn != null) {
            try {

                ps = conn.prepareStatement("insert into ParticipantsDetail values(?,?,?,?,?,?,?,?,?)");
                ps.setString(1, jid);
                ps.setString(2, email);
                ps.setString(3, nickname);
                ps.setString(4, starttime);
                ps.setInt(5, 0);
                ps.setString(6, topic);
                ps.setString(7, message);
                ps.setInt(8, groupId);
                ps.setInt(9, cid);
                
                ps.execute();

            } catch (Exception e) {

            } finally {

            }

            DBConnection.closePStatement(ps);
            DBConnection.closeDBConnection(conn);
        }

    }

    public void insertConference(String start, String stop, String topic, int noOfParticipants, String email, int groupId) throws SQLException {
            System.out.println("insertConference invoked");
        if (conn != null) {
            try {
                //s = conn.createStatement();
                ps = conn.prepareStatement("select max(cid) as max from ConferenceDetails;");
                res = ps.executeQuery();
                if (res.next()) {
                    maxCid = res.getInt("max");
                   if(maxCid==0){
                    ps=conn.prepareStatement("Alter table ConferenceDetails AUTO_INCREMENT=1;");
                    ps.execute();
                    maxCid=1;
                   }
                   maxCid++;

                }
               
                
                ps=conn.prepareStatement("select count(cid) as no from ParticipantsDetail group by cid having cid=?");
                ps.setInt(1, maxCid);
                res=ps.executeQuery();
                if(res.next()){
                    noOfParticipants = res.getInt("no")+1;
                    
                }
                else{
                    noOfParticipants=1;
                }
                
                ps = conn.prepareStatement("insert into ConferenceDetails(email,StartTime,EndTime,NoOfParticipants,Topic,groupId) values(?,?,?,?,?,?)");
                //String sql = "INSERT INTO ConferenceDetails(StartTime,EndTime,email,NoOfParticipants,Topic,groupId) VALUES ('" + start + "', " + "'" + stop + "', " + "'" + email + "', '" + noOfParticipants + "', '" + topic + "', "+groupId+");";
                ps.setString(1, email);
                ps.setString(2, start);
                ps.setString(3, stop);
                ps.setInt(4, noOfParticipants);
                ps.setString(5, topic);
                ps.setInt(6, groupId);
                System.out.println(ps.execute());

            } catch (SQLException e) {
                e.printStackTrace();

            } finally {
                DBConnection.closePStatement(ps);
                DBConnection.closeDBConnection(conn);
            }
        }

    }

    public void notification(String link, int groupId) {
 
        PreparedStatement pstmt = null;
        ResultSet res = null;
        //Fetch all userId of users in the group
        ArrayList<Integer> userIdList = new ArrayList<>();
        try {
            if (conn == null || conn.isClosed()) {
                conn = DBConnection.getDBConnection();
            }
            if (conn != null) {
                pstmt = conn.prepareStatement("Select userId from UserGroup where groupId = ?");
                pstmt.setInt(1, groupId); //set groupId
                res = pstmt.executeQuery();

                while (res.next()) {
                    userIdList.add(res.getInt("userId"));
                }

                Notification newNotification = null;
                AngleUtility util = new AngleUtility();

                //Add notification for each user in group                
                for (int i = 0; i < userIdList.size(); i++) {
                    newNotification = new Notification();
                    newNotification.setUserId(userIdList.get(i));
                    newNotification.setGroupId(groupId);
                    newNotification.setNotificationType(0); //Let the parameter be 0 unless there is some change in standard notification format
                    newNotification.setTitle("Conference Started");
                    newNotification.setContent(link);
                    util.addNotification(newNotification);
                }
            }
        } catch (SQLException e) {
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(conn);
        }

    }
    
    
        public void toDoList(String topic, int groupId, int userId, String startDate, String endDate, String feature) throws SQLException, ParseException {
      
        if (conn != null) {
            try {
                //s = conn.createStatement();
                String tempEnd=null;
                SimpleDateFormat format1 = new SimpleDateFormat("MM/dd/yyyy");
                SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
                Date date = format1.parse(startDate);
                String tempStart = format2.format(date);
                if(endDate.compareTo("")!=0){
                         date = format1.parse(endDate);
                          tempEnd = format2.format(date);
                }
               
               
               
                
                
                ps = conn.prepareStatement("insert into toDoList values(?,?,?,?,?,?)");
                
                ps.setInt(1, userId);
                ps.setInt(2, groupId);
                ps.setString(3, feature);
                ps.setString(4, topic);
                ps.setString(5, tempStart);
                
                  ps.setString(6, tempEnd);
               
                System.out.println(ps.execute());

            } catch (SQLException e) {
                e.printStackTrace();

            } finally {
                DBConnection.closePStatement(ps);
                DBConnection.closeDBConnection(conn);
            }
        }

    }
}
