/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package survey;

import java.util.ArrayList;

/**
 *
 * @author abinaya
 */
public class ReportBean {

    private ArrayList<String> option_chosen;
    private int personid;
    private int year_of_passing;

    /**
     * @return the option_chosen
     */
    public ArrayList<String> getOption() {
        return option_chosen;
    }

    /**
     * @param option_chosen the option_chosen to set
     */
    public void setOption(ArrayList<String> option_chosen) {
        this.option_chosen = option_chosen;
    }

    /**
     * @return the personid
     */
    public int getPersonid() {
        return personid;
    }

    /**
     * @param personid the personid to set
     */
    public void setPersonid(int personid) {
        this.personid = personid;
    }

    /**
     * @return the year_of_passing
     */
    public int getYear_of_passing() {
        return year_of_passing;
    }

    /**
     * @param year_of_passing the year_of_passing to set
     */
    public void setYear_of_passing(int year_of_passing) {
        this.year_of_passing = year_of_passing;
    }
}
