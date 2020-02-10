/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package survey;

/**
 *
 * @author abinaya
 */
public class SurveyOptionsOfQuestionsBean {

    private SurveyQuestionIndexBean question;
    private String option;
    private int value_of_option;
    private int sequence;
    private int count_of_option;
    
    private int row_id;
    private String row_ans;

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
     * @return the value_of_option
     */
    public int getValue_of_option() {
        return value_of_option;
    }

    /**
     * @param value_of_option the value_of_option to set
     */
    public void setValue_of_option(int value_of_option) {
        this.value_of_option = value_of_option;
    }

    /**
     * @return the sequence
     */
    public int getSequence() {
        return sequence;
    }

    /**
     * @param sequence the sequence to set
     */
    public void setSequence(int sequence) {
        this.sequence = sequence;
    }

    /**
     * @return the question
     */
    public SurveyQuestionIndexBean getQuestion() {
        return question;
    }

    /**
     * @param question the question to set
     */
    public void setQuestion(SurveyQuestionIndexBean question) {
        this.question = question;
    }

    /**
     * @return the count_of_option
     */
    public int getCount_of_option() {
        return count_of_option;
    }

    /**
     * @param count_of_option the count_of_option to set
     */
    public void setCount_of_option(int count_of_option) {
        this.count_of_option = count_of_option;
    }

    /**
     * @return the row_id
     */
    public int getRow_id() {
        return row_id;
    }

    /**
     * @param row_id the row_id to set
     */
    public void setRow_id(int row_id) {
        this.row_id = row_id;
    }

    /**
     * @return the row_ans
     */
    public String getRow_ans() {
        return row_ans;
    }

    /**
     * @param row_ans the row_ans to set
     */
    public void setRow_ans(String row_ans) {
        this.row_ans = row_ans;
    }
}
