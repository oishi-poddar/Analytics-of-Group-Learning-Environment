/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author sheweta
 */
public class Lookups {

    private String code;
    private String category;
    private String description;
    private String comment;
    private int isactive = 3;
    private int lookup_id;
    private String lookup_id_enc;
    private String newCategory = "";
    private int isNewCategory = 0;
    private int isNewConfig = 0;

    public String getCode() {
        return this.code;
    }

    public String getCategory() {
        return this.category;
    }

    public String getDescription() {
        return this.description;
    }

    public String getComment() {
        return this.comment;
    }

    public void setCode(String Code) {
        this.code = Code;
    }

    public void setCategory(String Category) {
        this.category = Category;
    }

    public void setDescription(String Description) {
        this.description = Description;
    }

    public void setComment(String Comment) {
        this.comment = Comment;
    }

    /**
     * @return the isactive
     */
    public int getIsactive() {
        return isactive;
    }

    /**
     * @param isactive the isactive to set
     */
    public void setIsactive(int isactive) {
        this.isactive = isactive;
    }

    /**
     * @return the lookup_id
     */
    public int getLookup_id() {
        return lookup_id;
    }

    /**
     * @param lookup_id the lookup_id to set
     */
    public void setLookup_id(int lookup_id) {
        this.lookup_id = lookup_id;
    }

    /**
     * @return the lookup_id_enc
     */
    public String getLookup_id_enc() {
        return lookup_id_enc;
    }

    /**
     * @param lookup_id_enc the lookup_id_enc to set
     */
    public void setLookup_id_enc(String lookup_id_enc) {
        this.lookup_id_enc = lookup_id_enc;
    }

    /**
     * @return the newCategory
     */
    public String getNewCategory() {
        return newCategory;
    }

    /**
     * @param newCategory the newCategory to set
     */
    public void setNewCategory(String newCategory) {
        this.newCategory = newCategory;
    }

    /**
     * @return the isNewCategory
     */
    public int getIsNewCategory() {
        return isNewCategory;
    }

    /**
     * @param isNewCategory the isNewCategory to set
     */
    public void setIsNewCategory(int isNewCategory) {
        this.isNewCategory = isNewCategory;
    }

    /**
     * @return the isNewConfig
     */
    public int getIsNewConfig() {
        return isNewConfig;
    }

    /**
     * @param isNewConfig the isNewConfig to set
     */
    public void setIsNewConfig(int isNewConfig) {
        this.isNewConfig = isNewConfig;
    }
}
