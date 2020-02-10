/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package survey;

import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import bean.Person;
import utilities.FileUtil;
import utilities.Utility;

/**
 *
 * @author abinaya
 */
public class SaveBulkMailTemplateAction extends ActionSupport {

    private BulkMailLogs details;
    private File avatar;
    private File file;
    private String result;
    private BulkMailLogs bulkmaildetails;

    /**
     * Important note : do not add any other method in this class. This action
     * is called from ajax. It will fail if more functions are added.
     */
    @Override
    public String execute() throws Exception {
        String res = "";
        /*
         * Getting user session object
         */
        HttpSession session = ServletActionContext.getRequest().getSession();

        Person person = (Person) session.getAttribute(Utility.USER_HANDLE);
//        if (person == null) {
//            return Utility.LOGIN_FAILURE;
//        } else {
        /**
         * getting the parameters from 'url'
         */
        System.out.println("ina ction save");
        try {
//            details.setUpdated_by(person.getLoginId());
            BulkMailUtility b_utility = new BulkMailUtility();
            res = b_utility.saveSurveyEmailTemplate(details);

            String context = ServletActionContext.getServletContext().getRealPath("");
            if (details.getAttachment() != null) {
                if (details.getAttachment().length() != 0) // save the file if available .. 
                {
                    try {
                        FileUtil.saveFile(file, details.getAttachment(), context + File.separator + "bulk_mail_attachments");
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        result = Utility.SUCCESS + "_" + res;

        return Utility.SUCCESS;
//        }
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
