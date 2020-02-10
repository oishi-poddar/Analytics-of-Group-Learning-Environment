/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author asl
 */
public class ParticipantReasons {

    private int id;
    private int workshopid;
    private int participantid;
    private String status;
    private String reason;
    private int updateby;

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

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
     * @return the participantid
     */
    public int getParticipantid() {
        return participantid;
    }

    /**
     * @param participantid the participantid to set
     */
    public void setParticipantid(int participantid) {
        this.participantid = participantid;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * @return the reason
     */
    public String getReason() {
        return reason;
    }

    /**
     * @param reason the reason to set
     */
    public void setReason(String reason) {
        this.reason = reason;
    }

    /**
     * @return the updateby
     */
    public int getUpdateby() {
        return updateby;
    }

    /**
     * @param updateby the updateby to set
     */
    public void setUpdateby(int updateby) {
        this.updateby = updateby;
    }
}
