/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author apurv and Rohit
 */
public class ConferenceDetails {

    private int id;
    private String startConferenceTime;
    private String stopConferenceTime;
    private String email;
    private String topic;
    private int noOfParticipants;
    private int timedifference;
    private int totalMember;
    private int groupId;
    private double attendance;
    private int chatCount;

 

    public String getStartConferenceTime() {
        return startConferenceTime;
    }

    public void setStartConferenceTime(String startConferenceTime) {
        this.startConferenceTime = startConferenceTime;
    }

    public String getStopConferenceTime() {
        return stopConferenceTime;
    }

    public void setStopConferenceTime(String stopConferenceTime) {
        this.stopConferenceTime = stopConferenceTime;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public int getNoOfParticipants() {
        return noOfParticipants;
    }

    public void setNoOfParticipants(int noOfParticipants) {
        this.noOfParticipants = noOfParticipants;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTotalMember() {
        return totalMember;
    }

    public void setTotalMember(int totalMember) {
        this.totalMember = totalMember;
    }

    public int getGroupId() {
        return groupId;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }

    public double getAttendance() {
        return attendance;
    }

    public void setAttendance(double attendance) {
        this.attendance = attendance;
    }

    public int getChatCount() {
        return chatCount;
    }

    public void setChatCount(int chatCount) {
        this.chatCount = chatCount;
    }

    public int getTimedifference() {
        return timedifference;
    }

    public void setTimedifference(int timedifference) {
        this.timedifference = timedifference;
    }

}
