/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package survey;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Date;
import java.util.Properties;


import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

/**
 *
 * @author abinaya
 */
public class BulkMailSetUp {

    private static final String SMTP_HOST_NAME = "10.129.1.1";
    private static final String SMTP_Test_Host_Name = "jeeves.cse.iitb.ac.in";
    private String fileAttachment;
    private static final String fileAttachment1 = "";
    private static final String fileAttachment2 = "";
    String log = "\n";

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
    public void sendEmail(final String fromEmail, final String[] toEmail, final String ccEmail, final String bccEmail, final String subject, final String body, final String fileAttachment, final String log_file_name) {


        if (fromEmail != null && toEmail != null && subject != null && body != null) {
        }
        Thread mailer = new Thread() {
            private String cc = "";
            private String bcc = "";

            @Override
            public void run() {
                if (ccEmail != null) {
                    cc = ccEmail;
                }
                if (bccEmail != null) {
                    bcc = bccEmail;
                }
                try {

                    Properties props = System.getProperties();
                    // Setup mail server - test server
                    props.put("mail.smtp.host", SMTP_Test_Host_Name); //SMTP Host test server
                    // props.put("mail.smtp.host", SMTP_HOST_NAME);  // uncomment for main server

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

                    InternetAddress[] addressTo = new InternetAddress[toEmail.length];
                    for (int i = 0; i < toEmail.length; i++) {
                        addressTo[i] = new InternetAddress(toEmail[i]);
                    }
                    msg.setRecipients(Message.RecipientType.TO, addressTo);
//                    msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
                    msg.setRecipients(Message.RecipientType.CC, InternetAddress.parse(cc, false));
                    msg.setRecipients(Message.RecipientType.BCC, InternetAddress.parse(bcc, false));

                    MimeBodyPart msgbdypart = new MimeBodyPart();
//                    msgbdypart.setText(body);
                    msgbdypart.setContent(body, "text/html");
                    Multipart multipart = new MimeMultipart();
                    multipart.addBodyPart(msgbdypart);
                    if (fileAttachment != null && !fileAttachment.equals("")) {
                        MimeBodyPart mbp2 = new MimeBodyPart();
                        FileDataSource fds = new FileDataSource(fileAttachment);
                        mbp2.setDataHandler(new DataHandler(fds));
                        mbp2.setFileName(fds.getName());
                        multipart.addBodyPart(mbp2);
                    }

                    if (fileAttachment1 != null && !fileAttachment1.equals("")) {
                        MimeBodyPart mbp3 = new MimeBodyPart();
                        FileDataSource fds = new FileDataSource(fileAttachment1);
                        mbp3.setDataHandler(new DataHandler(fds));
                        mbp3.setFileName(fds.getName());
                        multipart.addBodyPart(mbp3);
                    }

                    if (fileAttachment2 != null && !fileAttachment2.equals("")) {
                        MimeBodyPart mbp3 = new MimeBodyPart();
                        FileDataSource fds = new FileDataSource(fileAttachment2);
                        mbp3.setDataHandler(new DataHandler(fds));
                        mbp3.setFileName(fds.getName());
                        multipart.addBodyPart(mbp3);
                    }
                    msg.setContent(multipart);

                    Transport.send(msg);
                    log = log + "Mail Sent Successfully to " + addressTo[0];

                } catch (Exception e) {
                    StringWriter sw = new StringWriter();
                    PrintWriter pw = new PrintWriter(sw);
                    e.printStackTrace(pw);
                    log = log + sw.toString();
                }

                try {
                    FileWriter fw = new FileWriter(log_file_name, true); //the true will append the new data
                    fw.write(log);//appends the string to the file
                    fw.close();
                } catch (IOException e) {
                }
            }
        };
        mailer.start();
    }
}
