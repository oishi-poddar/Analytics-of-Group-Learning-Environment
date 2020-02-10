/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author rohitkr2997
 */
public class AttendanceConferenceMember {
    
    private double attendance;
    private int totalTimeConference;
    private int timeYouGive;
    private int totalConference;
    private int confyouAttended;
    
    public double getAttendance() {
        return attendance;
    }

    public void setAttendance(double attendance) {
        this.attendance = attendance;
    }

    public int getTotalTimeConference() {
        return totalTimeConference;
    }

    public void setTotalTimeConference(int totalTimeConference) {
        this.totalTimeConference = totalTimeConference;
    }

    public int getTimeYouGive() {
        return timeYouGive;
    }

    public void setTimeYouGive(int timeYouGive) {
        this.timeYouGive = timeYouGive;
    }

    public int getTotalConference() {
        return totalConference;
    }

    public void setTotalConference(int totalConference) {
        this.totalConference = totalConference;
    }

    public int getConfyouAttended() {
        return confyouAttended;
    }

    public void setConfyouAttended(int confyouAttended) {
        this.confyouAttended = confyouAttended;
    }
    
}
