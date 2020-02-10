/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.sql.Timestamp;

/**
 *
 * @author asl
 */
public class CertificateAudit {

    private int workshopid;
    private int rcid;
    private String participants;
    private Timestamp time;
    private String updated_by;

    /**
     * @return the workshopid
     */
    public int getWorkshopid() {
        return workshopid;
    }

    /**
     * @param workshopid the workshopid to set
     */
    public void setWorkshopid(int workshopid) {
        this.workshopid = workshopid;
    }

    /**
     * @return the rcid
     */
    public int getRcid() {
        return rcid;
    }

    /**
     * @param rcid the rcid to set
     */
    public void setRcid(int rcid) {
        this.rcid = rcid;
    }

    /**
     * @return the participants
     */
    public String getParticipants() {
        return participants;
    }

    /**
     * @param participants the participants to set
     */
    public void setParticipants(String participants) {
        this.participants = participants;
    }

    /**
     * @return the time
     */
    public Timestamp getTime() {
        return time;
    }

    /**
     * @param time the time to set
     */
    public void setTime(Timestamp time) {
        this.time = time;
    }

    /**
     * @return the updated_by
     */
    public String getUpdated_by() {
        return updated_by;
    }

    /**
     * @param updated_by the updated_by to set
     */
    public void setUpdated_by(String updated_by) {
        this.updated_by = updated_by;
    }
}
