/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.sql.Timestamp;

/**
 *
 * @author mayank
 */
public class Person {
    private int val;
    private int loginId;
    private String loginName;
    private String password;
    private int roleId;
    private boolean loginStatus;
    private Timestamp lastLogin;
    private int numberOfLogins;
    private String email;
    private String email_enc;
    private Title title = new Title();
    private String firstName;
    private String lastName;
    private Designation designation = new Designation();
    private String gender;
    private City city = new City();
    private String address;
    private int pincode;
    private String mobileNumber;
    private String phoneNumber;
    private Qualification qualification = new Qualification();
    private String experience;
    private Institute institute = new Institute();
    private Institute headInstitute = new Institute();
    private Stream stream = new Stream();
    private String image;
    private String ipAddress;
    private RemoteCenter remoteCenter;
    private RegistrationDetails registrationDetails = new RegistrationDetails();
    private String aadharId;
    private int yearofbirth;
    private int stateId;
    private int cityId;
    private String username;
    private String otherCity;
    private int hiddenYearOfBirth;
    private StatusMatrix statusMatrix;
    private int per_workshopid;
    private String per_state;
    private int per_mobile;
    private int per_phone;
    private String per_filename;
    private int per_filename_id;
    private int per_user_id;
    private String per_userstatus;
    private String per_errormessage;
    private String last_login1;
    private String facultyStatus;
    private InstituteType institutetype = new InstituteType();
    private District districts = new District();
    private String mobileNumber1;
    private int bulkmail_templateid;
    private int bulkmailtype;
    private String bulkemailfile;
    private int surveyid;
    private String passwordUpdate;
    private String checkEmail;
    private String captcha;
    /**
     * @return the loginId
     */
    public int getLoginId() {
        return loginId;
    }

    /**
     * @param loginId the loginId to set
     */
    public void setLoginId(int loginId) {
        this.loginId = loginId;
    }

    /**
     * @return the loginName
     */
    public String getLoginName() {
        return loginName;
    }

    /**
     * @param loginName the loginName to set
     */
    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the roleId
     */
    public int getRoleId() {
        return roleId;
    }

    /**
     * @param roleId the roleId to set
     */
    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    /**
     * @return the loginStatus
     */
    public boolean isLoginStatus() {
        return loginStatus;
    }

    /**
     * @param loginStatus the loginStatus to set
     */
    public void setLoginStatus(boolean loginStatus) {
        this.loginStatus = loginStatus;
    }

    /**
     * @return the lastLogin
     */
    public Timestamp getLastLogin() {
        return lastLogin;
    }

    /**
     * @param lastLogin the lastLogin to set
     */
    public void setLastLogin(Timestamp lastLogin) {
        this.lastLogin = lastLogin;
    }
    

    /**
     * @return the numberOfLogins
     */
    public int getNumberOfLogins() {
        return numberOfLogins;
    }

    /**
     * @param numberOfLogins the numberOfLogins to set
     */
    public void setNumberOfLogins(int numberOfLogins) {
        this.numberOfLogins = numberOfLogins;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the firstName
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * @param firstName the firstName to set
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * @return the lastName
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * @param lastName the lastName to set
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    /**
     * @return the gender
     */
    public String getGender() {
        return gender;
    }

    /**
     * @param gender the gender to set
     */
    public void setGender(String gender) {
        this.gender = gender;
    }

    /**
     * @return the address
     */
    public String getAddress() {
        return address;
    }

    /**
     * @param address the address to set
     */
    public void setAddress(String address) {
        this.address = address;
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
     * @return the experience
     */
    public String getExperience() {
        return experience;
    }

    /**
     * @param experience the experience to set
     */
    public void setExperience(String experience) {
        this.experience = experience;
    }

    /**
     * @return the image
     */
    public String getImage() {
        return image;
    }

    /**
     * @param image the image to set
     */
    public void setImage(String image) {
        this.image = image;
    }

    /**
     * @return the ipAddress
     */
    public String getIpAddress() {
        return ipAddress;
    }

    /**
     * @param ipAddress the ipAddress to set
     */
    public void setIpAddress(String ipAddress) {
        this.ipAddress = ipAddress;
    }

    /**
     * @return the title
     */
    public Title getTitle() {
        return title;
    }

    /**
     * @param title the title to set
     */
    public void setTitle(Title title) {
        this.title = title;
    }

    /**
     * @return the designation
     */
    public Designation getDesignation() {
        return designation;
    }

    /**
     * @param designation the designation to set
     */
    public void setDesignation(Designation designation) {
        this.designation = designation;
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
     * @return the institute
     */
    public Institute getInstitute() {
        return institute;
    }

    /**
     * @param institute the institute to set
     */
    public void setInstitute(Institute institute) {
        this.institute = institute;
    }

    /**
     * @return the stream
     */
    public Stream getStream() {
        return stream;
    }

    /**
     * @param stream the stream to set
     */
    public void setStream(Stream stream) {
        this.stream = stream;
    }

    /**
     * @return the remoteCenter
     */
    public Qualification getQualification() {
        return qualification;
    }

    /**
     * @param remotecenter the remoteCenter to set
     */
    public void setQualification(Qualification qualification) {
        this.qualification = qualification;
    }

    /**
     * @return the mobileNumber
     */
    public String getMobileNumber() {
        return mobileNumber;
    }

    /**
     * @param mobileNumber the mobileNumber to set
     */
    public void setMobileNumber(String mobileNumber) {
        this.mobileNumber = mobileNumber;
    }

    /**
     * @return the phoneNumber
     */
    public String getPhoneNumber() {
        return phoneNumber;
    }

    /**
     * @param phoneNumber the phoneNumber to set
     */
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    /**
     * @return the remoteCenter
     */
    public RemoteCenter getRemoteCenter() {
        return remoteCenter;
    }

    /**
     * @param remoteCenter the remoteCenter to set
     */
    public void setRemoteCenter(RemoteCenter remoteCenter) {
        this.remoteCenter = remoteCenter;
    }

    /**
     * @return the registrationDetails
     */
    public RegistrationDetails getRegistrationDetails() {
        return registrationDetails;
    }

    /**
     * @param registrationDetails the registrationDetails to set
     */
    public void setRegistrationDetails(RegistrationDetails registrationDetails) {
        this.registrationDetails = registrationDetails;
    }

    /**
     * @return the headInstitute
     */
    public Institute getHeadInstitute() {
        return headInstitute;
    }

    /**
     * @param headInstitute the headInstitute to set
     */
    public void setHeadInstitute(Institute headInstitute) {
        this.headInstitute = headInstitute;
    }

    /**
     * @return the email_enc
     */
    public String getEmail_enc() {
        return email_enc;
    }

    /**
     * @param email_enc the email_enc to set
     */
    public void setEmail_enc(String email_enc) {
        this.email_enc = email_enc;
    }

    /**
     * @return the aadharId
     */
    public String getAadharId() {
        return aadharId;
    }

    /**
     * @param aadharId the aadharId to set
     */
    public void setAadharId(String aadharId) {
        this.aadharId = aadharId;
    }

    /**
     * @return the yearofbirth
     */
    public int getYearofbirth() {
        return yearofbirth;
    }

    /**
     * @param yearofbirth the yearofbirth to set
     */
    public void setYearofbirth(int yearofbirth) {
        this.yearofbirth = yearofbirth;
    }

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
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the otherCity
     */
    public String getOtherCity() {
        return otherCity;
    }

    /**
     * @param otherCity the otherCity to set
     */
    public void setOtherCity(String otherCity) {
        this.otherCity = otherCity;
    }

    /**
     * @return the cityId
     */
    public int getCityId() {
        return cityId;
    }

    /**
     * @param cityId the cityId to set
     */
    public void setCityId(int cityId) {
        this.cityId = cityId;
    }

    /**
     * @return the hiddenYearOfBirth
     */
    public int getHiddenYearOfBirth() {
        return hiddenYearOfBirth;
    }

    /**
     * @param hiddenYearOfBirth the hiddenYearOfBirth to set
     */
    public void setHiddenYearOfBirth(int hiddenYearOfBirth) {
        this.hiddenYearOfBirth = hiddenYearOfBirth;
    }

    /**
     * @return the statusMatrix
     */
    public StatusMatrix getStatusMatrix() {
        return statusMatrix;
    }

    /**
     * @param statusMatrix the statusMatrix to set
     */
    public void setStatusMatrix(StatusMatrix statusMatrix) {
        this.statusMatrix = statusMatrix;
    }

    /**
     * @return the per_workshopid
     */
    public int getPer_workshopid() {
        return per_workshopid;
    }

    /**
     * @param per_workshopid the per_workshopid to set
     */
    public void setPer_workshopid(int per_workshopid) {
        this.per_workshopid = per_workshopid;
    }

    /**
     * @return the per_state
     */
    public String getPer_state() {
        return per_state;
    }

    /**
     * @param per_state the per_state to set
     */
    public void setPer_state(String per_state) {
        this.per_state = per_state;
    }

    /**
     * @return the per_mobile
     */
    public int getPer_mobile() {
        return per_mobile;
    }

    /**
     * @param per_mobile the per_mobile to set
     */
    public void setPer_mobile(int per_mobile) {
        this.per_mobile = per_mobile;
    }

    /**
     * @return the per_phone
     */
    public int getPer_phone() {
        return per_phone;
    }

    /**
     * @param per_phone the per_phone to set
     */
    public void setPer_phone(int per_phone) {
        this.per_phone = per_phone;
    }

    /**
     * @return the per_filename
     */
    public String getPer_filename() {
        return per_filename;
    }

    /**
     * @param per_filename the per_filename to set
     */
    public void setPer_filename(String per_filename) {
        this.per_filename = per_filename;
    }

    /**
     * @return the per_filename_id
     */
    public int getPer_filename_id() {
        return per_filename_id;
    }

    /**
     * @param per_filename_id the per_filename_id to set
     */
    public void setPer_filename_id(int per_filename_id) {
        this.per_filename_id = per_filename_id;
    }

    /**
     * @return the per_user_id
     */
    public int getPer_user_id() {
        return per_user_id;
    }

    /**
     * @param per_user_id the per_user_id to set
     */
    public void setPer_user_id(int per_user_id) {
        this.per_user_id = per_user_id;
    }

    /**
     * @return the per_userstatus
     */
    public String getPer_userstatus() {
        return per_userstatus;
    }

    /**
     * @param per_userstatus the per_userstatus to set
     */
    public void setPer_userstatus(String per_userstatus) {
        this.per_userstatus = per_userstatus;
    }

    /**
     * @return the per_errormessage
     */
    public String getPer_errormessage() {
        return per_errormessage;
    }

    /**
     * @param per_errormessage the per_errormessage to set
     */
    public void setPer_errormessage(String per_errormessage) {
        this.per_errormessage = per_errormessage;
    }

    /**
     * @return the last_login1
     */
    public String getLast_login1() {
        return last_login1;
    }

    /**
     * @param last_login1 the last_login1 to set
     */
    public void setLast_login1(String last_login1) {
        this.last_login1 = last_login1;
    }

    /**
     * @return the facultyStatus
     */
    public String getFacultyStatus() {
        return facultyStatus;
    }

    /**
     * @param facultyStatus the facultyStatus to set
     */
    public void setFacultyStatus(String facultyStatus) {
        this.facultyStatus = facultyStatus;
    }

    /**
     * @return the institutetype
     */
    public InstituteType getInstitutetype() {
        return institutetype;
    }

    /**
     * @param institutetype the institutetype to set
     */
    public void setInstitutetype(InstituteType institutetype) {
        this.institutetype = institutetype;
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
     * @return the mobileNumber1
     */
    public String getMobileNumber1() {
        return mobileNumber1;
    }

    /**
     * @param mobileNumber1 the mobileNumber1 to set
     */
    public void setMobileNumber1(String mobileNumber1) {
        this.mobileNumber1 = mobileNumber1;
    }

    /**
     * @return the bulkmail_templateid
     */
    public int getBulkmail_templateid() {
        return bulkmail_templateid;
    }

    /**
     * @param bulkmail_templateid the bulkmail_templateid to set
     */
    public void setBulkmail_templateid(int bulkmail_templateid) {
        this.bulkmail_templateid = bulkmail_templateid;
    }

    /**
     * @return the bulkmailtype
     */
    public int getBulkmailtype() {
        return bulkmailtype;
    }

    /**
     * @param bulkmailtype the bulkmailtype to set
     */
    public void setBulkmailtype(int bulkmailtype) {
        this.bulkmailtype = bulkmailtype;
    }

    /**
     * @return the bulkemailfile
     */
    public String getBulkemailfile() {
        return bulkemailfile;
    }

    /**
     * @param bulkemailfile the bulkemailfile to set
     */
    public void setBulkemailfile(String bulkemailfile) {
        this.bulkemailfile = bulkemailfile;
    }

    /**
     * @return the surveyid
     */
    public int getSurveyid() {
        return surveyid;
    }

    /**
     * @param surveyid the surveyid to set
     */
    public void setSurveyid(int surveyid) {
        this.surveyid = surveyid;
    }

    /**
     * @return the passwordUpdate
     */
    public String getPasswordUpdate() {
        return passwordUpdate;
    }

    /**
     * @param passwordUpdate the passwordUpdate to set
     */
    public void setPasswordUpdate(String passwordUpdate) {
        this.passwordUpdate = passwordUpdate;
    }
    
    
    /**
     * @return the loginName
     */
    public String getCaptcha() {
        return captcha;
    }

    /**
     * @param captcha the loginName to set
     */
    public void setCaptcha(String captcha) {
        this.captcha = captcha;
    }
    
    
    /**
     * @return the val
     */
    public int getVal() {
        return val;
    }

    /**
     * @param val the loginId to set
     */
    public void setVal(int val) {
        this.val = val;
    }
    /**
     * @return the checkEmail
     */
    public String getCheckEmail() {
        return checkEmail;
    }

    /**
     * @param checkEmail the loginName to set
     */
    public void setCheckEmail(String checkEmail) {
        this.checkEmail = checkEmail;
    }
    
}
