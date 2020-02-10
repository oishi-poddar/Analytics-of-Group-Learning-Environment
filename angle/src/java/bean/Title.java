/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author mayank
 */
public class Title {

    private int titleId;
    private String titleName;
    private boolean isActive;

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    /**
     * @return the titleId
     */
    public int getTitleId() {
        return titleId;
    }

    /**
     * @param titleId the titleId to set
     */
    public void setTitleId(int titleId) {
        this.titleId = titleId;
    }

    /**
     * @return the titleName
     */
    public String getTitleName() {
        return titleName;
    }

    /**
     * @param titleName the titleName to set
     */
    public void setTitleName(String titleName) {
        this.titleName = titleName;
    }
}
