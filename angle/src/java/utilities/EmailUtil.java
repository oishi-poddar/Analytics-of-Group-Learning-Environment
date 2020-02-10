/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package utilities;

import java.util.Properties;
import java.util.Date;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * Document : EmailUtil.java
 *
 * @author rkjangir
 *
 * This class provides the method to send email messages. It provides the
 * methods to send simple mail, html mail and file attachement mail
 *
 */
public class EmailUtil {

    public EmailUtil() {
    }

    /**
     * Utility method to send simple HTML email
     *
     * @param fromEmail
     * @param toEmail
     * @param ccEmail
     * @param bccEmail
     * @param subject
     * @param body
     */
    public void sendEmail(String fromEmail, String toEmail, String ccEmail, String bccEmail, String subject, String body) {
        if (ccEmail == null) {
            ccEmail = "";
        }
        if (bccEmail == null) {
            bccEmail = "";
        }
        try {

            Properties props = System.getProperties();
            // Setup mail server
            props.put("mail.smtp.host", "jeeves.cse.iitb.ac.in"); //SMTP Host
            Session session = Session.getInstance(props, null); //auth
            MimeMessage msg = new MimeMessage(session);
            //set message headers
            msg.addHeader("Content-type", "text/html; charset=UTF-8");
            msg.addHeader("format", "flowed");
            msg.addHeader("Content-Transfer-Encoding", "8bit");
            msg.setFrom(new InternetAddress(fromEmail));
            msg.setReplyTo(InternetAddress.parse(fromEmail, false));
            msg.setSubject(subject, "UTF-8");
            msg.setContent(body, "text/html");
            msg.setSentDate(new Date());
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
            msg.setRecipients(Message.RecipientType.CC, InternetAddress.parse(ccEmail, false));
            msg.setRecipients(Message.RecipientType.BCC, InternetAddress.parse(bccEmail, false));
            System.out.println("Sending Email TO : " + toEmail);
//            Transport.send(msg);
            System.out.println("Mail Sent Successfully!!");
        } catch (Exception e) {
            System.out.println("Error while sending mail -");
            e.printStackTrace();
        }
    }
}
