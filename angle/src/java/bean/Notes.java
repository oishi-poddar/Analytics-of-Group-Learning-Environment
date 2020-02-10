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
 * @author 1576202
 */
public class Notes {
String date_time;
int count;
    public String getDate_time() {
        return date_time;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public void setDate_time(String date_time) {
        this.date_time = date_time;
    }
    private int noteId;
    private int groupId;
    private String groupName;
   private String location;

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
        System.out.println("location is"+location);
 }
    private String referenceLink;
    private File myFile;

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
    private String groupCode;
    private String name;
    private int createdById;
    private String createdOn;
    private String note;
    private String date;
    private String myFileFileName; 

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

}
