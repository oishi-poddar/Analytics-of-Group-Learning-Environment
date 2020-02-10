/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author asl
 */
public class HeadDetails {

    private String name;
    private String email;
    private String headaddress;
    private String headphone;
    private HeadTitle headtitle = new HeadTitle();
    private HeadDesignation headdesignation = new HeadDesignation();
    private Stream stream = new Stream();
    private int isActive;
    private int instituteId;
    private int last_updateby;

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the headaddress
     */
    public String getHeadaddress() {
        return headaddress;
    }

    /**
     * @param headaddress the headaddress to set
     */
    public void setHeadaddress(String headaddress) {
        this.headaddress = headaddress;
    }

    /**
     * @return the headtitle
     */
    public HeadTitle getHeadtitle() {
        return headtitle;
    }

    /**
     * @param headtitle the headtitle to set
     */
    public void setHeadtitle(HeadTitle headtitle) {
        this.headtitle = headtitle;
    }

    /**
     * @return the headdesignation
     */
    public HeadDesignation getHeaddesignation() {
        return headdesignation;
    }

    /**
     * @param headdesignation the headdesignation to set
     */
    public void setHeaddesignation(HeadDesignation headdesignation) {
        this.headdesignation = headdesignation;
    }

    /**
     * @return the headphone
     */
    public String getHeadphone() {
        return headphone;
    }

    /**
     * @param headphone the headphone to set
     */
    public void setHeadphone(String headphone) {
        this.headphone = headphone;
    }

    /**
     * @return the stream
     */
    public Stream getStream() {
        return stream;
    }

    /**
     * @param stream the stream to set
     */
    public void setStream(Stream stream) {
        this.stream = stream;
    }

    /**
     * @return the isActive
     */
    public int getIsActive() {
        return isActive;
    }

    /**
     * @param isActive the isActive to set
     */
    public void setIsActive(int isActive) {
        this.isActive = isActive;
    }

    /**
     * @return the instituteId
     */
    public int getInstituteId() {
        return instituteId;
    }

    /**
     * @param instituteId the instituteId to set
     */
    public void setInstituteId(int instituteId) {
        this.instituteId = instituteId;
    }

    /**
     * @return the last_updateby
     */
    public int getLast_updateby() {
        return last_updateby;
    }

    /**
     * @param last_updateby the last_updateby to set
     */
    public void setLast_updateby(int last_updateby) {
        this.last_updateby = last_updateby;
    }
}
