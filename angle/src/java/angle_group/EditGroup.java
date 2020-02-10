/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package angle_group;

import bean.Group;
import com.opensymphony.xwork2.ActionSupport;
import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;

/**
 *
 * @author ubuntu
 */
public class EditGroup extends ActionSupport{  
   private String name;
   private int id;
   Group g;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }    
    
    @Override
    public String execute()
    {
        AngleUtility uprocess = new AngleUtility();
        g=new Group();
        g.setGroupName(name);
        g.setGroupId(id);
        
        if (uprocess.updateGroup(g))
        {
            return SUCCESS;
        }
        else
        {
            return ERROR;
        }
    }
    
    
}
