package angle_group;

/**
 *
 * @author apurv
 */
import bean.Group;
import bean.Notes;
import bean.Topic;
import bean.AssignmentBean;
import bean.Person;
import bean.Poll;
import bean.PostBean;
import bean.Profile;
import bean.Quiz;
import bean.Subgroup;
import bean.UserGroup;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.logging.Logger;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import utilities.Utility;

public class MainGroupPage extends ActionSupport {

    private Notes n;
    private PostBean no;
    private int gid;
    HashMap<Integer, String> profilesList;
    ArrayList<Notes> datalist = new ArrayList<Notes>();
    ArrayList<String> notes;
    ArrayList<UserGroup> members;
    ArrayList<String> quiz;
    private int profileId;
    ArrayList<String> assignment;
    ArrayList<String> videoChat;
    ArrayList<String> poll;
    HashMap<String, ArrayList<HashMap<String, String>>> hashmap = new HashMap<String, ArrayList<HashMap<String, String>>>();
    ArrayList<String> discussionForum;
    ArrayList<String> Features = new ArrayList<String>();
    ArrayList<ArrayList<String>> fu = new ArrayList<ArrayList<String>>();
    ArrayList<AssignmentBean> listOfAssignments = new ArrayList<AssignmentBean>();
    ArrayList<AssignmentBean> listOfAssignmentForSubmission = new ArrayList<AssignmentBean>();
    ArrayList<AssignmentBean> listOfAssignmentForGrading = new ArrayList<AssignmentBean>();
    ArrayList<AssignmentBean> listOfPostAssignments = new ArrayList<AssignmentBean>();
    ArrayList<AssignmentBean> listOfGrade = new ArrayList<AssignmentBean>();
    ArrayList<Notes> listOfNotes = new ArrayList<Notes>();
    ArrayList<Poll> listOfUnansweredPolls = new ArrayList<Poll>();
    ArrayList<Poll> listOfAnsweredPolls = new ArrayList<Poll>();
    ArrayList<Topic> listOfTopics = new ArrayList<Topic>();
    ArrayList<PostBean> GroupPost = new ArrayList<PostBean>();
    ArrayList<Quiz> listOfUpcomingQuiz = new ArrayList<Quiz>();
    ArrayList<Quiz> listOfPastQuiz = new ArrayList<Quiz>();
    
    Subgroup g;

    public Subgroup getG() {
        return g;
    }

    public void setG(Subgroup g) {
        this.g = g;
    }
    

   


    public ArrayList<PostBean> getGroupPost() {
        return GroupPost;
    }

    public void setGroupPost(ArrayList<PostBean> GroupPost) {
        this.GroupPost = GroupPost;
    }
    private Group currGroup;
    
    public int getProfileId() {
        return profileId;
    }

    public void setProfileId(int profileId) {
        this.profileId = profileId;
    }

    public PostBean getNo() {
        return no;
    }

    public void setNo(PostBean no) {
        this.no = no;
    }
    

    public HashMap<Integer, String> getProfilesList() {
        return profilesList;
    }

    public void setProfilesList(HashMap<Integer, String> profilesList) {
        this.profilesList = profilesList;
    }

    public ArrayList<UserGroup> getMembers() {
        return members;
    }

    public void setMembers(ArrayList<UserGroup> members) {
        this.members = members;
    }

    public ArrayList<Topic> getListOfTopics() {
        return listOfTopics;
    }

    public void setListOfTopics(ArrayList<Topic> listOfTopics) {
        this.listOfTopics = listOfTopics;
    }



    public ArrayList<AssignmentBean> getListOfAssignmentForSubmission() {
        return listOfAssignmentForSubmission;
    }

    public void setListOfAssignmentForSubmission(ArrayList<AssignmentBean> listOfAssignmentForSubmission) {
        this.listOfAssignmentForSubmission = listOfAssignmentForSubmission;
    }

    public ArrayList<AssignmentBean> getListOfAssignmentForGrading() {
        return listOfAssignmentForGrading;
    }

    public void setListOfAssignmentForGrading(ArrayList<AssignmentBean> listOfAssignmentForGrading) {
        this.listOfAssignmentForGrading = listOfAssignmentForGrading;
    }

    public ArrayList<AssignmentBean> getListOfGrade() {
        return listOfGrade;
    }

    public void setListOfGrade(ArrayList<AssignmentBean> listOfGrade) {
        this.listOfGrade = listOfGrade;
    }

    public ArrayList<AssignmentBean> getListOfPostAssignments() {
        return listOfPostAssignments;
    }

    public void setListOfPostAssignments(ArrayList<AssignmentBean> listOfPostAssignments) {
        this.listOfPostAssignments = listOfPostAssignments;
    }

    public ArrayList<AssignmentBean> getListOfAssignments() {
        return listOfAssignments;
    }

    public void setListOfAssignments(ArrayList<AssignmentBean> listOfAssignments) {
        this.listOfAssignments = listOfAssignments;
    }

    public int getGid() {
        return gid;
    }

    public void setGid(int gid) {
        this.gid = gid;
    }

    public HashMap<String, ArrayList<HashMap<String, String>>> getHashmap() {
        return hashmap;
    }

    public void setHashmap(HashMap<String, ArrayList<HashMap<String, String>>> hashmap) {
        this.hashmap = hashmap;
    }

    public ArrayList<ArrayList<String>> getFu() {
        return fu;
    }

    public void setFu(ArrayList<ArrayList<String>> fu) {
        this.fu = fu;
    }

    public ArrayList<String> getFeatures() {
        return Features;
    }

    public void setFeatures(ArrayList<String> Features) {
        this.Features = Features;
    }

    public ArrayList<String> getDiscussionForum() {
        return discussionForum;
    }

    public void setDiscussionForum(ArrayList<String> discussionForum) {
        this.discussionForum = discussionForum;
    }

    public ArrayList<String> getNotes() {
        return notes;
    }

    public void setNotes(ArrayList<String> notes) {
        this.notes = notes;
    }

    public ArrayList<String> getQuiz() {
        return quiz;
    }

    public void setQuiz(ArrayList<String> quiz) {
        this.quiz = quiz;
    }

    public ArrayList<String> getAssignment() {
        return assignment;
    }

    public void setAssignment(ArrayList<String> assignment) {
        this.assignment = assignment;
    }

    public ArrayList<String> getVideoChat() {
        return videoChat;
    }

    public void setVideoChat(ArrayList<String> videoChat) {
        this.videoChat = videoChat;
    }

    public ArrayList<String> getPoll() {
        return poll;
    }

    public void setPoll(ArrayList<String> poll) {
        this.poll = poll;
    }

    public static Logger getLOG() {
        return LOG;
    }

    public static void setLOG(Logger LOG) {
        ActionSupport.LOG = LOG;
    }

    public Group getCurrGroup() {
        return currGroup;
    }

    public void setCurrGroup(Group currGroup) {
        this.currGroup = currGroup;
    }

    public Notes getN() {
        return n;
    }

    public void setN(Notes n) {
        this.n = n;
    }

    public ArrayList<Notes> getDatalist() {
        return datalist;
    }

    public void setDatalist(ArrayList<Notes> datalist) {
        this.datalist = datalist;
    }

    public ArrayList<Notes> getListOfNotes() {
        return listOfNotes;
    }

    public void setListOfNotes(ArrayList<Notes> listOfNotes) {
        this.listOfNotes = listOfNotes;
    }

    public ArrayList<Poll> getListOfUnansweredPolls() {
        return listOfUnansweredPolls;
    }

    public void setListOfUnansweredPolls(ArrayList<Poll> listOfUnansweredPolls) {
        this.listOfUnansweredPolls = listOfUnansweredPolls;
    }

    public ArrayList<Poll> getListOfAnsweredPolls() {
        return listOfAnsweredPolls;
    }

    public void setListOfAnsweredPolls(ArrayList<Poll> listOfAnsweredPolls) {
        this.listOfAnsweredPolls = listOfAnsweredPolls;
    }

    public ArrayList<Quiz> getListOfUpcomingQuiz() {
        return listOfUpcomingQuiz;
    }

    public void setListOfUpcomingQuiz(ArrayList<Quiz> listOfUpcomingQuiz) {
        this.listOfUpcomingQuiz = listOfUpcomingQuiz;
    }

    public ArrayList<Quiz> getListOfPastQuiz() {
        return listOfPastQuiz;
    }

    public void setListOfPastQuiz(ArrayList<Quiz> listOfPastQuiz) {
        this.listOfPastQuiz = listOfPastQuiz;
    }
    
    

    @Override
    public String execute() {
        try {
            HttpServletRequest request = ServletActionContext.getRequest();
            HttpSession session = request.getSession();
            Person person = (Person) session.getAttribute("loggedInUser");
            int uid = person.getLoginId();
            gid = Integer.parseInt(request.getParameter("groupId"));
            AngleUtility angle = new AngleUtility();
            currGroup = angle.getGroupById(gid);
            // System.out.println(getN().getNoteId());
            datalist = angle.displayNote(n, currGroup);
            HashMap<String, ArrayList<HashMap<String, String>>> hs = new HashMap<String, ArrayList<HashMap<String, String>>>();
            hs = angle.getFeatureList(gid, uid);
            members = angle.getAllMembers(gid);
            profilesList = angle.listAllAvailableProfiles(gid);

            profileId = angle.getProfileId(gid, uid);
            System.out.println("profile Id" + profileId);
            setHashmap(hs);
            listOfAssignments = angle.viewAssignment(gid);
            listOfAssignmentForSubmission = angle.viewAssignmentSubmission(gid, uid);
            listOfAssignmentForGrading = angle.viewAssignmentGrading(gid);
            listOfPostAssignments = angle.postAssignment(gid);
            listOfGrade = angle.viewGradelist(uid, gid);
            listOfNotes = angle.viewNotes(gid);
            listOfUnansweredPolls = angle.getUnansweredPolls(gid, uid);
            listOfAnsweredPolls = angle.getSubmittedPolls(gid, uid);
            listOfTopics =angle.viewTopic(uid, gid);
            GroupPost = angle.groupPost(no, currGroup);
            listOfUpcomingQuiz=angle.getUpcomingQuiz(gid);

            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return Utility.ERROR;
        }
    }
    
    
    public String SubGroup() {
        try {

            HttpServletRequest request = ServletActionContext.getRequest();
            HttpSession session = request.getSession();
            Person person = (Person) session.getAttribute("loggedInUser");
            int uid = person.getLoginId();
            int tempGid = Integer.parseInt(request.getParameter("group_temp_id"));
            System.out.println("ge" + tempGid);
            String notes = request.getParameter("Notes1");
            String assignment = request.getParameter("Assignment1");
            String videoChat = request.getParameter("Video Chat1");
            String quiz = request.getParameter("Quiz1");
            String poll = request.getParameter("Poll1");
            int profileId = Integer.parseInt(request.getParameter("defaultProfile"));

            String profileList1[] = request.getParameterValues("profileList1");
            String profileIdList = "";
            for (int i = 0; i < profileList1.length; i++) {
                profileIdList += profileList1[i] + ":";
            }
            profileIdList = profileIdList.substring(0, profileIdList.length() - 1);
            AngleUtility angle = new AngleUtility();
            Profile p = null;
            p = angle.getGroupOwner();
            String featureList = notes + ":" + assignment + ":" + videoChat + ":" + quiz + ":" + poll;
            System.out.println(featureList);
            g.setCreatedBy(person.getLoginId());
             angle.insertSubgroup(g,  p, featureList, profileId, profileIdList,tempGid);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return Utility.ERROR;
        }
    }
}
