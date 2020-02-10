/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package utilities;

/**
 *
 * @author mayank
 */
public class Utility {

    public static final String USER_HANDLE = "loggedInUser";
    public static final String ROLE_FAILURE = "invalid_role";
    public static final String LOGIN_FAILURE = "login_failure";
    public static final String LOGGER_HANDLE = "success";
    public static final String SUCCESS = "success";
    public static final String NONE = "none";
    public static final String ERROR = "error";
    public static final String INPUT = "input";
    public static final String ADMINSUCCESS = "adminsuccess";
    public static final String ALREADY_REGISTERED = "already_registered";
    public static final String RC_ALREADY_REGISTERED = "rc_already_registered";
    public static final String NOT_REGISTERED = "not_registered";
    public static final String PROFILE_NOT_UPDTAED = "profile_not_updated";
    public static final String USER_DASHBOARD = "user_dashboard";

    public static void log(String log) {
        System.out.println(log);
    }

    public static void log(String className, String log) {
        System.out.println(className + " : " + log);
    }

    public static void log(String className, String log, Exception e) {
        System.out.println(className + " : " + log);
        e.printStackTrace();
    }

    public static void log(String className, Exception e) {
        System.out.println(className + " : ");
        e.printStackTrace();
    }
}
