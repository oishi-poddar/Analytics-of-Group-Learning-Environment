/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author Abinaya
 */
public class Downloads {

    private int workshopid;
    private String session;
    private String path;
    private String video_name;
    private String download_name;

    /**
     * @return the workshopid
     */
    public int getWorkshopid() {
        return workshopid;
    }

    /**
     * @param workshopid the workshopid to set
     */
    public void setWorkshopid(int workshopid) {
        this.workshopid = workshopid;
    }

    /**
     * @return the path
     */
    public String getPath() {
        return path;
    }

    /**
     * @param path the path to set
     */
    public void setPath(String path) {
        this.path = path;
    }

    /**
     * @return the video_name
     */
    public String getVideo_name() {
        return video_name;
    }

    /**
     * @param video_name the video_name to set
     */
    public void setVideo_name(String video_name) {
        this.video_name = video_name;
    }

    /**
     * @return the session
     */
    public String getSession() {
        return session;
    }

    /**
     * @param session the session to set
     */
    public void setSession(String session) {
        this.session = session;
    }

    /**
     * @return the download_name
     */
    public String getDownload_name() {
        return download_name;
    }

    /**
     * @param download_name the download_name to set
     */
    public void setDownload_name(String download_name) {
        this.download_name = download_name;
    }
}
