/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author mayank
 */
public class Institute {

    private int instituteId;
    private String instituteName;
    private State state = new State();
    private City city = new City();
    private int pincode;
    private String instituteAddress;
    private int accredition;
    private String type;
    private String officePhone;
    private String headName;
    private String headAddress;
    private HeadTitle headTitle = new HeadTitle();
    private HeadDesignation headDesignation = new HeadDesignation();
    private String headEmail;
    private String headContact;
    private String headFax;
    private int isActive;
    private int last_updatedby;
    private int districtId;
    private District districts = new District();
    private InstituteType itype = new InstituteType();

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
     * @return the instituteName
     */
    public String getInstituteName() {
        return instituteName;
    }

    /**
     * @param instituteName the instituteName to set
     */
    public void setInstituteName(String instituteName) {
        this.instituteName = instituteName;
    }

    /**
     * @return the state
     */
    public State getState() {
        return state;
    }

    /**
     * @param state the state to set
     */
    public void setState(State state) {
        this.state = state;
    }

    /**
     * @return the city
     */
    public City getCity() {
        return city;
    }

    /**
     * @param city the city to set
     */
    public void setCity(City city) {
        this.city = city;
    }

    /**
     * @return the pincode
     */
    public int getPincode() {
        return pincode;
    }

    /**
     * @param pincode the pincode to set
     */
    public void setPincode(int pincode) {
        this.pincode = pincode;
    }

    /**
     * @return the address
     */
    public String getInstituteAddress() {
        return instituteAddress;
    }

    /**
     * @param address the address to set
     */
    public void setInstituteAddress(String instituteAddress) {
        this.instituteAddress = instituteAddress;
    }

    /**
     * @return the accredition
     */
    public int getAccredition() {
        return accredition;
    }

    /**
     * @param accredition the accredition to set
     */
    public void setAccredition(int accredition) {
        this.accredition = accredition;
    }

    /**
     * @return the type
     */
    public String getType() {
        return type;
    }

    /**
     * @param type the type to set
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * @return the officePhone
     */
    public String getOfficePhone() {
        return officePhone;
    }

    /**
     * @param officePhone the officePhone to set
     */
    public void setOfficePhone(String officePhone) {
        this.officePhone = officePhone;
    }

    /**
     * @return the headName
     */
    public String getHeadName() {
        return headName;
    }

    /**
     * @param headName the headName to set
     */
    public void setHeadName(String headName) {
        this.headName = headName;
    }

    /**
     * @return the headAddress
     */
    public String getHeadAddress() {
        return headAddress;
    }

    /**
     * @param headAddress the headAddress to set
     */
    public void setHeadAddress(String headAddress) {
        this.headAddress = headAddress;
    }

    /**
     * @return the headTitle
     */
    public HeadTitle getHeadTitle() {
        return headTitle;
    }

    /**
     * @param headTitle the headTitle to set
     */
    public void setHeadTitle(HeadTitle headTitle) {
        this.headTitle = headTitle;
    }

    /**
     * @return the headDesignation
     */
    public HeadDesignation getHeadDesignation() {
        return headDesignation;
    }

    /**
     * @param headDesignation the headDesignation to set
     */
    public void setHeadDesignation(HeadDesignation headDesignation) {
        this.headDesignation = headDesignation;
    }

    /**
     * @return the headEmail
     */
    public String getHeadEmail() {
        return headEmail;
    }

    /**
     * @param headEmail the headEmail to set
     */
    public void setHeadEmail(String headEmail) {
        this.headEmail = headEmail;
    }

    /**
     * @return the headContact
     */
    public String getHeadContact() {
        return headContact;
    }

    /**
     * @param headContact the headContact to set
     */
    public void setHeadContact(String headContact) {
        this.headContact = headContact;
    }

    /**
     * @return the headFax
     */
    public String getHeadFax() {
        return headFax;
    }

    /**
     * @param headFax the headFax to set
     */
    public void setHeadFax(String headFax) {
        this.headFax = headFax;
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
     * @return the last_updatedby
     */
    public int getLast_updatedby() {
        return last_updatedby;
    }

    /**
     * @param last_updatedby the last_updatedby to set
     */
    public void setLast_updatedby(int last_updatedby) {
        this.last_updatedby = last_updatedby;
    }

    /**
     * @return the districtId
     */
    public int getDistrictId() {
        return districtId;
    }

    /**
     * @param districtId the districtId to set
     */
    public void setDistrictId(int districtId) {
        this.districtId = districtId;
    }

    /**
     * @return the districts
     */
    public District getDistricts() {
        return districts;
    }

    /**
     * @param districts the districts to set
     */
    public void setDistricts(District districts) {
        this.districts = districts;
    }

    /**
     * @return the itype
     */
    public InstituteType getItype() {
        return itype;
    }

    /**
     * @param itype the itype to set
     */
    public void setItype(InstituteType itype) {
        this.itype = itype;
    }
}
