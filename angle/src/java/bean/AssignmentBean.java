/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.io.File;
import java.sql.Timestamp;

/**
 *
 * @author manushi
 */
public class AssignmentBean {

    private String username;
    private String comment;
    private String grade;
    private String name;
    private String attachment;
    private String answerKeyLink;
    private String ass_name;
    private String referenceLink;
    private String description;
    private String hour;
    private String min;
    private String datepicker;
    private String reference_title;
    private int id;
    private int fileSize;
    private String myFileContentType;
    private File myFile;
    private Timestamp givenOn;
    private String postDate;
    private String tempDate;
    private int count1,count2;
    private float count3;

    public float getCount3() {
        return count3;
    }

    public void setCount3(float count3) {
        this.count3 = count3;
    }
    private String gradeBy;
    private String createdBy;

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public String getGradeBy() {
        return gradeBy;
    }

    public void setGradeBy(String gradeBy) {
        this.gradeBy = gradeBy;
    }

   

    public int getCount1() {
        return count1;
    }

    public void setCount1(int count1) {
        this.count1 = count1;
    }

    public int getCount2() {
        return count2;
    }

    public void setCount2(int count2) {
        this.count2 = count2;
    }

    public String getTempDate() {
        return tempDate;
    }

    public void setTempDate(String tempDate) {
        this.tempDate = tempDate;
    }

    public String getPostDate() {
        return postDate;
    }

    public void setPostDate(String postDate) {
        this.postDate = postDate;
    }
    private Timestamp lastSubmissionDate;
    private Timestamp submittedOn;
    private String destPath;
    private int gid, groupid, lock_submission, uid;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getAttachment() {
        return attachment;
    }

    public void setAttachment(String attachment) {
        this.attachment = attachment;
    }

    public Timestamp getSubmittedOn() {
        return submittedOn;
    }

    public void setSubmittedOn(Timestamp submittedOn) {
        this.submittedOn = submittedOn;
    }
    private String myFileFileName, submittedFile;

    public String getSubmittedFile() {
        return submittedFile;
    }

    public void setSubmittedFile(String submittedFile) {
        this.submittedFile = submittedFile;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }
    private String topicName;

    public String getTopicName() {
        return topicName;
    }

    public void setTopicName(String topicName) {
        this.topicName = topicName;
    }

    public int getGroupid() {
        return groupid;
    }

    public void setGroupid(int groupid) {
        this.groupid = groupid;
    }

    public Timestamp getGivenOn() {
        return givenOn;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAss_name() {
        return ass_name;
    }

    public void setAss_name(String ass_name) {
        this.ass_name = ass_name;
    }

    public Timestamp GivenOn() {
        return givenOn;
    }

    public void setGivenOn(Timestamp givenOn) {
        this.givenOn = givenOn;
    }

    public Timestamp getLastSubmissionDate() {
        return lastSubmissionDate;
    }

    public void setLastSubmissionDate(Timestamp lastSubmissionDate) {
        this.lastSubmissionDate = lastSubmissionDate;
    }

    public int getFileSize() {
        return fileSize;
    }

    public void setFileSize(int fileSize) {
        this.fileSize = fileSize;
    }

    public String getReference_title() {
        return reference_title;
    }

    public void setReference_title(String reference_title) {
        this.reference_title = reference_title;
    }

    public File getMyFile() {
        return myFile;
    }

    public void setMyFile(File myFile) {
        this.myFile = myFile;
    }

    public String getMyFileContentType() {
        return myFileContentType;
    }

    public void setMyFileContentType(String myFileContentType) {
        this.myFileContentType = myFileContentType;
    }

    public String getMyFileFileName() {
        return myFileFileName;
    }

    public void setMyFileFileName(String myFileFileName) {
        this.myFileFileName = myFileFileName;
    }

    public String getDestPath() {
        return destPath;
    }

    public void setDestPath(String destPath) {
        this.destPath = destPath;
    }

    public String getDatepicker() {
        return datepicker;
    }

    public void setDatepicker(String datepicker) {
        this.datepicker = datepicker;
    }

    public String getHour() {
        return hour;
    }

    public void setHour(String hour) {
        this.hour = hour;
    }

    public String getMin() {
        return min;
    }

    public void setMin(String min) {
        this.min = min;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getLock_submission() {
        return lock_submission;
    }

    public void setLock_submission(int lock_submission) {
        this.lock_submission = lock_submission;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAnswerKeyLink() {
        return answerKeyLink;
    }

    public void setAnswerKeyLink(String answerKeyLink) {
        this.answerKeyLink = answerKeyLink;
    }

    public String getReferenceLink() {
        return referenceLink;
    }

    public void setReferenceLink(String referenceLink) {
        this.referenceLink = referenceLink;
    }

    public int getGid() {
        return gid;
    }

    public void setGid(int gid) {
        this.gid = gid;
    }
    private File file_name;

    public File getFile_name() {
        return file_name;
    }

    public void setFile_name(File file_name) {
        this.file_name = file_name;
    }

}
