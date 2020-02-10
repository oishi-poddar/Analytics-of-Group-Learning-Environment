/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Abinaya
 */
public class AttendanceSheet {

    private String workshopid;
    private String rcid;
    private ArrayList<String> sessionid;
    private ArrayList<String> isPresent;
    private String participantid;
    private ArrayList<String> id;
    private Person participantDetail;
    private int ifAttendanceCanBeUpdated;
    private String sessionAttended;
    private String totalSessions;
    private String upload_fileName;
    private String upload_date;
    private int absentEvenInASession = 0;
    private String absentTimeSlots;
    private ArrayList<String> time_slot;
    private Date dateOfSession_1;

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

    /**
     * @return the rcid
     */
    public String getRcid() {
        return rcid;
    }

    /**
     * @param rcid the rcid to set
     */
    public void setRcid(String rcid) {
        this.rcid = rcid;
    }

    /**
     * @return the sessionid
     */
    public ArrayList<String> getSessionid() {
        return sessionid;
    }

    /**
     * @param sessionid the sessionid to set
     */
    public void setSessionid(ArrayList<String> sessionid) {
        this.sessionid = sessionid;
    }

    /**
     * @return the isPresent
     */
    public ArrayList<String> getIsPresent() {
        return isPresent;
    }

    /**
     * @param isPresent the isPresent to set
     */
    public void setIsPresent(ArrayList<String> isPresent) {
        this.isPresent = isPresent;
    }

    /**
     * @return the participantid
     */
    public String getParticipantid() {
        return participantid;
    }

    /**
     * @param participantid the participantid to set
     */
    public void setParticipantid(String participantid) {
        this.participantid = participantid;
    }

    /**
     * @return the id
     */
    public ArrayList<String> getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(ArrayList<String> id) {
        this.id = id;
    }

    /**
     * @return the participantDetail
     */
    public Person getParticipantDetail() {
        return participantDetail;
    }

    /**
     * @param participantDetail the participantDetail to set
     */
    public void setParticipantDetail(Person participantDetail) {
        this.participantDetail = participantDetail;
    }

    /**
     * @return the ifAttendanceCanBeUpdated
     */
    public int getIfAttendanceCanBeUpdated() {
        return ifAttendanceCanBeUpdated;
    }

    /**
     * @param ifAttendanceCanBeUpdated the ifAttendanceCanBeUpdated to set
     */
    public void setIfAttendanceCanBeUpdated(int ifAttendanceCanBeUpdated) {
        this.ifAttendanceCanBeUpdated = ifAttendanceCanBeUpdated;
    }

    /**
     * @return the sessionAttended
     */
    public String getSessionAttended() {
        return sessionAttended;
    }

    /**
     * @param sessionAttended the sessionAttended to set
     */
    public void setSessionAttended(String sessionAttended) {
        this.sessionAttended = sessionAttended;
    }

    /**
     * @return the totalSessions
     */
    public String getTotalSessions() {
        return totalSessions;
    }

    /**
     * @param totalSessions the totalSessions to set
     */
    public void setTotalSessions(String totalSessions) {
        this.totalSessions = totalSessions;
    }

    /**
     * @return the upload_fileName
     */
    public String getUpload_fileName() {
        return upload_fileName;
    }

    /**
     * @param upload_fileName the upload_fileName to set
     */
    public void setUpload_fileName(String upload_fileName) {
        this.upload_fileName = upload_fileName;
    }

    /**
     * @return the upload_date
     */
    public String getUpload_date() {
        return upload_date;
    }

    /**
     * @param upload_date the upload_date to set
     */
    public void setUpload_date(String upload_date) {
        this.upload_date = upload_date;
    }

    /**
     * @return the absentEvenInASession
     */
    public int getAbsentEvenInASession() {
        return absentEvenInASession;
    }

    /**
     * @param absentEvenInASession the absentEvenInASession to set
     */
    public void setAbsentEvenInASession(int absentEvenInASession) {
        this.absentEvenInASession = absentEvenInASession;
    }

    /**
     * @return the absentTimeSlots
     */
    public String getAbsentTimeSlots() {
        return absentTimeSlots;
    }

    /**
     * @param absentTimeSlots the absentTimeSlots to set
     */
    public void setAbsentTimeSlots(String absentTimeSlots) {
        this.absentTimeSlots = absentTimeSlots;
    }

    /**
     * @return the time_slot
     */
    public ArrayList<String> getTime_slot() {
        return time_slot;
    }

    /**
     * @param time_slot the time_slot to set
     */
    public void setTime_slot(ArrayList<String> time_slot) {
        this.setTime_slot(time_slot);
    }

    /**
     * @return the dateOfSession_1
     */
    public Date getDateOfSession_1() {
        return dateOfSession_1;
    }

    /**
     * @param dateOfSession_1 the dateOfSession_1 to set
     */
    public void setDateOfSession_1(Date dateOfSession_1) {
        this.dateOfSession_1 = dateOfSession_1;
    }
}
