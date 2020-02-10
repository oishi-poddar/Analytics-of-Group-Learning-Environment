/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author asl
 */
public class Content {

    private int id;
    private String name;
    private String description;
    private String content;
    private String comment;
    private int last_updatedby;
    private int class_type;

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * @return the content
     */
    public String getContent() {
        return content;
    }

    /**
     * @param content the content to set
     */
    public void setContent(String content) {
        this.content = content;
    }

    /**
     * @return the comment
     */
    public String getComment() {
        return comment;
    }

    /**
     * @param comment the comment to set
     */
    public void setComment(String comment) {
        this.comment = comment;
    }

    /**
     * @return the last_updatedby
     */
    public int getLast_updatedby() {
        return last_updatedby;
    }

    /**
     * @param last_updatedby the last_updatedby to set
     */
    public void setLast_updatedby(int last_updatedby) {
        this.last_updatedby = last_updatedby;
    }

    /**
     * @return the class_type
     */
    public int getClass_type() {
        return class_type;
    }

    /**
     * @param class_type the class_type to set
     */
    public void setClass_type(int class_type) {
        this.class_type = class_type;
    }
}
