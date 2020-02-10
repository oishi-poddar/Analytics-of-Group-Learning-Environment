/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.util.Date;

/**
 *
 * @author Abinaya
 */
public class RemoteCenter {

    private int remoteCenterId;
    private String remoteCenterName;
    private String rc_city;
    private String rc_state;
    private boolean isActive;
    private String enc_RC;
    private String address;
    private String district;
    private int pincode;
    private String rc_enc;
    private int isactive;
    private int isnew = 0;
    // for remote center details
    private String rc_coordinator_email;
    private String rc_status;
    private int last_updatedby;
    private Date last_update;
    private int res_instituteid;
    private String instituteName;
    private String rc_autonomous;
    private String academic_cal;
    private String affiliated_university;
    private String city1;
    private String state1;
    private String isAlreadyCertiGen = "no";
    private String generateTime;
    private String certiGeneratedCount;
    private String participantCount;
    private State state;
    private City city;

    /**
     * @return the remoteCenterId
     */
    public int getRemoteCenterId() {
        return remoteCenterId;
    }

    /**
     * @param remoteCenterId the remoteCenterId to set
     */
    public void setRemoteCenterId(int remoteCenterId) {
        this.remoteCenterId = remoteCenterId;
    }

    /**
     * @return the remoteCenterName
     */
    public String getRemoteCenterName() {
        return remoteCenterName;
    }

    /**
     * @param remoteCenterName the remoteCenterName to set
     */
    public void setRemoteCenterName(String remoteCenterName) {
        this.remoteCenterName = remoteCenterName;
    }

    /**
     * @return the rc_city
     */
    public String getRc_city() {
        return rc_city;
    }

    /**
     * @param rc_city the rc_city to set
     */
    public void setRc_city(String rc_city) {
        this.rc_city = rc_city;
    }

    /**
     * @return the rc_state
     */
    public String getRc_state() {
        return rc_state;
    }

    /**
     * @param rc_state the rc_state to set
     */
    public void setRc_state(String rc_state) {
        this.rc_state = rc_state;
    }

    /**
     * @return the isActive
     */
    public boolean getIsActive() {
        return isIsActive();
    }

    /**
     * @param isActive the isActive to set
     */
    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    /**
     * @return the enc_RC
     */
    public String getEnc_RC() {
        return enc_RC;
    }

    /**
     * @param enc_RC the enc_RC to set
     */
    public void setEnc_RC(String enc_RC) {
        this.enc_RC = enc_RC;
    }

    /**
     * @return the address
     */
    public String getAddress() {
        return address;
    }

    /**
     * @param address the address to set
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * @return the district
     */
    public String getDistrict() {
        return district;
    }

    /**
     * @param district the district to set
     */
    public void setDistrict(String district) {
        this.district = district;
    }

    /**
     * @return the pincode
     */
    public int getPincode() {
        return pincode;
    }

    /**
     * @param pincode the pincode to set
     */
    public void setPincode(int pincode) {
        this.pincode = pincode;
    }

    /**
     * @return the rc_enc
     */
    public String getRc_enc() {
        return rc_enc;
    }

    /**
     * @param rc_enc the rc_enc to set
     */
    public void setRc_enc(String rc_enc) {
        this.rc_enc = rc_enc;
    }

    /**
     * @return the isactive
     */
    public int getIsactive() {
        return isactive;
    }

    /**
     * @param isactive the isactive to set
     */
    public void setIsactive(int isactive) {
        this.isactive = isactive;
    }

    /**
     * @return the isnew
     */
    public int getIsnew() {
        return isnew;
    }

    /**
     * @param isnew the isnew to set
     */
    public void setIsnew(int isnew) {
        this.isnew = isnew;
    }

    /**
     * @return the rc_coordinator_email
     */
    public String getRc_coordinator_email() {
        return rc_coordinator_email;
    }

    /**
     * @param rc_coordinator_email the rc_coordinator_email to set
     */
    public void setRc_coordinator_email(String rc_coordinator_email) {
        this.rc_coordinator_email = rc_coordinator_email;
    }

    /**
     * @return the rc_status
     */
    public String getRc_status() {
        return rc_status;
    }

    /**
     * @param rc_status the rc_status to set
     */
    public void setRc_status(String rc_status) {
        this.rc_status = rc_status;
    }

    /**
     * @return the last_updatedby
     */
    public int getLast_updatedby() {
        return last_updatedby;
    }

    /**
     * @param last_updatedby the last_updatedby to set
     */
    public void setLast_updatedby(int last_updatedby) {
        this.last_updatedby = last_updatedby;
    }

    /**
     * @return the isActive
     */
    public boolean isIsActive() {
        return isActive;
    }

    /**
     * @return the last_update
     */
    public Date getLast_update() {
        return last_update;
    }

    /**
     * @param last_update the last_update to set
     */
    public void setLast_update(Date last_update) {
        this.last_update = last_update;
    }

    /**
     * @return the res_instituteid
     */
    public int getRes_instituteid() {
        return res_instituteid;
    }

    /**
     * @param res_instituteid the res_instituteid to set
     */
    public void setRes_instituteid(int res_instituteid) {
        this.res_instituteid = res_instituteid;
    }

    /**
     * @return the instituteName
     */
    public String getInstituteName() {
        return instituteName;
    }

    /**
     * @param instituteName the instituteName to set
     */
    public void setInstituteName(String instituteName) {
        this.instituteName = instituteName;
    }

    /**
     * @return the rc_autonomous
     */
    public String getRc_autonomous() {
        return rc_autonomous;
    }

    /**
     * @param rc_autonomous the rc_autonomous to set
     */
    public void setRc_autonomous(String rc_autonomous) {
        this.rc_autonomous = rc_autonomous;
    }

    /**
     * @return the academic_cal
     */
    public String getAcademic_cal() {
        return academic_cal;
    }

    /**
     * @param academic_cal the academic_cal to set
     */
    public void setAcademic_cal(String academic_cal) {
        this.academic_cal = academic_cal;
    }

    /**
     * @return the affiliated_university
     */
    public String getAffiliated_university() {
        return affiliated_university;
    }

    /**
     * @param affiliated_university the affiliated_university to set
     */
    public void setAffiliated_university(String affiliated_university) {
        this.affiliated_university = affiliated_university;
    }

    /**
     * @return the city1
     */
    public String getCity1() {
        return city1;
    }

    /**
     * @param city1 the city1 to set
     */
    public void setCity1(String city1) {
        this.city1 = city1;
    }

    /**
     * @return the state1
     */
    public String getState1() {
        return state1;
    }

    /**
     * @param state1 the state1 to set
     */
    public void setState1(String state1) {
        this.state1 = state1;
    }

    /**
     * @return the isAlreadyCertiGen
     */
    public String getIsAlreadyCertiGen() {
        return isAlreadyCertiGen;
    }

    /**
     * @param isAlreadyCertiGen the isAlreadyCertiGen to set
     */
    public void setIsAlreadyCertiGen(String isAlreadyCertiGen) {
        this.isAlreadyCertiGen = isAlreadyCertiGen;
    }

    /**
     * @return the generateTime
     */
    public String getGenerateTime() {
        return generateTime;
    }

    /**
     * @param generateTime the generateTime to set
     */
    public void setGenerateTime(String generateTime) {
        this.generateTime = generateTime;
    }

    /**
     * @return the certiGeneratedCount
     */
    public String getCertiGeneratedCount() {
        return certiGeneratedCount;
    }

    /**
     * @param certiGeneratedCount the certiGeneratedCount to set
     */
    public void setCertiGeneratedCount(String certiGeneratedCount) {
        this.certiGeneratedCount = certiGeneratedCount;
    }

    /**
     * @return the participantCount
     */
    public String getParticipantCount() {
        return participantCount;
    }

    /**
     * @param participantCount the participantCount to set
     */
    public void setParticipantCount(String participantCount) {
        this.participantCount = participantCount;
    }

    /**
     * @return the state
     */
    public State getState() {
        return state;
    }

    /**
     * @param state the state to set
     */
    public void setState(State state) {
        this.state = state;
    }

    /**
     * @return the city
     */
    public City getCity() {
        return city;
    }

    /**
     * @param city the city to set
     */
    public void setCity(City city) {
        this.city = city;
    }
}
