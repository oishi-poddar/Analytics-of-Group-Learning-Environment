/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package angle_group;

/**
 *
 * @author pratik
 */
import bean.Topic;
import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;

/**
 *
 * @author pratik
 */
public class UpdateTopic extends ActionSupport{
    Topic t = null;

    public Topic getT() {
        return t;
    }

    public void setT(Topic t) {
        this.t = t;
    }
    
    @Override
    public String execute()
    {
        int p = 0;
        
        AngleUtility uprocess = new AngleUtility();
        p = uprocess.updateTopic(t.getName(), t.getTopicId());
        if (p != 0)
        {
            return SUCCESS;
        }
        else
        {
            return ERROR;
        }
    }
    
    @Override
    public void validate() {
        clearFieldErrors();
        String name="";
        name=getT().getName();
        if (name == null)
            addFieldError("name", getText("Enter a group name"));
        if (name.length() > 45)
            addFieldError("name", getText("Maximum lenght of Topic name is 45"));        
    }

    
}