/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package survey;

import bean.Person;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import utilities.FileUtil;
import utilities.Utility;

/**
 *
 * @author dipesh
 */
public class SaveExcelUserDataAction extends ActionSupport {
    private BulkMailLogs details;
    private File avatar;
    private File file;
    private String result;
    private BulkMailLogs bulkmaildetails;
    
    
    @Override
    public String execute() throws Exception {
        String res = "",filename="";
        int bulkmailid=0,bulkmailtype=0;
        String ext="";
        HttpSession session = ServletActionContext.getRequest().getSession();
        Person person = (Person) session.getAttribute(Utility.USER_HANDLE);
        
        try {
            String context = ServletActionContext.getServletContext().getRealPath("");
            if (getDetails().getAttachment() != null) {
                if (getDetails().getAttachment().length() != 0) // save the file if available .. 
                {
                    try {
                        ext=getDetails().getAttachment().substring(getDetails().getAttachment().lastIndexOf(".") + 1);
                        bulkmailid=getDetails().getBulkmail_id();
                        bulkmailtype=getDetails().getTypeofmail();
                        if(!ext.equals("")){
                                FileUtil.saveFile( getFile(), "bulkmailExcel_"+bulkmailid+"."+ext, context + File.separator + "bulk_mail_attachments");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
            String filepath=context+"/bulk_mail_attachments/"+"bulkmailExcel_"+bulkmailid+"."+ext;
            
            File f = new File(filepath);
            if(f.exists()){
                //read the excel file 
                filename="bulkmailExcel_"+bulkmailid+"."+ext;
                ReadExcelData obj_exceldata=new ReadExcelData();
                int reS=0,login_id=1;
                
                reS=obj_exceldata.excuteReadExcelFunction(getFile(), filename, filename, login_id,bulkmailid,bulkmailtype);
                if (reS > 0) {
                    // successfully inserted
                }
                // insert the data
                
            }
            else{
                //System.out.println("file not found");
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        
        setResult(Utility.SUCCESS + "_" + bulkmailid);
        return Utility.SUCCESS;
    }

    /**
     * @return the details
     */
    public BulkMailLogs getDetails() {
        return details;
    }

    /**
     * @param details the details to set
     */
    public void setDetails(BulkMailLogs details) {
        this.details = details;
    }

    /**
     * @return the avatar
     */
    public File getAvatar() {
        return avatar;
    }

    /**
     * @param avatar the avatar to set
     */
    public void setAvatar(File avatar) {
        this.avatar = avatar;
    }

    /**
     * @return the file
     */
    public File getFile() {
        return file;
    }

    /**
     * @param file the file to set
     */
    public void setFile(File file) {
        this.file = file;
    }

    /**
     * @return the result
     */
    public String getResult() {
        return result;
    }

    /**
     * @param result the result to set
     */
    public void setResult(String result) {
        this.result = result;
    }

    /**
     * @return the bulkmaildetails
     */
    public BulkMailLogs getBulkmaildetails() {
        return bulkmaildetails;
    }

    /**
     * @param bulkmaildetails the bulkmaildetails to set
     */
    public void setBulkmaildetails(BulkMailLogs bulkmaildetails) {
        this.bulkmaildetails = bulkmaildetails;
    }
    
}
