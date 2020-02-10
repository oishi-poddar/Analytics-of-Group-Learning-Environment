/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package survey;

import java.sql.Array;
import java.util.ArrayList;

/**
 *
 * @author abinaya
 */
public class SurveyAnswersBean {

    private SurveyOptionsOfQuestionsBean question;
    private String option;
    private int personid;
    private SurveyIndexBean survey_index;
    private ArrayList<SurveyQuestionIndexBean> all_questions;
    private String pid_enc;
    private ArrayList<ReportBean> rb;
    private ArrayList rbean;

    /**
     * @return the option
     */
    public String getOption() {
        return option;
    }

    /**
     * @param option the option to set
     */
    public void setOption(String option) {
        this.option = option;
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
     * @return the question
     */
    public SurveyOptionsOfQuestionsBean getQuestion() {
        return question;
    }

    /**
     * @param question the question to set
     */
    public void setQuestion(SurveyOptionsOfQuestionsBean question) {
        this.question = question;
    }

    /**
     * @return the survey_index
     */
    public SurveyIndexBean getSurvey_index() {
        return survey_index;
    }

    /**
     * @param survey_index the survey_index to set
     */
    public void setSurvey_index(SurveyIndexBean survey_index) {
        this.survey_index = survey_index;
    }

    /**
     * @return the all_questions
     */
    public ArrayList<SurveyQuestionIndexBean> getAll_questions() {
        return all_questions;
    }

    /**
     * @param all_questions the all_questions to set
     */
    public void setAll_questions(ArrayList<SurveyQuestionIndexBean> all_questions) {
        this.all_questions = all_questions;
    }

    /**
     * @return the pid_enc
     */
    public String getPid_enc() {
        return pid_enc;
    }

    /**
     * @param pid_enc the pid_enc to set
     */
    public void setPid_enc(String pid_enc) {
        this.pid_enc = pid_enc;
    }

    /**
     * @return the rb
     */
    public ArrayList<ReportBean> getRb() {
        return rb;
    }

    /**
     * @param rb the rb to set
     */
    public void setRb(ArrayList<ReportBean> rb) {
        this.rb = rb;
    }

    /**
     * @return the rbean
     */
    public ArrayList getRbean() {
        return rbean;
    }

    /**
     * @param rbean the rbean to set
     */
    public void setRbean(ArrayList rbean) {
        this.rbean = rbean;
    }
}
