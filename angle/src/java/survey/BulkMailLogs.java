/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package survey;

/**
 *
 * @author abinaya
 */
public class BulkMailLogs {

    private String survey_id;
    private String workshop_id;
    private String participant_status;
    private int updated_by;
    private String start_date; // to be updated in survey_index table
    private String end_date; // to be updated in survey_index table
    private String from;
    private String cc;
    private String subject;
    private String attachment;
    private String mail_content;
    private String database_name;
    private int typeofmail; // 1- survey, 2- generic
    private int bulkmail_id;
    private int participant_count;
    private String updated_date;

    /**
     * @return the survey_id
     */
    public String getSurvey_id() {
        return survey_id;
    }

    /**
     * @param survey_id the survey_id to set
     */
    public void setSurvey_id(String survey_id) {
        this.survey_id = survey_id;
    }

    /**
     * @return the workshop_id
     */
    public String getWorkshop_id() {
        return workshop_id;
    }

    /**
     * @param workshop_id the workshop_id to set
     */
    public void setWorkshop_id(String workshop_id) {
        this.workshop_id = workshop_id;
    }

    /**
     * @return the participant_status
     */
    public String getParticipant_status() {
        return participant_status;
    }

    /**
     * @param participant_status the participant_status to set
     */
    public void setParticipant_status(String participant_status) {
        this.participant_status = participant_status;
    }

    /**
     * @return the updated_by
     */
    public int getUpdated_by() {
        return updated_by;
    }

    /**
     * @param updated_by the updated_by to set
     */
    public void setUpdated_by(int updated_by) {
        this.updated_by = updated_by;
    }

    /**
     * @return the start_date
     */
    public String getStart_date() {
        return start_date;
    }

    /**
     * @param start_date the start_date to set
     */
    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    /**
     * @return the end_date
     */
    public String getEnd_date() {
        return end_date;
    }

    /**
     * @param end_date the end_date to set
     */
    public void setEnd_date(String end_date) {
        this.end_date = end_date;
    }

    /**
     * @return the from
     */
    public String getFrom() {
        return from;
    }

    /**
     * @param from the from to set
     */
    public void setFrom(String from) {
        this.from = from;
    }

    /**
     * @return the to
     */
    public String getCc() {
        return cc;
    }

    /**
     * @param to the to to set
     */
    public void setCc(String cc) {
        this.cc = cc;
    }

    /**
     * @return the subject
     */
    public String getSubject() {
        return subject;
    }

    /**
     * @param subject the subject to set
     */
    public void setSubject(String subject) {
        this.subject = subject;
    }

    /**
     * @return the attachment
     */
    public String getAttachment() {
        return attachment;
    }

    /**
     * @param attachment the attachment to set
     */
    public void setAttachment(String attachment) {
        this.attachment = attachment;
    }

    /**
     * @return the mail_content
     */
    public String getMail_content() {
        return mail_content;
    }

    /**
     * @param mail_content the mail_content to set
     */
    public void setMail_content(String mail_content) {
        this.mail_content = mail_content;
    }

    /**
     * @return the database_name
     */
    public String getDatabase_name() {
        return database_name;
    }

    /**
     * @param database_name the database_name to set
     */
    public void setDatabase_name(String database_name) {
        this.database_name = database_name;
    }

    /**
     * @return the typeofmail
     */
    public int getTypeofmail() {
        return typeofmail;
    }

    /**
     * @param typeofmail the typeofmail to set
     */
    public void setTypeofmail(int typeofmail) {
        this.typeofmail = typeofmail;
    }

    /**
     * @return the bulkmail_id
     */
    public int getBulkmail_id() {
        return bulkmail_id;
    }

    /**
     * @param bulkmail_id the bulkmail_id to set
     */
    public void setBulkmail_id(int bulkmail_id) {
        this.bulkmail_id = bulkmail_id;
    }

    /**
     * @return the participant_count
     */
    public int getParticipant_count() {
        return participant_count;
    }

    /**
     * @param participant_count the participant_count to set
     */
    public void setParticipant_count(int participant_count) {
        this.participant_count = participant_count;
    }

    /**
     * @return the updated_date
     */
    public String getUpdated_date() {
        return updated_date;
    }

    /**
     * @param updated_date the updated_date to set
     */
    public void setUpdated_date(String updated_date) {
        this.updated_date = updated_date;
    }
}
