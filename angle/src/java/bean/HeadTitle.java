/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author mayank
 */
public class HeadTitle {

    private int headTitleId;
    private String headTitleName;
    private boolean isActive;
    private int H_headTitleId;

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    /**
     * @return the headTitleId
     */
    public int getHeadTitleId() {
        return headTitleId;
    }

    /**
     * @param headTitleId the headTitleId to set
     */
    public void setHeadTitleId(int headTitleId) {
        this.headTitleId = headTitleId;
    }

    /**
     * @return the headTitleName
     */
    public String getHeadTitleName() {
        return headTitleName;
    }

    /**
     * @param headTitleName the headTitleName to set
     */
    public void setHeadTitleName(String headTitleName) {
        this.headTitleName = headTitleName;
    }

    /**
     * @return the H_headTitleId
     */
    public int getH_headTitleId() {
        return H_headTitleId;
    }

    /**
     * @param H_headTitleId the H_headTitleId to set
     */
    public void setH_headTitleId(int H_headTitleId) {
        this.H_headTitleId = H_headTitleId;
    }
}
