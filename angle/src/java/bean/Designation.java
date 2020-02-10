/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author mayank
 */
public class Designation {

    private int designationId;
    private String designationName;
    private boolean isActive;

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    /**
     * @return the designationId
     */
    public int getDesignationId() {
        return designationId;
    }

    /**
     * @param designationId the designationId to set
     */
    public void setDesignationId(int designationId) {
        this.designationId = designationId;
    }

    /**
     * @return the designationName
     */
    public String getDesignationName() {
        return designationName;
    }

    /**
     * @param designationName the designationName to set
     */
    public void setDesignationName(String designationName) {
        this.designationName = designationName;
    }
}
