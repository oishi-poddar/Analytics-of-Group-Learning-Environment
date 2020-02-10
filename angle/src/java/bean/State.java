/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author mayank
 */
public class State {

    private int stateId;
    private String stateName;
    private boolean isActive;
    private String enc_state;

    /**
     * @return the stateId
     */
    public int getStateId() {
        return stateId;
    }

    /**
     * @param stateId the stateId to set
     */
    public void setStateId(int stateId) {
        this.stateId = stateId;
    }

    /**
     * @return the stateName
     */
    public String getStateName() {
        return stateName;
    }

    /**
     * @param stateName the stateName to set
     */
    public void setStateName(String stateName) {
        this.stateName = stateName;
    }

    /**
     * @return the isActive
     */
    public boolean isIsActive() {
        return isActive;
    }

    /**
     * @param isActive the isActive to set
     */
    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    /**
     * @return the enc_state
     */
    public String getEnc_state() {
        return enc_state;
    }

    /**
     * @param enc_state the enc_state to set
     */
    public void setEnc_state(String enc_state) {
        this.enc_state = enc_state;
    }
}
