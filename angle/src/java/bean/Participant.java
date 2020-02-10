/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.sql.Timestamp;

/**
 *
 * @author abinaya
 */
public class Participant {

    private int isAlreadyRegistered = 0;
    private int participantid = 0;
    private int accomodation = 0;
    private Timestamp regtime = null;
    private String permissionLetter = null;
    private String status = null;
    private int letterVerified = 0;
    private int rcid = 0;
    private int isNotValidForUpdate = 0;
    private String name;
    private Institute institute;
    private String rcname;
    private int if_institute_is_rc;
    private int passing_year;

    /**
     * @return the isAlreadyRegistered
     */
    public int getIsAlreadyRegistered() {
        return isAlreadyRegistered;
    }

    /**
     * @param isAlreadyRegistered the isAlreadyRegistered to set
     */
    public void setIsAlreadyRegistered(int isAlreadyRegistered) {
        this.isAlreadyRegistered = isAlreadyRegistered;
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
     * @return the accomodation
     */
    public int getAccomodation() {
        return accomodation;
    }

    /**
     * @param accomodation the accomodation to set
     */
    public void setAccomodation(int accomodation) {
        this.accomodation = accomodation;
    }

    /**
     * @return the regtime
     */
    public Timestamp getRegtime() {
        return regtime;
    }

    /**
     * @param regtime the regtime to set
     */
    public void setRegtime(Timestamp regtime) {
        this.regtime = regtime;
    }

    /**
     * @return the permissionLetter
     */
    public String getPermissionLetter() {
        return permissionLetter;
    }

    /**
     * @param permissionLetter the permissionLetter to set
     */
    public void setPermissionLetter(String permissionLetter) {
        this.permissionLetter = permissionLetter;
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
     * @return the letterVerified
     */
    public int getLetterVerified() {
        return letterVerified;
    }

    /**
     * @param letterVerified the letterVerified to set
     */
    public void setLetterVerified(int letterVerified) {
        this.letterVerified = letterVerified;
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
     * @return the isNotValidForUpdate
     */
    public int getIsNotValidForUpdate() {
        return isNotValidForUpdate;
    }

    /**
     * @param isNotValidForUpdate the isNotValidForUpdate to set
     */
    public void setIsNotValidForUpdate(int isNotValidForUpdate) {
        this.isNotValidForUpdate = isNotValidForUpdate;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the institute
     */
    public Institute getInstitute() {
        return institute;
    }

    /**
     * @param institute the institute to set
     */
    public void setInstitute(Institute institute) {
        this.institute = institute;
    }

    /**
     * @return the rcname
     */
    public String getRcname() {
        return rcname;
    }

    /**
     * @param rcname the rcname to set
     */
    public void setRcname(String rcname) {
        this.rcname = rcname;
    }

    /**
     * @return the if_institute_is_rc
     */
    public int getIf_institute_is_rc() {
        return if_institute_is_rc;
    }

    /**
     * @param if_institute_is_rc the if_institute_is_rc to set
     */
    public void setIf_institute_is_rc(int if_institute_is_rc) {
        this.if_institute_is_rc = if_institute_is_rc;
    }

    /**
     * @return the passing_year
     */
    public int getPassing_year() {
        return passing_year;
    }

    /**
     * @param passing_year the passing_year to set
     */
    public void setPassing_year(int passing_year) {
        this.passing_year = passing_year;
    }
}
