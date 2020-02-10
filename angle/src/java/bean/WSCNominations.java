/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author Abinaya
 */
public class WSCNominations {

    private RemoteCenter rc;
    private WorkshopContent wc;
    private String active_till;
    private String cooridnator_email;
    private String nominee_email;
    private int id;
    private Person person;
    private int expiry = 0;

    /**
     * @return the rc
     */
    public RemoteCenter getRc() {
        return rc;
    }

    /**
     * @param rc the rc to set
     */
    public void setRc(RemoteCenter rc) {
        this.rc = rc;
    }

    /**
     * @return the wc
     */
    public WorkshopContent getWc() {
        return wc;
    }

    /**
     * @param wc the wc to set
     */
    public void setWc(WorkshopContent wc) {
        this.wc = wc;
    }

    /**
     * @return the active_till
     */
    public String getActive_till() {
        return active_till;
    }

    /**
     * @param active_till the active_till to set
     */
    public void setActive_till(String active_till) {
        this.active_till = active_till;
    }

    /**
     * @return the cooridnator_email
     */
    public String getCooridnator_email() {
        return cooridnator_email;
    }

    /**
     * @param cooridnator_email the cooridnator_email to set
     */
    public void setCooridnator_email(String cooridnator_email) {
        this.cooridnator_email = cooridnator_email;
    }

    /**
     * @return the nominee_email
     */
    public String getNominee_email() {
        return nominee_email;
    }

    /**
     * @param nominee_email the nominee_email to set
     */
    public void setNominee_email(String nominee_email) {
        this.nominee_email = nominee_email;
    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the person
     */
    public Person getPerson() {
        return person;
    }

    /**
     * @param person the person to set
     */
    public void setPerson(Person person) {
        this.person = person;
    }

    /**
     * @return the expiry
     */
    public int getExpiry() {
        return expiry;
    }

    /**
     * @param expiry the expiry to set
     */
    public void setExpiry(int expiry) {
        this.expiry = expiry;
    }
}
