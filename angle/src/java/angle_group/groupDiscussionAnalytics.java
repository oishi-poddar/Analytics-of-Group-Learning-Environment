/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package angle_group;
import bean.JforumData;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;


/**
 *
 * @author Chirag
 */
public class groupDiscussionAnalytics extends ActionSupport{
    
    
    private ArrayList<JforumData> chartAnalysis;
    private ArrayList<JforumData> userInfo;
    private ArrayList<JforumData> tableInfo;


     /**
     *function sets the chartAnalysis with the static arraylist postCount of Jforum Utility Class that contain object of Participant Details
     * @return
     */
    @Override
    public String execute() {
            JforumUtility a_utility = new JforumUtility();
            HttpServletRequest req = ServletActionContext.getRequest();
            int groupId=Integer.parseInt(req.getParameter("gid").toString());
            System.out.println("qqqqqqqqqqqqqqqqqqqqqqqqqqq"+groupId);
            //int queryId=Integer.parseInt(req.getParameter("queryId").toString());
            setChartAnalysis(new JforumUtility().messageList(groupId));
            setUserInfo(new JforumUtility().userList(groupId));
            //setTableInfo(new JforumUtility().tableList(queryId));


//            for(int i=0;i<chartAnalysis.size();i++){
//                System.out.println(chartAnalysis.get(i).getQuery());
//                System.out.println(chartAnalysis.get(i).getReplies());
//                System.out.println(chartAnalysis.get(i).getNumberOfUsers());
//            }
           
            return "success";
                     
    }

    public ArrayList<JforumData> getChartAnalysis() {
        return chartAnalysis;
    }

    public void setChartAnalysis(ArrayList<JforumData> chartAnalysis) {
        this.chartAnalysis = chartAnalysis;
    }

    public ArrayList<JforumData> getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(ArrayList<JforumData> userInfo) {
        this.userInfo = userInfo;
    }

    public ArrayList<JforumData> getTableInfo() {
        return tableInfo;
    }

    public void setTableInfo(ArrayList<JforumData> tableInfo) {
        this.tableInfo = tableInfo;
    }

    
    


}
