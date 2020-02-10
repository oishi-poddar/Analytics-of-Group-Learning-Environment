/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author Abinaya
 */
public class UserDashboard {

    private WorkshopContent workshops;
    private RegistrationDetails registrationDetails;
    private Person person;
    private String schedule_url;
    private PaymentGateway paymentgateway;

    /**
     * @return the workshops
     */
    public WorkshopContent getWorkshops() {
        return workshops;
    }

    /**
     * @param workshops the workshops to set
     */
    public void setWorkshops(WorkshopContent workshops) {
        this.workshops = workshops;
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
     * @return the schedule_url
     */
    public String getSchedule_url() {
        return schedule_url;
    }

    /**
     * @param schedule_url the schedule_url to set
     */
    public void setSchedule_url(String schedule_url) {
        this.schedule_url = schedule_url;
    }

    /**
     * @return the paymentgateway
     */
    public PaymentGateway getPaymentgateway() {
        return paymentgateway;
    }

    /**
     * @param paymentgateway the paymentgateway to set
     */
    public void setPaymentgateway(PaymentGateway paymentgateway) {
        this.paymentgateway = paymentgateway;
    }
}
