/* 
    Document   : NotesAction
    Created on : 26 May, 2017, 10:03:51 AM
    Author     : oishi
 */
package angle_group;

import bean.Group;
import bean.Notes;
import bean.Person;
import static com.opensymphony.xwork2.Action.ERROR;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.io.IOException;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import survey.SurveyUtility;
import utilities.FileUtil;
import utilities.Utility;

/**
 *
 * @author 1576202
 */
public class NotesAction extends ActionSupport {

    private String filename;

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }
    private Notes n;
    Group currGroup = null;
    private String myFileFileName;

    String note;
    private File myFile;
    private String myFileContentType;

    public Group getCurrGroup() {
        return currGroup;
    }

    public void setCurrGroup(Group currGroup) {
        this.currGroup = currGroup;
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

    private String destPath;
    private String result;

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    @Override
    public String execute() throws IOException {

        try{
        AngleUtility obj = new AngleUtility();
         result = obj.insertNote(getN());
        String g = n.getMyFileFileName();
     
            if (getN().getMyFileFileName() != null && !getN().getMyFileFileName().equals("")) {
                String context = ServletActionContext.getServletContext().getRealPath("");
              
                String filename = n.getNoteId()+n.getMyFileFileName();
                n.setMyFileFileName(filename);

                try {

                    FileUtil.saveFile(n.getMyFile(), filename, context + File.separator + "uploadedfiles");

                } catch (Exception e) {
                }

            }
        }
        catch(Exception e)
                {
                System.out.println(e);
                }
         setResult(Utility.SUCCESS + "_" + result);
            return Utility.SUCCESS;

        }
            

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Notes getN() {
        return n;
    }

    public void setN(Notes n) {
        this.n = n;
    }

}