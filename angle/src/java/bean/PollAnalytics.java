/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.sql.Timestamp;
import java.util.HashMap;

/**
 *
 * @author Kunal
 */
public class PollAnalytics {
    
    private Integer pollId;
    private Integer groupId;
    private String question;
    private Timestamp createdOn;
    private Timestamp endDate;
    private Integer createdBy;       // owner's id
    private Integer votersCount;
    private Integer nonVotersCount;
    private HashMap<Integer, HashMap<String,Integer>> options;

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

    public Integer getVotersCount() {
        return votersCount;
    }

    public void setVotersCount(Integer votersCount) {
        this.votersCount = votersCount;
    }

    public Integer getNonVotersCount() {
        return nonVotersCount;
    }

    public void setNonVotersCount(Integer nonVotersCount) {
        this.nonVotersCount = nonVotersCount;
    }

    public HashMap<Integer, HashMap<String, Integer>> getOptions() {
        return options;
    }

    public void setOptions(HashMap<Integer, HashMap<String, Integer>> options) {
        this.options = options;
    }

    
}
