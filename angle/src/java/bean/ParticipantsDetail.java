package bean;

/**
 *
 * @author apurv and Rohit
 */
public class ParticipantsDetail {
    String Jid;
    String email;
    String NickName;
    private int    groupId;
    String TimeDifference;
    String Topic;
    String Message;
    private int cid;

    public String getMessage() {
        return Message;
    }

    public void setMessage(String Message) {
        this.Message = Message;
    }

    public String getJid() {
        return Jid;
    }

    public void setJid(String Jid) {
        this.Jid = Jid;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNickName() {
        return NickName;
    }

    public void setNickName(String NickName) {
        this.NickName = NickName;
    }

   
    public String getTimeDifference() {
        return TimeDifference;
    }

    public void setTimeDifference(String TimeDifference) {
        this.TimeDifference = TimeDifference;
    }

    public String getTopic() {
        return Topic;
    }

    public void setTopic(String Topic) {
        this.Topic = Topic;
    }

    public int getGroupId() {
        return groupId;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }
}
