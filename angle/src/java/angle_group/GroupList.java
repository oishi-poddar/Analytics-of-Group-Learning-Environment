/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package angle_group;

import bean.Group;
import bean.Notification;
import bean.Person;
import bean.Profile;
import bean.UserGroup;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import utilities.Utility;

public class GroupList extends ActionSupport {

    ArrayList<UserGroup> group_list = new ArrayList<UserGroup>();
    ArrayList<UserGroup> allGroups = new ArrayList<UserGroup>();
    
    ArrayList<Notification> notificationList = new ArrayList<>();
    ArrayList<Profile> profile_list = new ArrayList<>();
    int unreadCount = 0;

    public ArrayList<UserGroup> getAllGroups() {
        return allGroups;
    }

    public void setAllGroups(ArrayList<UserGroup> allGroups) {
        this.allGroups = allGroups;
    }
    public ArrayList<Profile> getProfile_list() {
        return profile_list;
    }

    public void setProfile_list(ArrayList<Profile> profile_list) {
        this.profile_list = profile_list;
    }

    public ArrayList<UserGroup> getGroup_list() {
        return group_list;
    }

    public void setGroup_list(ArrayList<UserGroup> group_list) {
        this.group_list = group_list;
    }

    public ArrayList<Notification> getNotificationList() {
        return notificationList;
    }

    public void setNotificationList(ArrayList<Notification> notificationList) {
        this.notificationList = notificationList;
    }

    @Override
    public String execute() {
        try {
            HttpSession session = ServletActionContext.getRequest().getSession();
            Person person = (Person) session.getAttribute(Utility.USER_HANDLE);
            if (person == null) {
                //set action error
                clearActionErrors();
                addActionError("Please Login");
                return Utility.LOGIN_FAILURE;
            } else {
                AngleUtility util = new AngleUtility();
                group_list = util.listGroup(person.getLoginId());
                profile_list = util.getListOfProfiles();
                allGroups=util.getAllGroups();
                notificationList = util.getNotificationForUser(person.getLoginId());
               // System.out.println(notificationList);
                for (Notification i : notificationList) {
                    if (!i.isViewedFlag()) {
                        unreadCount++;
                    }
                }
//        System.out.println("notification : "+ notificationList.size());
                //      System.out.println(group_list);
                return Utility.SUCCESS;
            }
        } catch (Exception e) {
            return Utility.ERROR;
        }
    }

//    public ArrayList<Profile> getProfile_list() {
//        return profile_list;
//    }
//    public void setProfile_list(ArrayList<Profile> profile_list) {
//        this.profile_list = profile_list;
//        HttpSession session = ServletActionContext.getRequest().getSession();
//        Person person = (Person) session.getAttribute(Utility.USER_HANDLE);
//        AngleUtility util=new AngleUtility();
//        group_list=util.listGroup(person.getLoginId());
////        System.out.println(group_list);
//        //return "success";
//    }
}
