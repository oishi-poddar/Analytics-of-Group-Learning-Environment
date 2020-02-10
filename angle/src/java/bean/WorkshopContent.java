/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.text.DateFormat;

/**
 *
 * @author Abinaya
 */
public class WorkshopContent {

    /**
     * variables for the workshop
     */
    private int categorycode;
    private int workshopid;
    private String workshopname;
    private String sponsor;
    private String startdate;
    private String enddate;
    private String startdate1; //for form in back end changed date format
    private String enddate1; //for form in back end date format
    private String eventstatus;
    private String lastdatereg;
    private String startdatereg;
    private int workshopExpiry = 0; // for registration expiry
    private int workshopCompleted = 0; // actual workshop completion
    /**
     * brouchers and other paths
     */
    private String brochurepath;
    private String permissionLetter;
    /**
     * variables for actual content
     */
    private String introduction;
    private String objectives; //course content
    private String durationvenue;
    private String teachingfaculty; //teaching faculty
    private String author;
    private String whoshouldattend;
    private String note;
    private String coursefee;
    private String accomodation;
    private String howtoapply;
    private String contact;
    private String instructions;
    private String certificateCriteria;
    /**
     * misc
     */
    private String eventdetailspagepath;
    private String resourcepath;
    private String coursewarestatus;
    private String announcement;
    private String certificatepath;
    private String mailcontentpath;
    private String schedulepath;
    private String link;
    private String eligibility;
    //variables for the url i.e, encrypted strings
    private String workshopid_encrypted;
    private String rcid_encrypted;
    private String status_encrypted;
    private String link_participantList;
    private WorkshopCount workshopCount;
    private boolean isNew = false;
    private int respectiveCoWorkshopid = 0;
    private String link_updateRegistration;
    // variables for accommodation and permission letter ( new columns in workshop table)
    private int accommodation = 0;
    private int permissionIfRequired = 0;
    private int lessThanStartDate = 0;
    private int lms_moodle = 0;
    private int lms_iitbx = 0;
    private String moodle_coursename = "";
    private String iitbx_coursename = "";
    private int certificateGroupInstitute;
    private int certificateGroupRC;
    // for attendance creation
    private int ifAttendanceCanBeCreated = 0;
    // to display workshop coordinator interface
    private int ifCanDisplayWCCDashboard = 0;
    private String rccUrl = "home.html";
    private int maincc = 0;
    // for displaying workshops after coordinator workshop is over
    private int ifResCoorWorkshopIsComplete = 0;
    private String feeAmount;
    private String facultyFlag;
    private String ccpay;
    private String workshopRemark;
    private String totalCount;
    private String totalSumOfPayment;
    private String lastUpdated;
    private int dateToBeDisplayed;
    private String extraDownloads;
    private int payment_at_rc = 0;
    private int payment_at_iitb = 0;
    private int without_RC = 0;
    private String isRCParticipate = "none";
    private int dateBeforeFlag = 0;

    /**
     * @return the categorycode
     */
    public int getCategorycode() {
        return categorycode;
    }

    /**
     * @param categorycode the categorycode to set
     */
    public void setCategorycode(int categorycode) {
        this.categorycode = categorycode;
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
     * @return the workshopname
     */
    public String getWorkshopname() {
        return workshopname;
    }

    /**
     * @param workshopname the workshopname to set
     */
    public void setWorkshopname(String workshopname) {
        this.workshopname = workshopname;
    }

    /**
     * @return the sponsor
     */
    public String getSponsor() {
        return sponsor;
    }

    /**
     * @param sponsor the sponsor to set
     */
    public void setSponsor(String sponsor) {
        this.sponsor = sponsor;
    }

    /**
     * @return the startdate
     */
    public String getStartdate() {
        return startdate;
    }

    /**
     * @param startdate the startdate to set
     */
    public void setStartdate(String startdate) {
        this.startdate = startdate;
    }

    /**
     * @return the enddate
     */
    public String getEnddate() {
        return enddate;
    }

    /**
     * @param enddate the enddate to set
     */
    public void setEnddate(String enddate) {
        this.enddate = enddate;
    }

    /**
     * @return the eventstatus
     */
    public String getEventstatus() {
        return eventstatus;
    }

    /**
     * @param eventstatus the eventstatus to set
     */
    public void setEventstatus(String eventstatus) {
        this.eventstatus = eventstatus;
    }

    /**
     * @return the lastdatereg
     */
    public String getLastdatereg() {
        return lastdatereg;
    }

    /**
     * @param lastdatereg the lastdatereg to set
     */
    public void setLastdatereg(String lastdatereg) {
        this.lastdatereg = lastdatereg;
    }

    /**
     * @return the startdatereg
     */
    public String getStartdatereg() {
        return startdatereg;
    }

    /**
     * @param startdatereg the startdatereg to set
     */
    public void setStartdatereg(String startdatereg) {
        this.startdatereg = startdatereg;
    }

    /**
     * @return the brochurepath
     */
    public String getBrochurepath() {
        return brochurepath;
    }

    /**
     * @param brochurepath the brochurepath to set
     */
    public void setBrochurepath(String brochurepath) {
        this.brochurepath = brochurepath;
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
     * @return the introduction
     */
    public String getIntroduction() {
        return introduction;
    }

    /**
     * @param introduction the introduction to set
     */
    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    /**
     * @return the objectives
     */
    public String getObjectives() {
        return objectives;
    }

    /**
     * @param objectives the objectives to set
     */
    public void setObjectives(String objectives) {
        this.objectives = objectives;
    }

    /**
     * @return the durationvenue
     */
    public String getDurationvenue() {
        return durationvenue;
    }

    /**
     * @param durationvenue the durationvenue to set
     */
    public void setDurationvenue(String durationvenue) {
        this.durationvenue = durationvenue;
    }

    /**
     * @return the teachingfaculty
     */
    public String getTeachingfaculty() {
        return teachingfaculty;
    }

    /**
     * @param teachingfaculty the teachingfaculty to set
     */
    public void setTeachingfaculty(String teachingfaculty) {
        this.teachingfaculty = teachingfaculty;
    }

    /**
     * @return the whoshouldattend
     */
    public String getWhoshouldattend() {
        return whoshouldattend;
    }

    /**
     * @param whoshouldattend the whoshouldattend to set
     */
    public void setWhoshouldattend(String whoshouldattend) {
        this.whoshouldattend = whoshouldattend;
    }

    /**
     * @return the note
     */
    public String getNote() {
        return note;
    }

    /**
     * @param note the note to set
     */
    public void setNote(String note) {
        this.note = note;
    }

    /**
     * @return the coursefee
     */
    public String getCoursefee() {
        return coursefee;
    }

    /**
     * @param coursefee the coursefee to set
     */
    public void setCoursefee(String coursefee) {
        this.coursefee = coursefee;
    }

    /**
     * @return the accomodation
     */
    public String getAccomodation() {
        return accomodation;
    }

    /**
     * @param accomodation the accomodation to set
     */
    public void setAccomodation(String accomodation) {
        this.accomodation = accomodation;
    }

    /**
     * @return the howtoapply
     */
    public String getHowtoapply() {
        return howtoapply;
    }

    /**
     * @param howtoapply the howtoapply to set
     */
    public void setHowtoapply(String howtoapply) {
        this.howtoapply = howtoapply;
    }

    /**
     * @return the contact
     */
    public String getContact() {
        return contact;
    }

    /**
     * @param contact the contact to set
     */
    public void setContact(String contact) {
        this.contact = contact;
    }

    /**
     * @return the eventdetailspagepath
     */
    public String getEventdetailspagepath() {
        return eventdetailspagepath;
    }

    /**
     * @param eventdetailspagepath the eventdetailspagepath to set
     */
    public void setEventdetailspagepath(String eventdetailspagepath) {
        this.eventdetailspagepath = eventdetailspagepath;
    }

    /**
     * @return the resourcepath
     */
    public String getResourcepath() {
        return resourcepath;
    }

    /**
     * @param resourcepath the resourcepath to set
     */
    public void setResourcepath(String resourcepath) {
        this.resourcepath = resourcepath;
    }

    /**
     * @return the coursewarestatus
     */
    public String getCoursewarestatus() {
        return coursewarestatus;
    }

    /**
     * @param coursewarestatus the coursewarestatus to set
     */
    public void setCoursewarestatus(String coursewarestatus) {
        this.coursewarestatus = coursewarestatus;
    }

    /**
     * @return the announcement
     */
    public String getAnnouncement() {
        return announcement;
    }

    /**
     * @param announcement the announcement to set
     */
    public void setAnnouncement(String announcement) {
        this.announcement = announcement;
    }

    /**
     * @return the certificatepath
     */
    public String getCertificatepath() {
        return certificatepath;
    }

    /**
     * @param certificatepath the certificatepath to set
     */
    public void setCertificatepath(String certificatepath) {
        this.certificatepath = certificatepath;
    }

    /**
     * @return the mailcontentpath
     */
    public String getMailcontentpath() {
        return mailcontentpath;
    }

    /**
     * @param mailcontentpath the mailcontentpath to set
     */
    public void setMailcontentpath(String mailcontentpath) {
        this.mailcontentpath = mailcontentpath;
    }

    /**
     * @return the schedulepath
     */
    public String getSchedulepath() {
        return schedulepath;
    }

    /**
     * @param schedulepath the schedulepath to set
     */
    public void setSchedulepath(String schedulepath) {
        this.schedulepath = schedulepath;
    }

    /**
     * @return the link
     */
    public String getLink() {
        return link;
    }

    /**
     * @param link the link to set
     */
    public void setLink(String link) {
        this.link = link;
    }

    /**
     * @return the eligibility
     */
    public String getEligibility() {
        return eligibility;
    }

    /**
     * @param eligibility the eligibility to set
     */
    public void setEligibility(String eligibility) {
        this.eligibility = eligibility;
    }

    /**
     * @return the workshopid_encrypted
     */
    public String getWorkshopid_encrypted() {
        return workshopid_encrypted;
    }

    /**
     * @param workshopid_encrypted the workshopid_encrypted to set
     */
    public void setWorkshopid_encrypted(String workshopid_encrypted) {
        this.workshopid_encrypted = workshopid_encrypted;
    }

    /**
     * @return the rcid_encrypted
     */
    public String getRcid_encrypted() {
        return rcid_encrypted;
    }

    /**
     * @param rcid_encrypted the rcid_encrypted to set
     */
    public void setRcid_encrypted(String rcid_encrypted) {
        this.rcid_encrypted = rcid_encrypted;
    }

    /**
     * @return the status_encrypted
     */
    public String getStatus_encrypted() {
        return status_encrypted;
    }

    /**
     * @param status_encrypted the status_encrypted to set
     */
    public void setStatus_encrypted(String status_encrypted) {
        this.status_encrypted = status_encrypted;
    }

    /**
     * @return the link_participantList
     */
    public String getLink_participantList() {
        return link_participantList;
    }

    /**
     * @param link_participantList the link_participantList to set
     */
    public void setLink_participantList(String link_participantList) {
        this.link_participantList = link_participantList;
    }

    /**
     * @return the author
     */
    public String getAuthor() {
        return author;
    }

    /**
     * @param author the author to set
     */
    public void setAuthor(String author) {
        this.author = author;
    }

    /**
     * @return the workshopCount
     */
    public WorkshopCount getWorkshopCount() {
        return workshopCount;
    }

    /**
     * @param workshopCount the workshopCount to set
     */
    public void setWorkshopCount(WorkshopCount workshopCount) {
        this.workshopCount = workshopCount;
    }

    /**
     * @return the workshopExpiry
     */
    public int getWorkshopExpiry() {
        return workshopExpiry;
    }

    /**
     * @param workshopExpiry the workshopExpiry to set
     */
    public void setWorkshopExpiry(int workshopExpiry) {
        this.workshopExpiry = workshopExpiry;
    }

    /**
     * @return the isNew
     */
    public boolean getIsNew() {
        return isIsNew();
    }

    /**
     * @param isNew the isNew to set
     */
    public void setIsNew(boolean isNew) {
        this.isNew = isNew;
    }

    /**
     * @return the respectiveCoWorkshopid
     */
    public int getRespectiveCoWorkshopid() {
        return respectiveCoWorkshopid;
    }

    /**
     * @param respectiveCoWorkshopid the respectiveCoWorkshopid to set
     */
    public void setRespectiveCoWorkshopid(int respectiveCoWorkshopid) {
        this.respectiveCoWorkshopid = respectiveCoWorkshopid;
    }

    /**
     * @return the enddate1
     */
    public String getEnddate1() {
        return enddate1;
    }

    /**
     * @param enddate1 the enddate1 to set
     */
    public void setEnddate1(String enddate1) {
        this.enddate1 = enddate1;
    }

    /**
     * @return the startdate1
     */
    public String getStartdate1() {
        return startdate1;
    }

    /**
     * @param startdate1 the startdate1 to set
     */
    public void setStartdate1(String startdate1) {
        this.startdate1 = startdate1;
    }

    /**
     * @return the accommodation
     */
    public int getAccommodation() {
        return accommodation;
    }

    /**
     * @param accommodation the accommodation to set
     */
    public void setAccommodation(int accommodation) {
        this.accommodation = accommodation;
    }

    /**
     * @return the permissionIfRequired
     */
    public int getPermissionIfRequired() {
        return permissionIfRequired;
    }

    /**
     * @param permissionIfRequired the permissionIfRequired to set
     */
    public void setPermissionIfRequired(int permissionIfRequired) {
        this.permissionIfRequired = permissionIfRequired;
    }

    /**
     * @return the isNew
     */
    public boolean isIsNew() {
        return isNew;
    }

    /**
     * @return the link_updateRegistration
     */
    public String getLink_updateRegistration() {
        return link_updateRegistration;
    }

    /**
     * @param link_updateRegistration the link_updateRegistration to set
     */
    public void setLink_updateRegistration(String link_updateRegistration) {
        this.link_updateRegistration = link_updateRegistration;
    }

    /**
     * @return the lessThanStartDate
     */
    public int getLessThanStartDate() {
        return lessThanStartDate;
    }

    /**
     * @param lessThanStartDate the lessThanStartDate to set
     */
    public void setLessThanStartDate(int lessThanStartDate) {
        this.lessThanStartDate = lessThanStartDate;
    }

    /**
     * @return the lms_moodle
     */
    public int getLms_moodle() {
        return lms_moodle;
    }

    /**
     * @param lms_moodle the lms_moodle to set
     */
    public void setLms_moodle(int lms_moodle) {
        this.lms_moodle = lms_moodle;
    }

    /**
     * @return the lms_iitbx
     */
    public int getLms_iitbx() {
        return lms_iitbx;
    }

    /**
     * @param lms_iitbx the lms_iitbx to set
     */
    public void setLms_iitbx(int lms_iitbx) {
        this.lms_iitbx = lms_iitbx;
    }

    /**
     * @return the moodle_coursename
     */
    public String getMoodle_coursename() {
        return moodle_coursename;
    }

    /**
     * @param moodle_coursename the moodle_coursename to set
     */
    public void setMoodle_coursename(String moodle_coursename) {
        this.moodle_coursename = moodle_coursename;
    }

    /**
     * @return the iitbx_coursename
     */
    public String getIitbx_coursename() {
        return iitbx_coursename;
    }

    /**
     * @param iitbx_coursename the iitbx_coursename to set
     */
    public void setIitbx_coursename(String iitbx_coursename) {
        this.iitbx_coursename = iitbx_coursename;
    }

    /**
     * @return the certificateGroupInstitute
     */
    public int getCertificateGroupInstitute() {
        return certificateGroupInstitute;
    }

    /**
     * @param certificateGroupInstitute the certificateGroupInstitute to set
     */
    public void setCertificateGroupInstitute(int certificateGroupInstitute) {
        this.certificateGroupInstitute = certificateGroupInstitute;
    }

    /**
     * @return the certificateGroupRC
     */
    public int getCertificateGroupRC() {
        return certificateGroupRC;
    }

    /**
     * @param certificateGroupRC the certificateGroupRC to set
     */
    public void setCertificateGroupRC(int certificateGroupRC) {
        this.certificateGroupRC = certificateGroupRC;
    }

    /**
     * @return the ifAttendanceCanBeCreated
     */
    public int getIfAttendanceCanBeCreated() {
        return ifAttendanceCanBeCreated;
    }

    /**
     * @param ifAttendanceCanBeCreated the ifAttendanceCanBeCreated to set
     */
    public void setIfAttendanceCanBeCreated(int ifAttendanceCanBeCreated) {
        this.ifAttendanceCanBeCreated = ifAttendanceCanBeCreated;
    }

    /**
     * @return the ifCanDisplayWCCDashboard
     */
    public int getIfCanDisplayWCCDashboard() {
        return ifCanDisplayWCCDashboard;
    }

    /**
     * @param ifCanDisplayWCCDashboard the ifCanDisplayWCCDashboard to set
     */
    public void setIfCanDisplayWCCDashboard(int ifCanDisplayWCCDashboard) {
        this.ifCanDisplayWCCDashboard = ifCanDisplayWCCDashboard;
    }

    /**
     * @return the instructions
     */
    public String getInstructions() {
        return instructions;
    }

    /**
     * @param instructions the instructions to set
     */
    public void setInstructions(String instructions) {
        this.instructions = instructions;
    }

    /**
     * @return the rccUrl
     */
    public String getRccUrl() {
        return rccUrl;
    }

    /**
     * @param rccUrl the rccUrl to set
     */
    public void setRccUrl(String rccUrl) {
        this.rccUrl = rccUrl;
    }

    /**
     * @return the certificateCriteria
     */
    public String getCertificateCriteria() {
        return certificateCriteria;
    }

    /**
     * @param certificateCriteria the certificateCriteria to set
     */
    public void setCertificateCriteria(String certificateCriteria) {
        this.certificateCriteria = certificateCriteria;
    }

    /**
     * @return the maincc
     */
    public int getMaincc() {
        return maincc;
    }

    /**
     * @param maincc the maincc to set
     */
    public void setMaincc(int maincc) {
        this.maincc = maincc;
    }

    /**
     * @return the ifResCoorWorkshopIsComplete
     */
    public int getIfResCoorWorkshopIsComplete() {
        return ifResCoorWorkshopIsComplete;
    }

    /**
     * @param ifResCoorWorkshopIsComplete the ifResCoorWorkshopIsComplete to set
     */
    public void setIfResCoorWorkshopIsComplete(int ifResCoorWorkshopIsComplete) {
        this.ifResCoorWorkshopIsComplete = ifResCoorWorkshopIsComplete;
    }

    /**
     * @return the feeAmount
     */
    public String getFeeAmount() {
        return feeAmount;
    }

    /**
     * @param feeAmount the feeAmount to set
     */
    public void setFeeAmount(String feeAmount) {
        this.feeAmount = feeAmount;
    }

    /**
     * @return the facultyFlag
     */
    public String getFacultyFlag() {
        return facultyFlag;
    }

    /**
     * @param facultyFlag the facultyFlag to set
     */
    public void setFacultyFlag(String facultyFlag) {
        this.facultyFlag = facultyFlag;
    }

    /**
     * @return the ccpay
     */
    public String getCcpay() {
        return ccpay;
    }

    /**
     * @param ccpay the ccpay to set
     */
    public void setCcpay(String ccpay) {
        this.ccpay = ccpay;
    }

    /**
     * @return the workshopRemark
     */
    public String getWorkshopRemark() {
        return workshopRemark;
    }

    /**
     * @param workshopRemark the workshopRemark to set
     */
    public void setWorkshopRemark(String workshopRemark) {
        this.workshopRemark = workshopRemark;
    }

    /**
     * @return the totalCount
     */
    public String getTotalCount() {
        return totalCount;
    }

    /**
     * @param totalCount the totalCount to set
     */
    public void setTotalCount(String totalCount) {
        this.totalCount = totalCount;
    }

    /**
     * @return the totalSumOfPayment
     */
    public String getTotalSumOfPayment() {
        return totalSumOfPayment;
    }

    /**
     * @param totalSumOfPayment the totalSumOfPayment to set
     */
    public void setTotalSumOfPayment(String totalSumOfPayment) {
        this.totalSumOfPayment = totalSumOfPayment;
    }

    /**
     * @return the lastUpdated
     */
    public String getLastUpdated() {
        return lastUpdated;
    }

    /**
     * @param lastUpdated the lastUpdated to set
     */
    public void setLastUpdated(String lastUpdated) {
        this.lastUpdated = lastUpdated;
    }

    /**
     * @return the dateToBeDisplayed
     */
    public int getDateToBeDisplayed() {
        return dateToBeDisplayed;
    }

    /**
     * @param dateToBeDisplayed the dateToBeDisplayed to set
     */
    public void setDateToBeDisplayed(int dateToBeDisplayed) {
        this.dateToBeDisplayed = dateToBeDisplayed;
    }

    /**
     * @return the workshopCompleted
     */
    public int getWorkshopCompleted() {
        return workshopCompleted;
    }

    /**
     * @param workshopCompleted the workshopCompleted to set
     */
    public void setWorkshopCompleted(int workshopCompleted) {
        this.workshopCompleted = workshopCompleted;
    }

    /**
     * @return the extraDownloads
     */
    public String getExtraDownloads() {
        return extraDownloads;
    }

    /**
     * @param extraDownloads the extraDownloads to set
     */
    public void setExtraDownloads(String extraDownloads) {
        this.extraDownloads = extraDownloads;
    }

    /**
     * @return the payment_at_rc
     */
    public int getPayment_at_rc() {
        return payment_at_rc;
    }

    /**
     * @param payment_at_rc the payment_at_rc to set
     */
    public void setPayment_at_rc(int payment_at_rc) {
        this.payment_at_rc = payment_at_rc;
    }

    /**
     * @return the payment_at_iitb
     */
    public int getPayment_at_iitb() {
        return payment_at_iitb;
    }

    /**
     * @param payment_at_iitb the payment_at_iitb to set
     */
    public void setPayment_at_iitb(int payment_at_iitb) {
        this.payment_at_iitb = payment_at_iitb;
    }

    /**
     * @return the without_RC
     */
    public int getWithout_RC() {
        return without_RC;
    }

    /**
     * @param without_RC the without_RC to set
     */
    public void setWithout_RC(int without_RC) {
        this.without_RC = without_RC;
    }

    /**
     * @return the isRCParticipate
     */
    public String getIsRCParticipate() {
        return isRCParticipate;
    }

    /**
     * @param isRCParticipate the isRCParticipate to set
     */
    public void setIsRCParticipate(String isRCParticipate) {
        this.isRCParticipate = isRCParticipate;
    }

    /**
     * @return the dateBeforeFlag
     */
    public int getDateBeforeFlag() {
        return dateBeforeFlag;
    }

    /**
     * @param dateBeforeFlag the dateBeforeFlag to set
     */
    public void setDateBeforeFlag(int dateBeforeFlag) {
        this.dateBeforeFlag = dateBeforeFlag;
    }
}
