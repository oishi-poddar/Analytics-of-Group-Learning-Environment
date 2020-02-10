/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package angle_group;

import bean.AssignmentBean;
import bean.Person;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.sql.Date;
import java.sql.Timestamp;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import utilities.FileUtil;
import utilities.Utility;

/**
 *
 * @author manushi
 */
public class Assignment_Action extends ActionSupport {

    private String name, answerKeyLink, ass_name, referenceLink, description, hour, min, datepicker, reference_title;
    private int fileSize;
    private String myFileContentType;
    private File myFile;
    private Timestamp givenOn, lastSubmissionDate;
    private String myFileFileName;
    private String destPath;
      private String result;

    public String getAss_name() {
        return ass_name;
    }

    public void setAss_name(String ass_name) {
        this.ass_name = ass_name;
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
    private int gid, lock_submission;

    public int getLock_submission() {
        return lock_submission;
    }

    public void setLock_submission(int lock_submission) {
        this.lock_submission = lock_submission;
    }

    public Timestamp getGivenOn() {
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

    private AssignmentBean a;

    public AssignmentBean getA() {
        return a;
    }

    public void setA(AssignmentBean a) {
        this.a = a;
    }
    
    @Override
    public String execute() throws Exception {
        String res = "";
         HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        Person person = (Person) session.getAttribute("loggedInUser");
        
        AngleUtility utility = new AngleUtility();
        int i = utility.insert(getA());
        if (i > 0) {
             String context = ServletActionContext.getServletContext().getRealPath("");
             String filename=""+a.getGroupid()+""+a.getId()+""+a.getMyFileFileName();
             System.out.println(filename);
            if (getA().getMyFileFileName() != null && !getA().getMyFileFileName().equals("")) {

                try {
                    FileUtil.saveFile( a.getMyFile(),filename, context + File.separator + "uploadedfiles");

                } catch (Exception e) {
                    e.printStackTrace();
                }

            }
            session.setAttribute("createAssignment", "success");
            res=String.valueOf(i);
            

        }   
            result = Utility.SUCCESS + "_" + res;
            
            return Utility.SUCCESS;
    }

    
}
