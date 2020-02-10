/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.util.Date;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

/**
 *
 * @author ubuntu
 */
public class Group {
    private int groupId;
    private String groupName;
    private String groupCode;
    private String description;
    private int createdBy;  
    private int groupType;
    private Date createdOn;  
    private Date lastUsedOn;  
    private int groupState;  
    private String defaultProfileName;

    public String getDefaultProfileName() {
        return defaultProfileName;
    }

    public void setDefaultProfileName(String defaultProfileName) {
        this.defaultProfileName = defaultProfileName;
    }
    private int lockState;     //closed or open group 0-unlock, 1-lock
    private int defaultProfileId;
    private int owner;
    private ArrayList<String> features;
    private ArrayList<Profile> profiles;

    public int getOwner() {
        return owner;
    }

    public void setOwner(int owner) {
        this.owner = owner;
    }

    public ArrayList<String> getFeatures() {
        return features;
    }

    public void setFeatures(ArrayList<String> features) {
        this.features = features;
    }

    public ArrayList<Profile> getProfiles() {
        return profiles;
    }

    public void setProfiles(ArrayList<Profile> profiles) {
        this.profiles = profiles;
    }
   
    
    public int getGroupId() {
        return groupId;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }
   
    

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public String getGroupCode() {
        return groupCode;
    }

    public void setGroupCode(String groupCode) {
        this.groupCode = groupCode;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }

    public int getGroupType() {
        return groupType;
    }

    public void setGroupType(int groupType) {
        this.groupType = groupType;
    }

    public Date getCreatedOn() {
        return createdOn;
    }

    public void setCreatedOn(Date createdOn) {
        this.createdOn = createdOn;
    }

    public Date getLastUsedOn() {
        return lastUsedOn;
    }

    public void setLastUsedOn(Date lastUsedOn) {
        this.lastUsedOn = lastUsedOn;
    }

    public int getGroupState() {
        return groupState;
    }

    public void setGroupState(int groupState) {
        this.groupState = groupState;
    }

    public int getLockState()
    {
        return lockState;
    }
    public void setLockState(int lockState)
    {
        this.lockState=lockState;
    }

    public int getDefaultProfileId() {
        return defaultProfileId;
    }

    public void setDefaultProfileId(int defaultProfileId) {
        this.defaultProfileId = defaultProfileId;
    }


   
}
