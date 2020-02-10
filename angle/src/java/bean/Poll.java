/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.sql.Timestamp;
import java.util.ArrayList;

/**
 *
 * @author pratik
 */

public class Poll {  
    private Integer pollId;
    private Integer groupId;
    private String question;
    private Timestamp createdOn;
    private Timestamp endDate;
    private Integer createdBy;       // owner's id
    private Integer graphType;   // 1 for Bar Graph, 2 for Pie Chart
    private ArrayList<String> options;
    private ArrayList<Integer> optionsId;
    private ArrayList<Integer> noOfVotes;
    private Integer selectedOption;

    public ArrayList<Integer> getNoOfVotes() {
        return noOfVotes;
    }

    public void setNoOfVotes(ArrayList<Integer> noOfVotes) {
        this.noOfVotes = noOfVotes;
    }
  
   public Integer getPollId() {
        return pollId;
    }

    public void setPollId(Integer pollId) {
        this.pollId = pollId;
    }

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public Timestamp getCreatedOn() {
        return createdOn;
    }

    public void setCreatedOn(Timestamp createdOn) {
        this.createdOn = createdOn;
    }

    public Timestamp getEndDate() {
        return endDate;
    }

    public void setEndDate(Timestamp endDate) {
        this.endDate = endDate;
    }

    public Integer getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(Integer createdBy) {
        this.createdBy = createdBy;
    }

    public Integer getGraphType() {
        return graphType;
    }

    public void setGraphType(Integer graphType) {
        this.graphType = graphType;
    }

    public ArrayList<String> getOptions() {
        return options;
    }

    public void setOptions(ArrayList<String> options) {
        this.options = options;
    }

    public ArrayList<Integer> getOptionsId() {
        return optionsId;
    }

    public void setOptionsId(ArrayList<Integer> optionsId) {
        this.optionsId = optionsId;
    }

    public Integer getSelectedOption() {
        return selectedOption;
    }

    public void setSelectedOption(Integer selectedOption) {
        this.selectedOption = selectedOption;
    }
   
}