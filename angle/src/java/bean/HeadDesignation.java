/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author mayank
 */
public class HeadDesignation {

    private int headDesignationId;
    private String headDesignationName;
    private boolean isActive;
    private int H_headDesignationId;

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    /**
     * @return the headDesignationId
     */
    public int getHeadDesignationId() {
        return headDesignationId;
    }

    /**
     * @param headDesignationId the headDesignationId to set
     */
    public void setHeadDesignationId(int headDesignationId) {
        this.headDesignationId = headDesignationId;
    }

    /**
     * @return the headDesignationName
     */
    public String getHeadDesignationName() {
        return headDesignationName;
    }

    /**
     * @param headDesignationName the headDesignationName to set
     */
    public void setHeadDesignationName(String headDesignationName) {
        this.headDesignationName = headDesignationName;
    }

    /**
     * @return the H_headDesignationId
     */
    public int getH_headDesignationId() {
        return H_headDesignationId;
    }

    /**
     * @param H_headDesignationId the H_headDesignationId to set
     */
    public void setH_headDesignationId(int H_headDesignationId) {
        this.H_headDesignationId = H_headDesignationId;
    }
}
