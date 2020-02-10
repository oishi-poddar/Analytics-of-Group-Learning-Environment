/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author apurv
 */
public class ToDoList {
    String groupName;
    HashMap<String,ArrayList<TopicToDo> > todoList = new HashMap<String,ArrayList<TopicToDo> >();

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public HashMap<String, ArrayList<TopicToDo>> getTodoList() {
        return todoList;
    }

    public void setTodoList(HashMap<String, ArrayList<TopicToDo>> todoList) {
        this.todoList = todoList;
    }

    
}