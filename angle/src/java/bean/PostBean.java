/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import static com.itextpdf.text.pdf.security.LtvTimestamp.timestamp;
import java.io.File;
import java.sql.Timestamp;
/**
 *
 */
public class PostBean {
    
    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
     private int noteId;
    private int groupId;
    private String groupName;
   private String location;
     private String groupCode;
    private String username;
    private int createdById;
    private String createdOn;
    private String note;
    private String date;
    private String myFileFileName; 
    int type;
String date_time;
int count;
private String referenceLink;


private String AssignmentBeanreferenceLink;
    private String description;
    private String hour;
    private String min;
    private String datepicker;
    private int Assignmentid;
 
    private File myFile;
private String name;
    private String attachment;
    private String topicName;
    private Timestamp givenOn;
    private String postDate;
    private Timestamp lastSubmissionDate;
 private int uid;
 
    public Timestamp getGivenOn() {
        return givenOn;
    }

    public void setGivenOn(Timestamp givenOn) {
        this.givenOn = givenOn;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getTopicName() {
        return topicName;
    }

    public void setTopicName(String topicName) {
        this.topicName = topicName;
    }

    public String getPostDate() {
        return postDate;
    }

    public void setPostDate(String postDate) {
        this.postDate = postDate;
    }

    public Timestamp getLastSubmissionDate() {
        return lastSubmissionDate;
    }

    public void setLastSubmissionDate(Timestamp lastSubmissionDate) {
        this.lastSubmissionDate = lastSubmissionDate;
    }
    
    

    public String getAssignmentBeanreferenceLink() {
        return AssignmentBeanreferenceLink;
    }

    public void setAssignmentBeanreferenceLink(String AssignmentBeanreferenceLink) {
        this.AssignmentBeanreferenceLink = AssignmentBeanreferenceLink;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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

    public String getDatepicker() {
        return datepicker;
    }

    public void setDatepicker(String datepicker) {
        this.datepicker = datepicker;
    }

    public int getAssignmentid() {
        return Assignmentid;
    }

    public void setAssignmentid(int Assignmentid) {
        this.Assignmentid = Assignmentid;
    }

    
    
    
    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getAttachment() {
        return attachment;
    }

    public void setAttachment(String attachment) {
        this.attachment = attachment;
    }
   

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public String getDate_time() {
        return date_time;
    }

    public void setDate_time(String date_time) {
        this.date_time = date_time;
    }
   

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
        //System.out.println("location is"+location);
 }
   

    public File getMyFile() {    
        return myFile;
    }

    public void setMyFile(File myFile) {
    //    System.out.println("file is"+myFile);
        setLocation(String.valueOf(myFile));

        this.myFile = myFile;
    }

    public String getReferenceLink() {
        return referenceLink;
    }

    public void setReferenceLink(String referenceLink) {
        this.referenceLink = referenceLink;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }
   
    
    public String getMyFileFileName() {
        //System.out.println(myFileFileName);
        return myFileFileName;

    }

    public void setMyFileFileName(String myFileFileName) {
        this.myFileFileName = myFileFileName;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
    private String time;

    public int getNoteId() {
        return noteId;
    }

    public void setNoteId(int NoteId) {
        this.noteId = NoteId;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getGroupId() {
        return groupId;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }

    public String getGroupCode() {
        return groupCode;
    }

    public void setGroupCode(String groupCode) {
        this.groupCode = groupCode;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCreatedById() {
        return createdById;
    }

    public void setCreatedById(int createdById) {
        this.createdById = createdById;
    }

    public String getCreatedOn() {
        return createdOn;
    }

    public void setCreatedOn(String createdOn) {
        this.createdOn = createdOn;
    }
    int Toolid;

    public int getToolid() {
        return Toolid;
    }

    public void setToolid(int Toolid) {
        this.Toolid = Toolid;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
   
}