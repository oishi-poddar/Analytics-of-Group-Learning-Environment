/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.sql.Timestamp;

/**
 *
 * @author pratik
 */
public class Notification {
    private int notificationId;
    private int userId;
    private int groupId;
    private String groupName;
    private String title;
    private String content;
    private int notificationType;
    private boolean viewedFlag;
    private Timestamp dateTime;
    private String dateCustomFormat;

    public int getNotificationId() {
        return notificationId;
    }

    public void setNotificationId(int notificationId) {
        this.notificationId = notificationId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getNotificationType() {
        return notificationType;
    }

    public void setNotificationType(int notificationType) {
        this.notificationType = notificationType;
    }

    public boolean isViewedFlag() {
        return viewedFlag;
    }

    public void setViewedFlag(boolean viewedFlag) {
        this.viewedFlag = viewedFlag;
    }

    public Timestamp getDateTime() {
        return dateTime;
    }

    public void setDateTime(Timestamp dateTime) {
        this.dateTime = dateTime;
    }

    public String getDateCustomFormat() {
        return dateCustomFormat;
    }

    public void setDateCustomFormat(String dateCustomFormat) {
        this.dateCustomFormat = dateCustomFormat;
    }
    
}
