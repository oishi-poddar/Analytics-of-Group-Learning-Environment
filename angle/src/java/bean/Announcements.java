/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.util.Date;

/**
 *
 * @author Abinaya
 */
public class Announcements {

    private String announcement;
    private String link;
    private String location;
    // private Date startdate;
    //private Date enddate;
    private int announcementid;
    private int type;
    private String startdate;
    private String enddate;
    private String status;
    private String visible = "Y";

    /**
     * @return the announcement
     */
    public String getAnnouncement() {
        return announcement;
    }

    /**
     * @param announcement the announcement to set
     */
    public void setAnnouncement(String announcement) {
        this.announcement = announcement;
    }

    /**
     * @return the link
     */
    public String getLink() {
        return link;
    }

    /**
     * @param link the link to set
     */
    public void setLink(String link) {
        this.link = link;
    }

    /**
     * @return the location
     */
    public String getLocation() {
        return location;
    }

    /**
     * @param location the location to set
     */
    public void setLocation(String location) {
        this.location = location;
    }

    /**
     * @return the startdate
     *
     * public Date getStartdate() { return startdate; }/
     *
     * /
     **
     * @param startdate the startdate to set
     *
     * public void setStartdate(Date startdate) { this.startdate = startdate; }/
     *
     * /
     **
     * @return the enddate
     *
     * public Date getEnddate() { return enddate; }
     */
    /**
     * @param enddate the enddate to set
     *
     * public void setEnddate(Date enddate) { this.enddate = enddate; }
     */
    /**
     * @return the announcementid
     */
    public int getAnnouncementid() {
        return announcementid;
    }

    /**
     * @param announcementid the announcementid to set
     */
    public void setAnnouncementid(int announcementid) {
        this.announcementid = announcementid;
    }

    /**
     * @return the type
     */
    public int getType() {
        return type;
    }

    /**
     * @param type the type to set
     */
    public void setType(int type) {
        this.type = type;
    }

    /**
     * @return the startdate
     */
    public String getStartdate() {
        return startdate;
    }

    /**
     * @param startdate the startdate to set
     */
    public void setStartdate(String startdate) {
        this.startdate = startdate;
    }

    /**
     * @return the enddate
     */
    public String getEnddate() {
        return enddate;
    }

    /**
     * @param enddate the enddate to set
     */
    public void setEnddate(String enddate) {
        this.enddate = enddate;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * @return the visible
     */
    public String getVisible() {
        return visible;
    }

    /**
     * @param visible the visible to set
     */
    public void setVisible(String visible) {
        this.visible = visible;
    }
}
