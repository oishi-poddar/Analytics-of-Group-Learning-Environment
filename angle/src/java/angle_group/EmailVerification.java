/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package angle_group;

import bean.Group;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import utilities.DBConnection;
import utilities.SimpleStringCipher;
import utilities.Utility;


/**
 *
 * @author kunal
 */

public class EmailVerification {

    HttpServletRequest request;
    HttpSession session;
    PreparedStatement pstmt;
    ResultSet res;
    String email;
    String groupCode;
    String groupId;
    public String getGroupId()
    {
        return groupId;
    }
    public void setGroupId(String groupId)
    {
        this.groupId=groupId;
    }
    public String getEmail()
    {
        return email;
    }
    public void setEmail(String email)
    {
        this.email=email;
    }
    public String getGroupCode()
    {
        return groupCode;
    }
    public void setGroupCode(String groupCode)
    {
        this.groupCode=groupCode;
    }
    
    //          to generate the invitation link to be mailed
    public String generateInvitationLink() {
        
        HttpSession session = ServletActionContext.getRequest().getSession();
        AngleUtility utility=new AngleUtility();
        try {
            Group group=utility.getGroupById(Integer.parseInt(getGroupId()));
            if(group!=null)
            {
                groupCode=group.getGroupCode();
             
                //need to check if the user is already in that group
                if(utility.checkExistingUserInGroup(getEmail(),Integer.parseInt(groupId)))
                {                   
                    //  already present
                    session.setAttribute("invited_user", "already_exists");
                    return Utility.ERROR;
                }
                else            
                {        
                    //  generating the invitation link
                    String link = "UserInvitation.html?key1=" + SimpleStringCipher.encrypt(getEmail()) + "&key2=" + SimpleStringCipher.encrypt(groupCode);
                    System.out.println(link);
                    //   email to be sent with the above Link
                 
                    session.setAttribute("invited_user", "invite_sent");                    
                    return Utility.SUCCESS;
                }
            }
        }
        catch (Exception ex) {
                Logger.getLogger(EmailVerification.class.getName()).log(Level.SEVERE, null, ex);
            }
        return Utility.ERROR;
    }
    //      to verify the link i.e email and group code
    public String verifyLink() {
        request = ServletActionContext.getRequest();
        session = request.getSession();

        AngleUtility utility = new AngleUtility();
        String encrypted_email = ServletActionContext.getRequest().getParameter("key1");
        String encrypted_groupCode = ServletActionContext.getRequest().getParameter("key2");

        try {
            email = SimpleStringCipher.decrypt(encrypted_email);
            groupCode = SimpleStringCipher.decrypt(encrypted_groupCode);
            int status = utility.addInvitedUser(email, groupCode);

            if(status==2)       //new user
            {
                    session.setAttribute("code", groupCode);
                    session.setAttribute("emailId", email);
                    return Utility.NOT_REGISTERED ;
            }
                                       //else is a registered user
            else if(status==-1)         //already in the group
            {
                session.setAttribute("invitedUser", "already_exists");
            }
            else if(status==1)      //group joined
            {
                session.setAttribute("invitedUser", "success");
            }
            else                //wrong group code
            {
               session.setAttribute("invitedUser", "failure");
            }
            return Utility.SUCCESS;

        } catch (Exception ex) {
            Logger.getLogger(EmailVerification.class.getName()).log(Level.SEVERE, null, ex);
            return Utility.ERROR;

        }
    }

}
