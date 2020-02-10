/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author mayank
 */
public interface Role {

    public static final int USER = 1;
    public static final int SUPPORTMANAGER = 2;
    public static final int SUPPORTSTAFF = 3;
    public static final int ADMIN = 4;
    public static final int TEACHER = 5;
    public static final String[] ROLE = {"", "ADMIN", "SUPPORTMANAGER", "SUPPORTSTAFF", "USER", "TEACHER"};
}
