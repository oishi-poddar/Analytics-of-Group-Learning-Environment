/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author mayank
 */
public class Qualification {

    private int qualificationId;
    private String qualification;
    private boolean isAllowed;

    public boolean isIsAllowed() {
        return isAllowed;
    }

    public void setIsAllowed(boolean isAllowed) {
        this.isAllowed = isAllowed;
    }

    public String getQualification() {
        return qualification;
    }

    public void setQualification(String qualification) {
        this.qualification = qualification;
    }

    public int getQualificationId() {
        return qualificationId;
    }

    public void setQualificationId(int qualificationId) {
        this.qualificationId = qualificationId;
    }
}
