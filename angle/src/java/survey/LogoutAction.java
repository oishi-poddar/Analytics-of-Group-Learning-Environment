/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package survey;

import com.opensymphony.xwork2.ActionSupport;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import utilities.Utility;

/**
 *
 * @author dipesh
 */
public class LogoutAction extends ActionSupport {
    
     public String logout() throws Exception {
        HttpSession session = ServletActionContext.getRequest().getSession();
        if(session != null) {
            session.removeAttribute(Utility.USER_HANDLE);
            session.invalidate();
        }
        return Utility.SUCCESS;
    }
}
