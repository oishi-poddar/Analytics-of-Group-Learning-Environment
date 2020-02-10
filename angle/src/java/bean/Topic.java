
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author ubuntu
 */
public class Topic {
	private int topicId;
	private int groupId;
	private String groupCode;
	private String name;
	private int createdById;
	private String createdOn;
    
	public int getTopicId() {
    	return topicId;
	}

	public void setTopicId(int topicId) {
    	this.topicId = topicId;
	}

	public int getGroupId() {
    	return groupId;
	}

	public void setGroupId(int groupId) {
    	this.groupId = groupId;
	}

	public String getGroupCode() {
    	return groupCode;
	}

	public void setGroupCode(String groupCode) {
    	this.groupCode = groupCode;
	}

	public String getName() {
    	return name;
	}

	public void setName(String name) {
    	this.name = name;
	}

	public int getCreatedById() {
    	return createdById;
	}

	public void setCreatedById(int createdById) {
    	this.createdById = createdById;
	}

	public String getCreatedOn() {
    	return createdOn;
	}

	public void setCreatedOn(String createdOn) {
    	this.createdOn = createdOn;
	}
    
    
}
