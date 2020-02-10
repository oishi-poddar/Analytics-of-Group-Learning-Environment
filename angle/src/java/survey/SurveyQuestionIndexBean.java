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
public class SurveyQuestionIndexBean {

    private int question_id;
    private String question_description;
    private SurveyQuestionTypesBean question_type;
    private int sequence_var;
    private SurveyIndexBean survey_index;
    private ArrayList<SurveyOptionsOfQuestionsBean> options;
    private String answers;
    private int required;
    private int alignment_type;
    private ArrayList<String> ans_text;
    private String option_array;
    private int graph_type;
    private int lowerLimit;
    private int upperLimit;
    private int step_size;
    private ArrayList<SurveyOptionsOfQuestionsBean> rowOptions;
    private ArrayList<SurveyOptionsOfQuestionsBean> row_values;
    

    /**
     * @return the question_id
     */
    public int getQuestion_id() {
        return question_id;
    }

    /**
     * @param question_id the question_id to set
     */
    public void setQuestion_id(int question_id) {
        this.question_id = question_id;
    }

    /**
     * @return the question_desceiption
     */
    public String getQuestion_description() {
        return question_description;
    }

    /**
     * @param question_description the question_description to set
     */
    public void setQuestion_description(String question_description) {
        this.question_description = question_description;
    }

    /**
     * @return the sequence_var
     */
    public int getSequence_var() {
        return sequence_var;
    }

    /**
     * @param sequence_var the sequence_var to set
     */
    public void setSequence_var(int sequence_var) {
        this.sequence_var = sequence_var;
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
     * @return the question_type
     */
    public SurveyQuestionTypesBean getQuestion_type() {
        return question_type;
    }

    /**
     * @param question_type the question_type to set
     */
    public void setQuestion_type(SurveyQuestionTypesBean question_type) {
        this.question_type = question_type;
    }

    /**
     * @return the options
     */
    public ArrayList<SurveyOptionsOfQuestionsBean> getOptions() {
        return options;
    }

    /**
     * @param options the options to set
     */
    public void setOptions(ArrayList<SurveyOptionsOfQuestionsBean> options) {
        this.options = options;
    }

    /**
     * @return the answers
     */
    public String getAnswers() {
        return answers;
    }

    /**
     * @param answers the answers to set
     */
    public void setAnswers(String answers) {
        this.answers = answers;
    }

    /**
     * @return the required
     */
    public int getRequired() {
        return required;
    }

    /**
     * @param required the required to set
     */
    public void setRequired(int required) {
        this.required = required;
    }

    /**
     * @return the alignment_type
     */
    public int getAlignment_type() {
        return alignment_type;
    }

    /**
     * @param alignment_type the alignment_type to set
     */
    public void setAlignment_type(int alignment_type) {
        this.alignment_type = alignment_type;
    }

    /**
     * @return the ans_text
     */
    public ArrayList<String> getAns_text() {
        return ans_text;
    }

    /**
     * @param ans_text the ans_text to set
     */
    public void setAns_text(ArrayList<String> ans_text) {
        this.ans_text = ans_text;
    }

    /**
     * @return the option_array
     */
    public String getOption_array() {
        return option_array;
    }

    /**
     * @param option_array the option_array to set
     */
    public void setOption_array(String option_array) {
        this.option_array = option_array;
    }

    /**
     * @return the graph_type
     */
    public int getGraph_type() {
        return graph_type;
    }

    /**
     * @param graph_type the graph_type to set
     */
    public void setGraph_type(int graph_type) {
        this.graph_type = graph_type;
    }

    /**
     * @return the lowerLimit
     */
    public int getLowerLimit() {
        return lowerLimit;
    }

    /**
     * @param lowerLimit the lowerLimit to set
     */
    public void setLowerLimit(int lowerLimit) {
        this.lowerLimit = lowerLimit;
    }

    /**
     * @return the upperLimit
     */
    public int getUpperLimit() {
        return upperLimit;
    }

    /**
     * @param upperLimit the upperLimit to set
     */
    public void setUpperLimit(int upperLimit) {
        this.upperLimit = upperLimit;
    }

    /**
     * @return the step_size
     */
    public int getStep_size() {
        return step_size;
    }

    /**
     * @param step_size the step_size to set
     */
    public void setStep_size(int step_size) {
        this.step_size = step_size;
    }

    /**
     * @return the rowOptions
     */
    public ArrayList<SurveyOptionsOfQuestionsBean> getRowOptions() {
        return rowOptions;
    }

    /**
     * @param rowOptions the rowOptions to set
     */
    public void setRowOptions(ArrayList<SurveyOptionsOfQuestionsBean> rowOptions) {
        this.rowOptions = rowOptions;
    }

    /**
     * @return the row_values
     */
    public ArrayList<SurveyOptionsOfQuestionsBean> getRow_values() {
        return row_values;
    }

    /**
     * @param row_values the row_values to set
     */
    public void setRow_values(ArrayList<SurveyOptionsOfQuestionsBean> row_values) {
        this.row_values = row_values;
    }
}
