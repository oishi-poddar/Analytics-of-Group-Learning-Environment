/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.sql.Array;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Abinaya
 */
public class AttendanceSchedule {

    private int day;
    private int idOfParticularSession;
    private String dateOfSession;
    private String numberOfSessions;
    private String comments;
    private ArrayList<String> session_comment;
    private ArrayList<String> session_time;
    private ArrayList<String> session_time_to;
    private ArrayList<String> session_radio;
    private ArrayList<String> session_comm;
    private ArrayList<String> date_till;
    private String time_slot;
    private String date_string;
    private int isActive;
    private String time_from;
    private String time_to;
    private ArrayList<AttendanceSheet> as;
    private String date_till_1;
    private String sessionAttend = "0";
    private int ifUpdatedByWSC = 0;
    private int if_time_slot_null = 0;
    private String workshopid;

    /**
     * @return the dateOfSession
     */
    public String getDateOfSession() {
        return dateOfSession;
    }

    /**
     * @param dateOfSession the dateOfSession to set
     */
    public void setDateOfSession(String dateOfSession) {
        this.dateOfSession = dateOfSession;
    }

    /**
     * @return the numberOfSessions
     */
    public String getNumberOfSessions() {
        return numberOfSessions;
    }

    /**
     * @param numberOfSessions the numberOfSessions to set
     */
    public void setNumberOfSessions(String numberOfSessions) {
        this.numberOfSessions = numberOfSessions;
    }

    /**
     * @return the comments
     */
    public String getComments() {
        return comments;
    }

    /**
     * @param comments the comments to set
     */
    public void setComments(String comments) {
        this.comments = comments;
    }

//    /**
//     * @return the session_no
//     */
//    public String[] getSession_comment() {
//        return session_comment;
//    }
//
//    /**
//     * @param session_no the session_no to set
//     */
//    public void setSession_comment(String[] session_comment) {
//        this.session_comment = session_comment;
//    }
    /**
     * @return the session_comment
     */
    public ArrayList<String> getSession_comment() {
        return session_comment;
    }

    /**
     * @param session_comment the session_comment to set
     */
    public void setSession_comment(ArrayList<String> session_comment) {
        this.setSession_comment(session_comment);
    }

    /**
     * @return the idOfParticularSession
     */
    public int getIdOfParticularSession() {
        return idOfParticularSession;
    }

    /**
     * @param idOfParticularSession the idOfParticularSession to set
     */
    public void setIdOfParticularSession(int idOfParticularSession) {
        this.idOfParticularSession = idOfParticularSession;
    }

    /**
     * @return the session_time
     */
    public ArrayList<String> getSession_time() {
        return session_time;
    }

    /**
     * @param session_time the session_time to set
     */
    public void setSession_time(ArrayList<String> session_time) {
        this.session_time = session_time;
    }

    /**
     * @return the time_slot
     */
    public String getTime_slot() {
        return time_slot;
    }

    /**
     * @param time_slot the time_slot to set
     */
    public void setTime_slot(String time_slot) {
        this.time_slot = time_slot;
    }

    /**
     * @return the session_comm
     */
    public ArrayList<String> getSession_comm() {
        return session_comm;
    }

    /**
     * @param session_comm the session_comm to set
     */
    public void setSession_comm(ArrayList<String> session_comm) {
        this.session_comm = session_comm;
    }

    /**
     * @return the date_string
     */
    public String getDate_string() {
        return date_string;
    }

    /**
     * @param date_string the date_string to set
     */
    public void setDate_string(String date_string) {
        this.date_string = date_string;
    }

    /**
     * @return the session_radio
     */
    public ArrayList<String> getSession_radio() {
        return session_radio;
    }

    /**
     * @param session_radio the session_radio to set
     */
    public void setSession_radio(ArrayList<String> session_radio) {
        this.session_radio = session_radio;
    }

    /**
     * @return the isActive
     */
    public int getIsActive() {
        return isActive;
    }

    /**
     * @param isActive the isActive to set
     */
    public void setIsActive(int isActive) {
        this.isActive = isActive;
    }

    /**
     * @return the time_from
     */
    public String getTime_from() {
        return time_from;
    }

    /**
     * @param time_from the time_from to set
     */
    public void setTime_from(String time_from) {
        this.time_from = time_from;
    }

    /**
     * @return the time_to
     */
    public String getTime_to() {
        return time_to;
    }

    /**
     * @param time_to the time_to to set
     */
    public void setTime_to(String time_to) {
        this.time_to = time_to;
    }

    /**
     * @return the session_time_to
     */
    public ArrayList<String> getSession_time_to() {
        return session_time_to;
    }

    /**
     * @param session_time_to the session_time_to to set
     */
    public void setSession_time_to(ArrayList<String> session_time_to) {
        this.session_time_to = session_time_to;
    }

    /**
     * @return the as
     */
    public ArrayList<AttendanceSheet> getAs() {
        return as;
    }

    /**
     * @param as the as to set
     */
    public void setAs(ArrayList<AttendanceSheet> as) {
        this.as = as;
    }

    /**
     * @return the date_till
     */
    public ArrayList<String> getDate_till() {
        return date_till;
    }

    /**
     * @param date_till the date_till to set
     */
    public void setDate_till(ArrayList<String> date_till) {
        this.date_till = date_till;
    }

    /**
     * @return the date_till_1
     */
    public String getDate_till_1() {
        return date_till_1;
    }

    /**
     * @param date_till_1 the date_till_1 to set
     */
    public void setDate_till_1(String date_till_1) {
        this.date_till_1 = date_till_1;
    }

    /**
     * @return the sessionAttend
     */
    public String getSessionAttend() {
        return sessionAttend;
    }

    /**
     * @param sessionAttend the sessionAttend to set
     */
    public void setSessionAttend(String sessionAttend) {
        this.sessionAttend = sessionAttend;
    }

    /**
     * @return the ifUpdatedByWSC
     */
    public int getIfUpdatedByWSC() {
        return ifUpdatedByWSC;
    }

    /**
     * @param ifUpdatedByWSC the ifUpdatedByWSC to set
     */
    public void setIfUpdatedByWSC(int ifUpdatedByWSC) {
        this.ifUpdatedByWSC = ifUpdatedByWSC;
    }

    /**
     * @return the if_time_slot_null
     */
    public int getIf_time_slot_null() {
        return if_time_slot_null;
    }

    /**
     * @param if_time_slot_null the if_time_slot_null to set
     */
    public void setIf_time_slot_null(int if_time_slot_null) {
        this.if_time_slot_null = if_time_slot_null;
    }

    /**
     * @return the workshopid
     */
    public String getWorkshopid() {
        return workshopid;
    }

    /**
     * @param workshopid the workshopid to set
     */
    public void setWorkshopid(String workshopid) {
        this.workshopid = workshopid;
    }
}
