/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package survey;

import bean.Content;
import bean.Person;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import bean.WorkshopContent;
import utilities.DBConnection;
import utilities.SimpleStringCipher;

/**
 *
 * @author abinaya
 */
public class SurveyUtility {
    // all utilities are defined here .. db insertions/updates

    private Connection con;
    private PreparedStatement pstmt, pstmt1, pstmt2, pstmt3;
    private ResultSet res, res1, res2, res3;
    SimpleStringCipher cipher = new SimpleStringCipher();

    /**
     *
     * @return
     */
    public ArrayList<SurveyIndexBean> listSurvey() {
        ArrayList<SurveyIndexBean> survey_list = new ArrayList<SurveyIndexBean>();
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select * from survey_index");
                res = pstmt.executeQuery();
                SurveyIndexBean list = null;
                while (res.next()) {
                    list = new SurveyIndexBean();
                    list.setSurvey_id(res.getInt("survey_id"));
                    list.setSurvey_name(res.getString("survey_name"));
                    list.setPurpose(res.getString("survey_purpose"));
                    survey_list.add(list);
                }
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return survey_list;
    }

    public SurveyAnswersBean listSurveyQuestions(String survey_id) {
        SurveyAnswersBean survey_question_list = null;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select survey_id,survey_name,survey_purpose, DATE_FORMAT( start_date, ' %M %D, %Y' ) AS start_date, DATE_FORMAT( end_date, ' %M %D, %Y' ) AS end_date from survey_index where survey_id= ? ");
                pstmt.setString(1, survey_id);
                res = pstmt.executeQuery();
                while (res.next()) {
                    survey_question_list = new SurveyAnswersBean();
                    SurveyIndexBean si = new SurveyIndexBean();
                    si.setSurvey_id(res.getInt("survey_id"));
                    si.setSurvey_name(res.getString("survey_name"));
                    si.setPurpose(res.getString("survey_purpose"));
                    si.setStart_date(res.getString("start_date"));
                    si.setEnd_date(res.getString("end_date"));

                    pstmt = con.prepareStatement("select * from survey_question_index where survey_id= ? order by sequence");
                    pstmt.setString(1, survey_id);
                    res = pstmt.executeQuery();
                    ArrayList<SurveyQuestionIndexBean> all_questions = new ArrayList<SurveyQuestionIndexBean>();
                    while (res.next()) {
                        SurveyQuestionIndexBean qi = new SurveyQuestionIndexBean();
                        qi.setQuestion_id(res.getInt("question_id"));
                        SurveyQuestionTypesBean qt = new SurveyQuestionTypesBean();
                        qt.setQuestion_type_id(res.getInt("question_type"));
                        qi.setQuestion_type(qt);
                        qi.setQuestion_description(res.getString("question_description"));
                        qi.setRequired(res.getInt("required"));
                        qi.setAlignment_type(res.getInt("alignment_type")); // 0 - horizontal, 1- vertical
                        if (res.getInt("question_type") == 5) {
                            qi.setLowerLimit(res.getInt("lower_limit"));
                            qi.setUpperLimit(res.getInt("upper_limit"));
                            qi.setStep_size(res.getInt("step_size"));
                        }

                        if (res.getInt("question_type") == 6) {
                            pstmt1 = con.prepareStatement("select * from survey_question_index_rows where question_id=? order by sequence");
                            pstmt1.setInt(1, res.getInt("question_id"));
                            res1 = pstmt1.executeQuery();
                            ArrayList<SurveyOptionsOfQuestionsBean> row_values = new ArrayList<SurveyOptionsOfQuestionsBean>();
                            while (res1.next()) {

                                SurveyOptionsOfQuestionsBean row = new SurveyOptionsOfQuestionsBean();
                                row.setOption(res1.getString("row_description"));
                                row.setRow_id(res1.getInt("id"));
                                row_values.add(row);
                            }
                            qi.setRow_values(row_values);
                        }

                        ArrayList<SurveyOptionsOfQuestionsBean> options = new ArrayList<SurveyOptionsOfQuestionsBean>();
                        pstmt1 = con.prepareStatement("select * from survey_options_of_questions where question_id=? order by sequence_of_option");
                        pstmt1.setInt(1, res.getInt("question_id"));
                        res1 = pstmt1.executeQuery();
                        while (res1.next()) {
                            SurveyOptionsOfQuestionsBean op_q = new SurveyOptionsOfQuestionsBean();
                            op_q.setOption(res1.getString("option"));
                            op_q.setValue_of_option(res1.getInt("value_of_option"));
                            options.add(op_q);
                        }
                        qi.setOptions(options);
                        all_questions.add(qi);
                    }

                    survey_question_list.setSurvey_index(si);
                    survey_question_list.setAll_questions(all_questions);
                }
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res1);
            DBConnection.closePStatement(pstmt1);
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return survey_question_list;
    }

    public int getNextSurveyId() {
        int result = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select max(survey_id) as survey_id from survey_index");
                res = pstmt.executeQuery();
                while (res.next()) {
                    result = res.getInt("survey_id");
                }
                if (result > 0) {
                    result = result + 1;
                } else if (result == 0) {
                    result = 1;
                } else {
                    //result = 1;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return result;
    }

    public ArrayList<SurveyQuestionTypesBean> listQuestionTypes() {
        ArrayList<SurveyQuestionTypesBean> surveyQuestion_list = new ArrayList<SurveyQuestionTypesBean>();
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select question_type_id,question_type from survey_question_types");
                res = pstmt.executeQuery();
                SurveyQuestionTypesBean list = null;
                while (res.next()) {
                    list = new SurveyQuestionTypesBean();
                    list.setQuestion_type_id(res.getInt("question_type_id"));
                    list.setQuestion_type(res.getString("question_type"));
                    surveyQuestion_list.add(list);
                }
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return surveyQuestion_list;
    }

    public int insertSurveyDetails(int surveyid, String stitle, String spurpose, String start_date, String end_date) {
        int result = 0, checkIfExist = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select survey_id from survey_index where survey_id=?");
                pstmt.setInt(1, surveyid);
                res = pstmt.executeQuery();
                while (res.next()) {
                    checkIfExist = res.getInt("survey_id");
                }
                if (checkIfExist > 0) {
                    // update here.
                    pstmt = con.prepareStatement("update survey_index set survey_name=?,survey_purpose=?, start_date=?, end_date=? where survey_id=?");
                    pstmt.setString(1, stitle);
                    pstmt.setString(2, spurpose);
                    pstmt.setString(3, start_date);
                    pstmt.setString(4, end_date);
                    pstmt.setInt(5, surveyid);
                    result = pstmt.executeUpdate();

                } else if (checkIfExist == 0) {
                    // insert here
                    pstmt = con.prepareStatement("insert into survey_index values(?,?,?,?,?)");
                    pstmt.setInt(1, surveyid);
                    pstmt.setString(2, stitle);
                    pstmt.setString(3, spurpose);
                    pstmt.setString(4, start_date);
                    pstmt.setString(5, end_date);
                    result = pstmt.executeUpdate();
                    //result = 1;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return result;
    }

    public int insertSurveyQuestionsDetails(int surveyid, int dynamicid, String question, int qtypeid, int seq, int reqflag) {
        int result = 0, quesid = 0, result1 = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                // insert here.
                pstmt = con.prepareStatement("insert into survey_question_index(survey_id,question_type,question_description,sequence,required) values(?,?,?,?,?)");
                pstmt.setInt(1, surveyid);
                pstmt.setInt(2, qtypeid);
                pstmt.setString(3, question);
                pstmt.setInt(4, seq);
                pstmt.setInt(5, reqflag);
                result = pstmt.executeUpdate();
                if (result > 0) {
                    pstmt = con.prepareStatement("select question_id from survey_question_index where question_description=? and sequence=?");
                    pstmt.setString(1, question);
                    pstmt.setInt(2, seq);
                    res = pstmt.executeQuery();
                    while (res.next()) {
                        quesid = res.getInt("question_id");
                    }

                    if (quesid > 0) {
                        // insert question options here
                        if (qtypeid == 1 || qtypeid == 2 || qtypeid == 7 || qtypeid == 8) {
                            pstmt = con.prepareStatement("insert into survey_options_of_questions(question_id,`option`,value_of_option,sequence_of_option) values(?,?,?,?)");
                            pstmt.setInt(1, quesid);
                            pstmt.setString(2, "");
                            pstmt.setInt(3, 1);
                            pstmt.setInt(4, 1);
                            result1 = pstmt.executeUpdate();
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return quesid;
    }

    public int insertSurveyQuestionsTypeDetails(int surveyid, int dynamicid, String question, int qtypeid, int seq, String optionsarr, int reqflag, int typeOfoption, int typeOfGraph) {
        int result = 0, quesid = 0, result1 = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                /*
                 * pstmt = con.prepareStatement("select survey_id from
                 * survey_index where survey_id=?"); pstmt.setInt(1, surveyid);
                 * res = pstmt.executeQuery(); while (res.next()) { checkIfExist
                 * = res.getInt("survey_id"); }
                 */

                // insert here.
                pstmt = con.prepareStatement("insert into survey_question_index(survey_id,question_type,question_description,sequence,required,alignment_type, graph_type) values(?,?,?,?,?,?,?)");
                pstmt.setInt(1, surveyid);
                pstmt.setInt(2, qtypeid);
                pstmt.setString(3, question);
                pstmt.setInt(4, seq);
                pstmt.setInt(5, reqflag);
                pstmt.setInt(6, typeOfoption);
                pstmt.setInt(7, typeOfGraph);
                result = pstmt.executeUpdate();
                if (result > 0) {
                    pstmt = con.prepareStatement("select question_id from survey_question_index where question_description=? and sequence=?");
                    pstmt.setString(1, question);
                    pstmt.setInt(2, seq);
                    res = pstmt.executeQuery();
                    while (res.next()) {
                        quesid = res.getInt("question_id");
                    }

                    if (quesid > 0) {
                        // insert question options here
                        if (qtypeid == 3 || qtypeid == 4) {
                            String[] parts = optionsarr.split(",");
                            for (int i = 0; i < parts.length; i++) {
                                pstmt = con.prepareStatement("insert into survey_options_of_questions(question_id,`option`,value_of_option,sequence_of_option) values(?,?,?,?)");
                                pstmt.setInt(1, quesid);
                                pstmt.setString(2, parts[i]);
                                int seqOpt = i + 1;
                                pstmt.setInt(3, seqOpt);
                                pstmt.setInt(4, seqOpt);
                                result1 = pstmt.executeUpdate();
                            }
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return quesid;
    }

    public int deleteSurveyQuestionsDetails(int questionid, int surveyid, int questiontype) {
        int result = 0, result2 = 0, result3 = 0, result4 = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                if (questiontype == 6) {
                    pstmt = con.prepareStatement("delete from survey_question_index_rows where question_id=?");
                    pstmt.setInt(1, questionid);
                    result4 = pstmt.executeUpdate();
                }
                pstmt = con.prepareStatement("delete from survey_options_of_questions where question_id=?");
                pstmt.setInt(1, questionid);
                result = pstmt.executeUpdate();
                if (result > 0) {
                    pstmt = con.prepareStatement("delete from survey_question_index where question_id=?");
                    pstmt.setInt(1, questionid);
                    result2 = pstmt.executeUpdate();
                } else if (result == 0 && questionid > 0) {
                    pstmt = con.prepareStatement("delete from survey_question_index where question_id=?");
                    pstmt.setInt(1, questionid);
                    result2 = pstmt.executeUpdate();
                }
                if (result > 0 && result2 > 0) {
                    result3 = 1;
                } else if (result == 0 && result2 > 0) {
                    result3 = 1;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return result3;
    }

    public int updateSurveyDetails(int surveyid, String stitle, String spurpose, String start_date, String end_date) {
        int result = 0, checkIfExist = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select survey_id from survey_index where survey_id=?");
                pstmt.setInt(1, surveyid);
                res = pstmt.executeQuery();
                while (res.next()) {
                    checkIfExist = res.getInt("survey_id");
                }
                if (checkIfExist > 0) {
                    // update here.
                    pstmt = con.prepareStatement("update survey_index set survey_name=?,survey_purpose=?, start_date=?, end_date=? where survey_id=?");
                    pstmt.setString(1, stitle);
                    pstmt.setString(2, spurpose);
                    pstmt.setString(3, start_date);
                    pstmt.setString(4, end_date);
                    pstmt.setInt(5, surveyid);
                    result = pstmt.executeUpdate();

                } else if (checkIfExist == 0) {
                    // no insertion happen in update method
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return result;
    }

    public int updateSurveyQuestionsDetails(int surveyid, int dynamicid, String question, int qtypeid, int seq, int qid, int reqflag) {
        int result = 0, quesid = 0, result1 = 0, result2 = 0, updateRes = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                // insert here.
                pstmt = con.prepareStatement("update survey_question_index set question_type=?,question_description=?,sequence=?,required=? where question_id=?");
                pstmt.setInt(1, qtypeid);
                pstmt.setString(2, question);
                pstmt.setInt(3, seq);
                pstmt.setInt(4, reqflag);
                pstmt.setInt(5, qid);
                result = pstmt.executeUpdate();
                if (result > 0) {
                    pstmt1 = con.prepareStatement("delete from survey_options_of_questions where question_id=?");
                    pstmt1.setInt(1, qid);
                    result1 = pstmt1.executeUpdate();

                    if (result1 > 0) {
                        // insert question options here
                        if (qtypeid == 1 || qtypeid == 2 || qtypeid == 7 || qtypeid == 8) {
                            pstmt = con.prepareStatement("insert into survey_options_of_questions(question_id,`option`,value_of_option,sequence_of_option) values(?,?,?,?)");
                            pstmt.setInt(1, qid);
                            pstmt.setString(2, "");
                            pstmt.setInt(3, 1);
                            pstmt.setInt(4, 1);
                            result2 = pstmt.executeUpdate();
                        }
                    }
                }
                if (result > 0 && result1 > 0 && result2 > 0) {
                    updateRes = 1;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closePStatement(pstmt1);
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return updateRes;
    }

    public int updateSurveyQuestionsTypeDetails(int surveyid, int dynamicid, String question, int qtypeid, int seq, String optionsarr, int qid, int reqflag, int typeOfoption, int typeOfGraph) {
        int result = 0, quesid = 0, result1 = 0, result2 = 0, updateRes = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                // insert here.
                pstmt = con.prepareStatement("update survey_question_index set question_type=?,question_description=?,sequence=?,required=?,alignment_type=?,graph_type=? where question_id=?");
                pstmt.setInt(1, qtypeid);
                pstmt.setString(2, question);
                pstmt.setInt(3, seq);
                pstmt.setInt(4, reqflag);
                pstmt.setInt(5, typeOfoption);
                pstmt.setInt(6, typeOfGraph);
                pstmt.setInt(7, qid);
                result = pstmt.executeUpdate();

                if (result > 0) {
                    pstmt1 = con.prepareStatement("delete from survey_options_of_questions where question_id=?");
                    pstmt1.setInt(1, qid);
                    result1 = pstmt1.executeUpdate();

                    if (result1 > 0) {
                        // insert question options here
                        if (qtypeid == 3 || qtypeid == 4) {
                            String[] parts = optionsarr.split(",");
                            for (int i = 0; i < parts.length; i++) {
                                pstmt = con.prepareStatement("insert into survey_options_of_questions(question_id,`option`,value_of_option,sequence_of_option) values(?,?,?,?)");
                                pstmt.setInt(1, qid);
                                pstmt.setString(2, parts[i]);
                                int seqOpt = i + 1;
                                pstmt.setInt(3, seqOpt);
                                pstmt.setInt(4, seqOpt);
                                result2 = pstmt.executeUpdate();
                            }
                        }
                    } else if (result1 == 0) {
                        int countOptions = 1;
                        pstmt1 = con.prepareStatement("select count(*) as total_options from survey_options_of_questions where question_id=?");
                        pstmt1.setInt(1, qid);
                        res = pstmt1.executeQuery();
                        while (res.next()) {
                            countOptions = res.getInt("total_options");
                        }

                        if (countOptions == 0) {
                            // insert the values here
                            if (qtypeid == 3 || qtypeid == 4) {
                                String[] parts = optionsarr.split(",");
                                for (int i = 0; i < parts.length; i++) {
                                    pstmt = con.prepareStatement("insert into survey_options_of_questions(question_id,`option`,value_of_option,sequence_of_option) values(?,?,?,?)");
                                    pstmt.setInt(1, qid);
                                    pstmt.setString(2, parts[i]);
                                    int seqOpt = i + 1;
                                    pstmt.setInt(3, seqOpt);
                                    pstmt.setInt(4, seqOpt);
                                    result2 = pstmt.executeUpdate();
                                }
                            }
                        }
                    }
                }
                if (result > 0 && result1 > 0 && result2 > 0) {
                    updateRes = 1;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closePStatement(pstmt1);
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return updateRes;
    }

    public int saveAnswers(SurveyAnswersBean saving_ans) {
        int var = 1;
        for (int j = 0; j < saving_ans.getAll_questions().size(); j++) {

            int question_type = saving_ans.getAll_questions().get(j).getQuestion_type().getQuestion_type_id();
            try {
                if (con == null || con.isClosed()) {
                    con = DBConnection.getDBConnection();
                }
                if (con != null) {
                    if (question_type == 6) {
                        int no_of_rows = saving_ans.getAll_questions().get(j).getRow_values().size();
                        for (int z = 0; z < no_of_rows; z++) {
                            int row_id = saving_ans.getAll_questions().get(j).getRow_values().get(z).getRow_id();
                            String row_ans = saving_ans.getAll_questions().get(j).getRow_values().get(z).getRow_ans();

                            pstmt = con.prepareStatement("insert into survey_answers values(?,?,?,?,?)");
                            pstmt.setInt(1, saving_ans.getAll_questions().get(j).getQuestion_id());
                            pstmt.setString(2, row_ans);
                            pstmt.setInt(3, saving_ans.getPersonid());
                            pstmt.setInt(4, saving_ans.getSurvey_index().getSurvey_id());
                            pstmt.setInt(5, row_id);
                            var += pstmt.executeUpdate();
                        }
                    } else {
                        pstmt = con.prepareStatement("insert into survey_answers values(?,?,?,?,?)");
                        pstmt.setInt(1, saving_ans.getAll_questions().get(j).getQuestion_id());
                        pstmt.setString(2, saving_ans.getAll_questions().get(j).getAnswers());
                        pstmt.setInt(3, saving_ans.getPersonid());
                        pstmt.setInt(4, saving_ans.getSurvey_index().getSurvey_id());
                        pstmt.setString(5, null);
                        var += pstmt.executeUpdate();
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                DBConnection.closeResultSet(res);
                DBConnection.closePStatement(pstmt);
                DBConnection.closeDBConnection(con);
            }
        }
        return var;
    }

    public int checkIfPersonFilledSurvey(String sid, String pid) {
        int result = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select count(*) as count from survey_answers  where personid=? and survey_id=?");
                pstmt.setString(1, pid);
                pstmt.setString(2, sid);
                res = pstmt.executeQuery();
                while (res.next()) {
                    result = res.getInt("count");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return result;
    }

    public ArrayList<SurveyIndexBean> listSurveyData(String dbname) throws Exception {
        ArrayList<SurveyIndexBean> surveylist = new ArrayList<SurveyIndexBean>();
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection(dbname);
            }
            if (con != null) {
                pstmt = con.prepareStatement("select survey_id,survey_name,survey_purpose from survey_index");
                res = pstmt.executeQuery();
                SurveyIndexBean list = null;
                while (res.next()) {
                    list = new SurveyIndexBean();
                    list.setSurvey_id(res.getInt("survey_id"));
                    list.setSurvey_name(res.getString("survey_name"));
                    list.setPurpose(res.getString("survey_purpose"));
                    SimpleStringCipher cipher = new SimpleStringCipher();
                    String toencript = res.getString("survey_id");
                    toencript = cipher.encrypt(toencript);
                    list.setEnc_survey_id(toencript);
                    surveylist.add(list);
                }
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return surveylist;
    }

    public SurveyIndexBean getSurveyDetails(int surveyid) {
        SurveyIndexBean sbean = new SurveyIndexBean();
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select survey_id,survey_name,survey_purpose, DATE_FORMAT( start_date, '%d-%m-%Y' ) AS start_date,  DATE_FORMAT( end_date, '%d-%m-%Y' ) AS end_date,success_title,error_title,success_content,error_content from survey_index where survey_id=?");
                pstmt.setInt(1, surveyid);
                res = pstmt.executeQuery();
                while (res.next()) {
                    sbean.setSurvey_id(res.getInt("survey_id"));
                    sbean.setSurvey_name(res.getString("survey_name"));
                    sbean.setPurpose(res.getString("survey_purpose"));
                    sbean.setStart_date(res.getString("start_date"));
                    sbean.setEnd_date(res.getString("end_date"));
                    sbean.setSuccessTitle(res.getString("success_title"));
                    sbean.setErrorTitle(res.getString("error_title"));
                    sbean.setSuccessContent(res.getString("success_content"));
                    sbean.setErrorContent(res.getString("error_content"));
                }
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return sbean;
    }

    public ArrayList<SurveyQuestionIndexBean> listQuestionDetails(int survey_id) {
        ArrayList<SurveyQuestionIndexBean> questionlist = new ArrayList<SurveyQuestionIndexBean>();
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select * from survey_question_index where survey_id=?");
                pstmt.setInt(1, survey_id);
                res = pstmt.executeQuery();
                SurveyQuestionIndexBean list = null;
                while (res.next()) {
                    list = new SurveyQuestionIndexBean();
                    list.setQuestion_id(res.getInt("question_id"));
                    list.setQuestion_description(res.getString("question_description"));
                    SurveyQuestionTypesBean typebean = new SurveyQuestionTypesBean();
                    typebean.setQuestion_type_id(res.getInt("question_type"));

                    if (typebean.getQuestion_type_id() == 3 || typebean.getQuestion_type_id() == 4) {
                        pstmt1 = con.prepareStatement("select `option` as quesoption from survey_options_of_questions where question_id=? order by sequence_of_option");
                        pstmt1.setInt(1, list.getQuestion_id());
                        res1 = pstmt1.executeQuery();
                        ArrayList<SurveyOptionsOfQuestionsBean> arrayList = new ArrayList<SurveyOptionsOfQuestionsBean>();;
                        SurveyOptionsOfQuestionsBean options = null;
                        while (res1.next()) {
                            options = new SurveyOptionsOfQuestionsBean();
                            String res_otions = res1.getString("quesoption");
                            options.setOption(res_otions);

                            arrayList.add(options);
                        }
                        list.setOptions(arrayList);
                    }

                    if (typebean.getQuestion_type_id() == 5) {
                        list.setLowerLimit(res.getInt("lower_limit"));
                        list.setUpperLimit(res.getInt("upper_limit"));
                        list.setStep_size(res.getInt("step_size"));
                    }
                    if (typebean.getQuestion_type_id() == 6) {
                        pstmt1 = con.prepareStatement("select `option` as quesoption from survey_options_of_questions where question_id=? order by sequence_of_option");
                        pstmt1.setInt(1, list.getQuestion_id());
                        res1 = pstmt1.executeQuery();
                        ArrayList<SurveyOptionsOfQuestionsBean> arrayList = new ArrayList<SurveyOptionsOfQuestionsBean>();;
                        SurveyOptionsOfQuestionsBean options = null;
                        while (res1.next()) {
                            options = new SurveyOptionsOfQuestionsBean();
                            String res_otions = res1.getString("quesoption");
                            options.setOption(res_otions);

                            arrayList.add(options);
                        }
                        list.setOptions(arrayList);

                        pstmt2 = con.prepareStatement("select row_description as quesoption from survey_question_index_rows where question_id=? order by sequence");
                        pstmt2.setInt(1, list.getQuestion_id());
                        res2 = pstmt2.executeQuery();
                        ArrayList<SurveyOptionsOfQuestionsBean> arrayList1 = new ArrayList<SurveyOptionsOfQuestionsBean>();;
                        SurveyOptionsOfQuestionsBean rowOptions = null;
                        while (res2.next()) {
                            rowOptions = new SurveyOptionsOfQuestionsBean();
                            String res_otions = res2.getString("quesoption");
                            rowOptions.setOption(res_otions);
                            arrayList1.add(rowOptions);
                        }
                        list.setRowOptions(arrayList1);
                    }

                    list.setQuestion_type(typebean);
                    list.setSequence_var(res.getInt("sequence"));
                    list.setRequired(res.getInt("required"));
                    list.setAlignment_type(res.getInt("alignment_type"));
                    list.setGraph_type(res.getInt("graph_type"));
                    questionlist.add(list);
                }
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closePStatement(pstmt1);
            DBConnection.closeDBConnection(con);
        }
        return questionlist;
    }

    public String generateLinksForTestingSurvey(String survey_id, String url, String email) {
        String result = "";
        int temp_id = 0, temp_new_id = 0;
        cipher = new SimpleStringCipher();
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select id from survey_log where email=? and survey_id=? and bulk_mail_template_id=1");
                pstmt.setString(1, email);
                pstmt.setString(2, survey_id);
                res = pstmt.executeQuery();
                while (res.next()) {
                    temp_id = res.getInt("id");
                }

                if (temp_id == 0) {
                    // insert here
                    pstmt1 = con.prepareStatement("insert into survey_log(survey_id,bulk_mail_template_id,email,if_filled_survey) values(?,?,?,?)");
                    pstmt1.setString(1, survey_id);
                    pstmt1.setInt(2, 1);
                    pstmt1.setString(3, email);
                    pstmt1.setInt(4, 0);
                    pstmt1.executeUpdate();

                    pstmt = con.prepareStatement("select id from survey_log where email=? and survey_id=?");
                    pstmt.setString(1, email);
                    pstmt.setString(2, survey_id);
                    res = pstmt.executeQuery();
                    while (res.next()) {
                        temp_new_id = res.getInt("id");
                    }
                    String sid = cipher.encrypt(survey_id);
                    String pid = cipher.encrypt(String.valueOf(temp_new_id));
                    result = "\n <a class='alink' target=\"_blank\" href=\"" + url + sid + "&pid=" + pid + "\"> " + email + "</a>" + " </br>";
                } else if (temp_id > 0) {
                    // already exist create link only
                    String sid = cipher.encrypt(survey_id);
                    String pid = cipher.encrypt(String.valueOf(temp_id));
                    result = "\n <a class='alink' target=\"_blank\" href=\"" + url + sid + "&pid=" + pid + "\"> " + email + "</a>" + " </br>";
                }

                /*
                 * pstmt = con.prepareStatement("select * from login where
                 * loginstatus = 1"); res = pstmt.executeQuery();
                 *
                 * String sid = cipher.encrypt(survey_id); int i = 0; while
                 * (res.next()) { i++; String pid =
                 * cipher.encrypt(res.getString("login_id")); result = result +
                 * "\n <a target=\"_blank\" href=\"" + url + sid + "&pid=" + pid
                 * + "\"> link " + i + "</a>" + " </br>";
                 *
                 * }
                 */
                // System.out.println(result);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res1);
            DBConnection.closePStatement(pstmt1);
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return result;
    }

    public SurveyAnswersBean surveyReport(String survey_id) {
        SurveyAnswersBean survey_question_list = null;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select * from survey_index where survey_id= ? ");
                pstmt.setString(1, survey_id);
                res = pstmt.executeQuery();
                while (res.next()) {
                    survey_question_list = new SurveyAnswersBean();
                    SurveyIndexBean si = new SurveyIndexBean();
                    si.setSurvey_id(res.getInt("survey_id"));
                    si.setSurvey_name(res.getString("survey_name"));
                    si.setPurpose(res.getString("survey_purpose"));

                    pstmt = con.prepareStatement("select count(distinct(personid)) as count from survey_answers where survey_id=?");
                    pstmt.setString(1, survey_id);
                    res = pstmt.executeQuery();
                    while (res.next()) {
                        si.setNumber_of_responses(res.getInt("count"));
                    }
                    pstmt = con.prepareStatement("select * from survey_question_index where survey_id= ? order by sequence");
                    pstmt.setString(1, survey_id);
                    res = pstmt.executeQuery();
                    ArrayList<SurveyQuestionIndexBean> all_questions = new ArrayList<SurveyQuestionIndexBean>();
                    while (res.next()) {
                        SurveyQuestionIndexBean qi = new SurveyQuestionIndexBean();
                        qi.setQuestion_id(res.getInt("question_id"));
                        SurveyQuestionTypesBean qt = new SurveyQuestionTypesBean();
                        qt.setQuestion_type_id(res.getInt("question_type"));
                        qi.setQuestion_type(qt);
                        qi.setQuestion_description(res.getString("question_description"));
                        qi.setRequired(res.getInt("required"));
                        qi.setGraph_type(res.getInt("graph_type"));

                        if (res.getInt("question_type") == 1 || res.getInt("question_type") == 2 || res.getInt("question_type") == 7 || res.getInt("question_type") == 8) {
                            pstmt1 = con.prepareStatement("select `option` from survey_answers where survey_id=? and question_id=?");
                            pstmt1.setString(1, survey_id);
                            pstmt1.setInt(2, res.getInt("question_id"));
                            res1 = pstmt1.executeQuery();
                            ArrayList<String> ans_text = new ArrayList<String>();
                            String ans = null;
                            while (res1.next()) {
                                ans = res1.getString("option");
                                if (ans != "" || !ans.trim().equals("")) {
                                    ans_text.add(ans);
                                }
                            }
                            qi.setAns_text(ans_text);
                        }
                        if (res.getInt("question_type") == 3 || res.getInt("question_type") == 4) {

                            ArrayList<SurveyOptionsOfQuestionsBean> options = new ArrayList<SurveyOptionsOfQuestionsBean>();
                            pstmt1 = con.prepareStatement("select * from survey_options_of_questions where question_id=? order by sequence_of_option");
                            pstmt1.setInt(1, res.getInt("question_id"));
                            res1 = pstmt1.executeQuery();

                            String a = "";

                            while (res1.next()) {
                                SurveyOptionsOfQuestionsBean op_q = new SurveyOptionsOfQuestionsBean();
                                op_q.setOption(res1.getString("option"));
                                op_q.setValue_of_option(res1.getInt("value_of_option"));
                                int count_of_option = 0;
                                if (res.getInt("question_type") == 3) {
                                    pstmt2 = con.prepareStatement("select count(*) as count from survey_answers where  survey_id=? and question_id=? and `option`=? ");
                                    pstmt2.setString(1, survey_id);
                                    pstmt2.setInt(2, res.getInt("question_id"));
                                    pstmt2.setInt(3, res1.getInt("value_of_option"));
//                                    System.out.println(pstmt2);
                                    res2 = pstmt2.executeQuery();
                                    while (res2.next()) {
                                        count_of_option = res2.getInt("count");
                                    }
                                }
                                if (res.getInt("question_type") == 4) {
                                    pstmt2 = con.prepareStatement("select count(*) as count from survey_answers where  survey_id=? and question_id=? and (`option` like '%" + res1.getInt("value_of_option") + "' OR `option` like '%" + res1.getInt("value_of_option") + ",%') ");
                                    //select * from survey_answers where `option` REGEXP '^1';
                                    pstmt2.setString(1, survey_id);
                                    pstmt2.setInt(2, res.getInt("question_id"));
                                    //pstmt2.setInt(3, res1.getInt("value_of_option"));
                                    //System.out.println(pstmt2);
                                    res2 = pstmt2.executeQuery();
                                    while (res2.next()) {
                                        count_of_option = res2.getInt("count");
                                    }
                                }

                                op_q.setCount_of_option(count_of_option);
                                options.add(op_q);
                                a = a + "['" + res1.getString("option") + "'," + count_of_option + "]";
                                a = a + ",";
                            }

                            //System.out.println(a);
                            qi.setOption_array(a);
                            qi.setOptions(options);
                        }
                        if (res.getInt("question_type") == 5) {
                            qi.setLowerLimit(res.getInt("lower_limit"));
                            qi.setUpperLimit(res.getInt("upper_limit"));
                            qi.setStep_size(res.getInt("step_size"));
                            int start = qi.getLowerLimit();
                            ArrayList<SurveyOptionsOfQuestionsBean> options = new ArrayList<SurveyOptionsOfQuestionsBean>();
                            String a = "";

                            for (int k = 0; start <= qi.getUpperLimit(); k++) {
                                SurveyOptionsOfQuestionsBean op_q = new SurveyOptionsOfQuestionsBean();

                                int count_of_option = 0;
                                op_q.setOption(Integer.toString(start));
                                op_q.setValue_of_option(start);

                                pstmt2 = con.prepareStatement("select count(*) as count from survey_answers where  survey_id=? and question_id=? and `option`=? ");
                                pstmt2.setString(1, survey_id);
                                pstmt2.setInt(2, res.getInt("question_id"));
                                pstmt2.setInt(3, start);
//                                    System.out.println(pstmt2);
                                res2 = pstmt2.executeQuery();
                                while (res2.next()) {
                                    count_of_option = res2.getInt("count");
                                }

                                op_q.setCount_of_option(count_of_option);
                                options.add(op_q);
                                a = a + "['" + start + "'," + count_of_option + "]";
                                a = a + ",";

                                start = start + res.getInt("step_size");
                            }
                            qi.setOption_array(a);
                            qi.setOptions(options);

                        }

                        if (res.getInt("question_type") == 6) {

                            pstmt3 = con.prepareStatement("select * from survey_question_index_rows where question_id=? order by sequence");
                            pstmt3.setInt(1, res.getInt("question_id"));
                            res3 = pstmt3.executeQuery();
                            String a = "Option";
                            String b = "";
                            String c = "";

                            String row_ids = "";
                            while (res3.next()) {

                                int row_id = res3.getInt("id");
                                String row_description = res3.getString("row_description");
                                row_ids = row_ids + row_id + ",";

                                a = a + "," + row_description;
                            }

                            ArrayList<SurveyOptionsOfQuestionsBean> options = new ArrayList<SurveyOptionsOfQuestionsBean>();
                            pstmt1 = con.prepareStatement("select * from survey_options_of_questions where question_id=? order by sequence_of_option");
                            pstmt1.setInt(1, res.getInt("question_id"));
                            res1 = pstmt1.executeQuery();

                            while (res1.next()) {

                                SurveyOptionsOfQuestionsBean op_q = new SurveyOptionsOfQuestionsBean();
                                op_q.setOption(res1.getString("option"));
                                op_q.setValue_of_option(res1.getInt("value_of_option"));
                                int count_of_option = 0;

                                b = res1.getString("option");

                                String[] row_ids_array = row_ids.split(",");
                                for (int k = 0; k < row_ids_array.length; k++) {
                                    pstmt2 = con.prepareStatement("select count(*) as count from survey_answers where  survey_id=? and question_id=? and `option`=? and row_id=? ");
                                    pstmt2.setString(1, survey_id);
                                    pstmt2.setInt(2, res.getInt("question_id"));
                                    pstmt2.setInt(3, res1.getInt("value_of_option"));
                                    pstmt2.setString(4, row_ids_array[k]);
                                    res2 = pstmt2.executeQuery();
                                    while (res2.next()) {
                                        count_of_option = res2.getInt("count");
                                    }
                                    b = b + "," + count_of_option;
                                }

                                op_q.setCount_of_option(count_of_option);
                                options.add(op_q);
                                c = c + b + ";";

                            }

                            //required in below format.. array to parse in data table.
                            //[option, row_description_1, row_description_2, .. row_description_n]
                            qi.setOptions(options);
                            c = a + ";" + c;
                            System.out.println(c);
                            qi.setOption_array(c);
                        }

                        all_questions.add(qi);
                    }
                    survey_question_list.setSurvey_index(si);
                    survey_question_list.setAll_questions(all_questions);
                }
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        } finally {

            DBConnection.closeResultSet(res2);
            DBConnection.closePStatement(pstmt2);
            DBConnection.closeResultSet(res1);
            DBConnection.closePStatement(pstmt1);
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeResultSet(res3);
            DBConnection.closePStatement(pstmt3);
            DBConnection.closeDBConnection(con);
        }
        return survey_question_list;
    }

    public String saveSurveyDetails(int surveyid, String stitle, String spurpose, String start_date, String end_date,String successtitle,String errortitle, String sMsg,String eMsg) {
        int result = 0, sid = 0, sid2 = 0, sid1 = 0;
        String res1 = "";
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select survey_id from survey_index where survey_id=?");
                pstmt.setInt(1, surveyid);
                res = pstmt.executeQuery();
                while (res.next()) {
                    sid = res.getInt("survey_id");
                }
                if (sid == 0) {
                    // not exist 
                    pstmt = con.prepareStatement("select max(survey_id) as survey_id from survey_index");
                    res = pstmt.executeQuery();
                    while (res.next()) {
                        sid1 = res.getInt("survey_id");
                    }
                    if (sid1 > 0) {
                        sid1++;
                        pstmt1 = con.prepareStatement("insert into survey_index values(?,?,?,?,?,?,?,?,?)");
                        pstmt1.setInt(1, sid1);
                        pstmt1.setString(2, stitle);
                        pstmt1.setString(3, spurpose);
                        pstmt1.setString(4, start_date);
                        pstmt1.setString(5, end_date);
                        pstmt1.setString(6, successtitle);
                        pstmt1.setString(7, sMsg);
                        pstmt1.setString(8, errortitle);
                        pstmt1.setString(9, eMsg);

                        result = pstmt1.executeUpdate();
                        res1 = result + "#" + surveyid;
                    } else if (sid1 == 0) {
                        pstmt1 = con.prepareStatement("insert into survey_index values(?,?,?,?,?,?,?,?,?)");
                        pstmt1.setInt(1, 1);
                        pstmt1.setString(2, stitle);
                        pstmt1.setString(3, spurpose);
                        pstmt1.setString(4, start_date);
                        pstmt1.setString(5, end_date);
                        pstmt1.setString(6, successtitle);
                        pstmt1.setString(7, sMsg);
                        pstmt1.setString(8, errortitle);
                        pstmt1.setString(9, eMsg);
                        result = pstmt1.executeUpdate();
                        res1 = result + "#" + surveyid;
                    }

                } else if (sid > 0) {
                    // same id is exist then create new id
                    pstmt = con.prepareStatement("select max(survey_id) as survey_id from survey_index");
                    res = pstmt.executeQuery();
                    while (res.next()) {
                        sid2 = res.getInt("survey_id");
                    }
                    if (sid2 > 0) {
                        sid2++;
                        pstmt1 = con.prepareStatement("insert into survey_index values(?,?,?,?,?,?,?,?,?)");
                        pstmt1.setInt(1, sid2);
                        pstmt1.setString(2, stitle);
                        pstmt1.setString(3, spurpose);
                        pstmt1.setString(4, start_date);
                        pstmt1.setString(5, end_date);
                        pstmt1.setString(6, successtitle);
                        pstmt1.setString(7, sMsg);
                        pstmt1.setString(8, errortitle);
                        pstmt1.setString(9, eMsg);
                        result = pstmt1.executeUpdate();
                        res1 = result + "#" + sid2;
                    }
                }
                // pstmt.setString(2, saving_ans.getAll_questions().get(j).getAnswers());
                // pstmt.setInt(3, saving_ans.getPersonid());
                // pstmt.setInt(4, saving_ans.getSurvey_index().getSurvey_id());
                // var += pstmt.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closePStatement(pstmt1);
            DBConnection.closeDBConnection(con);
        }
        return res1;
    }

    public SurveyAnswersBean surveyReportGeneral(String survey_id) {
        SurveyAnswersBean survey_question_list = null;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select * from survey_index where survey_id= ? ");
                pstmt.setString(1, survey_id);
                res = pstmt.executeQuery();
                while (res.next()) {
                    survey_question_list = new SurveyAnswersBean();
                    SurveyIndexBean si = new SurveyIndexBean();
                    si.setSurvey_id(res.getInt("survey_id"));
                    si.setSurvey_name(res.getString("survey_name"));
                    si.setPurpose(res.getString("survey_purpose"));

                    pstmt = con.prepareStatement("select * from survey_question_index where survey_id= ? order by sequence");
                    pstmt.setString(1, survey_id);
                    res = pstmt.executeQuery();
                    ArrayList<SurveyQuestionIndexBean> all_questions = new ArrayList<SurveyQuestionIndexBean>();
                    while (res.next()) {
                        SurveyQuestionIndexBean qi = new SurveyQuestionIndexBean();
                        qi.setQuestion_id(res.getInt("question_id"));
                        SurveyQuestionTypesBean qt = new SurveyQuestionTypesBean();
                        qt.setQuestion_type_id(res.getInt("question_type"));
                        qi.setQuestion_type(qt);
                        qi.setQuestion_description(res.getString("question_description"));
                        qi.setRequired(res.getInt("required"));
                        all_questions.add(qi);
                    }

                    pstmt1 = con.prepareStatement("select distinct(sa.personid) from survey_answers sa where sa.survey_id=?");
                    pstmt1.setString(1, survey_id);
                    res1 = pstmt1.executeQuery();
                    ArrayList rdatalist = new ArrayList();
                    ArrayList<ReportBean> rplist = new ArrayList<ReportBean>();
                    while (res1.next()) {
                        ReportBean rp = new ReportBean();
                        // select all questions depending on sequence - from survey answers
                        pstmt2 = con.prepareStatement("select sa.*, si.question_type from survey_answers sa, survey_question_index si where sa.survey_id=? and sa.personid=? and sa.question_id=si.question_id order by si.sequence");
                        pstmt2.setString(1, survey_id);
                        pstmt2.setString(2, res1.getString("personid"));
                        res2 = pstmt2.executeQuery();
                        while (res2.next()) {
                            ArrayList<String> options_chosen = new ArrayList<String>();
                            if (res2.getInt("question_type") == 1 || res2.getInt("question_type") == 2) {
                                // if question type 1 or 2 set option string,
                                String ans = res2.getString("option");
                                options_chosen.add(ans);
                            }

                            if (res2.getInt("question_type") == 3) {
                                // compare int options to the option index
                                String ans = res2.getString("option");
                                options_chosen.add(ans);
                            }
                            if (res2.getInt("question_type") == 4) {
                                // compare int options to the option index
                                String ans = res2.getString("option");
                                options_chosen.add(ans);
                            }

                            rp.setPersonid(res1.getInt("personid"));
                            rp.setOption(options_chosen);
                            rplist.add(rp);
                        }
                        rdatalist.add(rplist);
                    }

                    survey_question_list.setSurvey_index(si);
                    survey_question_list.setAll_questions(all_questions);
                    survey_question_list.setRb(rplist);
                    survey_question_list.setRbean(rdatalist);
                }
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res2);
            DBConnection.closePStatement(pstmt2);
            DBConnection.closeResultSet(res1);
            DBConnection.closePStatement(pstmt1);
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return survey_question_list;
    }

    public SurveyAnswersBean surveyReportGeneral2(String survey_id) {
        SurveyAnswersBean survey_question_list = null;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select * from survey_index where survey_id= ? ");
                pstmt.setString(1, survey_id);
                res = pstmt.executeQuery();
                while (res.next()) {
                    survey_question_list = new SurveyAnswersBean();
                    SurveyIndexBean si = new SurveyIndexBean();
                    si.setSurvey_id(res.getInt("survey_id"));
                    si.setSurvey_name(res.getString("survey_name"));
                    si.setPurpose(res.getString("survey_purpose"));

                    pstmt = con.prepareStatement("select * from survey_question_index where survey_id= ? order by sequence");
                    pstmt.setString(1, survey_id);
                    res = pstmt.executeQuery();
                    ArrayList<SurveyQuestionIndexBean> all_questions = new ArrayList<SurveyQuestionIndexBean>();
                    while (res.next()) {
                        SurveyQuestionIndexBean qi = new SurveyQuestionIndexBean();
                        qi.setQuestion_id(res.getInt("question_id"));
                        SurveyQuestionTypesBean qt = new SurveyQuestionTypesBean();
                        qt.setQuestion_type_id(res.getInt("question_type"));
                        qi.setQuestion_type(qt);
                        qi.setQuestion_description(res.getString("question_description"));
                        qi.setRequired(res.getInt("required"));

                        ArrayList<SurveyOptionsOfQuestionsBean> row_values = new ArrayList<SurveyOptionsOfQuestionsBean>();
                        if (res.getInt("question_type") == 6) {

                            pstmt1 = con.prepareStatement("select * from survey_question_index_rows where question_id=? order by sequence");
                            pstmt1.setInt(1, res.getInt("question_id"));
                            res1 = pstmt1.executeQuery();
                            while (res1.next()) {
                                SurveyOptionsOfQuestionsBean row_value = new SurveyOptionsOfQuestionsBean();
                                row_value.setOption(res1.getString("row_description"));
                                row_values.add(row_value);
                            }
                        } else {
                            SurveyOptionsOfQuestionsBean row_value = new SurveyOptionsOfQuestionsBean();
                            row_value.setOption("");
                            row_values.add(row_value);
                        }
                        qi.setRow_values(row_values);
                        all_questions.add(qi);
                    }

                    pstmt1 = con.prepareStatement("select distinct(sa.personid) from survey_answers sa where sa.survey_id=?");
                    pstmt1.setString(1, survey_id);
                    res1 = pstmt1.executeQuery();
                    ArrayList rdatalist = new ArrayList();
                    ArrayList<ReportBean> rplist = new ArrayList<ReportBean>();
                    while (res1.next()) {
                        ReportBean rp = new ReportBean();
                        rp.setPersonid(res1.getInt("personid"));

                        pstmt2 = con.prepareStatement("select sa.*, si.question_type from survey_answers sa, survey_question_index si where sa.survey_id=? and sa.personid=? and sa.question_id=si.question_id order by si.sequence");
                        pstmt2.setString(1, survey_id);
                        pstmt2.setString(2, res1.getString("personid"));
                        res2 = pstmt2.executeQuery();
                        ArrayList<String> options_chosen = new ArrayList<String>();
                        while (res2.next()) {
                            if (res2.getInt("question_type") == 1 || res2.getInt("question_type") == 2 || res2.getInt("question_type") == 5 || res2.getInt("question_type") == 7 || res2.getInt("question_type") == 8) {
                                String ans = res2.getString("option");
                                options_chosen.add(ans);
                            }
                            if (res2.getInt("question_type") == 3) {
                                String ans = "";
                                pstmt3 = con.prepareStatement("select * from survey_options_of_questions where question_id=? and sequence_of_option=?");
                                pstmt3.setInt(1, res2.getInt("question_id"));
                                pstmt3.setInt(2, res2.getInt("option"));
                                res3 = pstmt3.executeQuery();
                                while (res3.next()) {
                                    ans = res3.getString("option");
                                }
                                options_chosen.add(ans);
                            }
                            if (res2.getInt("question_type") == 4) {
                                String ans1 = res2.getString("option");
                                String ans = "";
                                String[] cvalue = ans1.split(",");
                                for (int i = 0; i < cvalue.length; i++) {
                                    pstmt3 = con.prepareStatement("select * from survey_options_of_questions where question_id=? and sequence_of_option=?");
                                    pstmt3.setInt(1, res2.getInt("question_id"));
                                    pstmt3.setInt(2, Integer.parseInt(cvalue[i].trim()));
                                    res3 = pstmt3.executeQuery();
                                    while (res3.next()) {
                                        ans = ans + res3.getString("option") + ", ";
                                    }
                                }
                                options_chosen.add(ans);
                            }
                            if (res2.getInt("question_type") == 6) {

                                pstmt3 = con.prepareStatement("select * from survey_options_of_questions where question_id=? and sequence_of_option=?");
                                pstmt3.setInt(1, res2.getInt("question_id"));
                                pstmt3.setInt(2, res2.getInt("option"));
                                res3 = pstmt3.executeQuery();

                                while (res3.next()) {
                                    String ans = "";
                                    ans = res3.getString("option");
                                    // options added the no of time as no of rows
                                    options_chosen.add(ans);
                                }

                            }

                        }
                        rp.setOption(options_chosen);
                        rplist.add(rp);
                    }
                    survey_question_list.setSurvey_index(si);
                    survey_question_list.setAll_questions(all_questions);
                    survey_question_list.setRb(rplist);
                    survey_question_list.setRbean(rdatalist);
                }
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res3);
            DBConnection.closePStatement(pstmt3);
            DBConnection.closeResultSet(res2);
            DBConnection.closePStatement(pstmt2);
            DBConnection.closeResultSet(res1);
            DBConnection.closePStatement(pstmt1);
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return survey_question_list;
    }

    public int insertSurveyQuestionsTypeDetails1(int surveyid, int dynamicid, String question, int qtypeid, int seq, int reqflag, int typeOfoption, int typeOfGraph, int lowerLimit, int upperLimit, int step_size) {
        int result = 0, quesid = 0, result1 = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("insert into survey_question_index(survey_id,question_type,question_description,sequence,required,alignment_type, graph_type,lower_limit, upper_limit, step_size) values(?,?,?,?,?,?,?,?,?,?)");
                pstmt.setInt(1, surveyid);
                pstmt.setInt(2, qtypeid);
                pstmt.setString(3, question);
                pstmt.setInt(4, seq);
                pstmt.setInt(5, reqflag);
                pstmt.setInt(6, typeOfoption);
                pstmt.setInt(7, typeOfGraph);
                pstmt.setInt(8, lowerLimit);
                pstmt.setInt(9, upperLimit);
                pstmt.setInt(10, step_size);
                result = pstmt.executeUpdate();
                if (result > 0) {
                    pstmt = con.prepareStatement("select question_id from survey_question_index where question_description=? and sequence=?");
                    pstmt.setString(1, question);
                    pstmt.setInt(2, seq);
                    res = pstmt.executeQuery();
                    while (res.next()) {
                        quesid = res.getInt("question_id");
                    }
                }
            }
        } catch (Exception e) {
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return quesid;
    }

    public int updateSurveyQuestionsTypeDetails1(int surveyid, int dynamicid, String question, int qtypeid, int seq, int qid, int reqflag, int typeOfoption, int typeOfGraph, int lowerLimit, int upperLimit, int step_size) {
        int result = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                // insert here.
                pstmt = con.prepareStatement("update survey_question_index set question_type=?,question_description=?,sequence=?,required=?,alignment_type=?,graph_type=?, lower_limit =? , upper_limit=? , step_size=? where question_id=?");
                pstmt.setInt(1, qtypeid);
                pstmt.setString(2, question);
                pstmt.setInt(3, seq);
                pstmt.setInt(4, reqflag);
                pstmt.setInt(5, typeOfoption);
                pstmt.setInt(6, typeOfGraph);
                pstmt.setInt(7, lowerLimit);
                pstmt.setInt(8, upperLimit);
                pstmt.setInt(9, step_size);
                pstmt.setInt(10, qid);
                result = pstmt.executeUpdate();

                if (result > 0) {
                    pstmt1 = con.prepareStatement("delete from survey_options_of_questions where question_id=?");
                    pstmt1.setInt(1, qid);
                    pstmt1.executeUpdate();
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closePStatement(pstmt1);
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return result;
    }

    public int checkSurveyDate(String sid) {
        int result = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select * from survey_index where start_date <= now()  and DATE_ADD(end_date, INTERVAL 1 DAY) > now() and survey_id=?");
                pstmt.setString(1, sid);
                res = pstmt.executeQuery();
                while (res.next()) {
                    result++;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return result;
    }

    public ArrayList<String> listParticipantStatus() {
        ArrayList<String> status_list = new ArrayList<String>();
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select InitialStatus from status_matrix");
                res = pstmt.executeQuery();
                String status = null;
                while (res.next()) {
                    status = res.getString("InitialStatus");
                    status_list.add(status);
                }
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return status_list;
    }

    public int if_survey_already_fill(int survey_id) {
        int flag = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select count(*) as participant_count from survey_answers where survey_id=?");
                pstmt.setInt(1, survey_id);
                res = pstmt.executeQuery();
                while (res.next()) {
                    flag = res.getInt("participant_count");
                }
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return flag;
    }

    public ArrayList<WorkshopContent> listWorkshopContent(String dbname) {
        ArrayList<WorkshopContent> workshopContents = new ArrayList<WorkshopContent>();
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection(dbname);
            }
            if (con != null) {
                pstmt = con.prepareStatement("select workshopid,workshopname from workshops");
                res = pstmt.executeQuery();
                WorkshopContent wscontent = null;
                while (res.next()) {
                    wscontent = new WorkshopContent();
                    wscontent.setWorkshopid(res.getInt("workshopid"));
                    wscontent.setWorkshopname(res.getString("workshopname"));
                    workshopContents.add(wscontent);
                }
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return workshopContents;
    }

    public int insertSurveyQuestionsTypeMultipleGrid(int surveyid, int dynamicid, String question, int qtypeid, int seq, String optionsarr, int reqflag, int typeOfoption, int typeOfGraph, String optionsarr2) {
        int result = 0, quesid = 0, result1 = 0, result2 = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                /*
                 * pstmt = con.prepareStatement("select survey_id from
                 * survey_index where survey_id=?"); pstmt.setInt(1, surveyid);
                 * res = pstmt.executeQuery(); while (res.next()) { checkIfExist
                 * = res.getInt("survey_id"); }
                 */

                // insert here.
                pstmt = con.prepareStatement("insert into survey_question_index(survey_id,question_type,question_description,sequence,required,alignment_type, graph_type) values(?,?,?,?,?,?,?)");
                pstmt.setInt(1, surveyid);
                pstmt.setInt(2, qtypeid);
                pstmt.setString(3, question);
                pstmt.setInt(4, seq);
                pstmt.setInt(5, reqflag);
                pstmt.setInt(6, typeOfoption);
                pstmt.setInt(7, typeOfGraph);
                result = pstmt.executeUpdate();
                if (result > 0) {
                    pstmt = con.prepareStatement("select question_id from survey_question_index where question_description=? and sequence=?");
                    pstmt.setString(1, question);
                    pstmt.setInt(2, seq);
                    res = pstmt.executeQuery();
                    while (res.next()) {
                        quesid = res.getInt("question_id");
                    }

                    if (quesid > 0) {
                        if (qtypeid == 6) {
                            // insert grid row here
                            String[] parts = optionsarr.split(",");
                            for (int j = 0; j < parts.length; j++) {
                                pstmt = con.prepareStatement("insert into survey_question_index_rows(question_id,row_description,sequence) values(?,?,?)");
                                pstmt.setInt(1, quesid);
                                pstmt.setString(2, parts[j]);
                                int seqOpt = j + 1;
                                pstmt.setInt(3, seqOpt);
                                //pstmt.setInt(4, seqOpt);
                                result1 = pstmt.executeUpdate();
                            }

                            // insert grid column here
                            String[] parts1 = optionsarr2.split(",");
                            for (int i = 0; i < parts1.length; i++) {
                                pstmt1 = con.prepareStatement("insert into survey_options_of_questions(question_id,`option`,value_of_option,sequence_of_option) values(?,?,?,?)");
                                pstmt1.setInt(1, quesid);
                                pstmt1.setString(2, parts1[i]);
                                int seqOpt = i + 1;
                                pstmt1.setInt(3, seqOpt);
                                pstmt1.setInt(4, seqOpt);
                                result2 = pstmt1.executeUpdate();
                            }
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closePStatement(pstmt1);
            DBConnection.closeDBConnection(con);
        }
        return quesid;
    }

    public int updateSurveyQuestionsTypeMultipleGrid(int surveyid, int dynamicid, String question, int qtypeid, int seq, String optionsarr, int qid, int reqflag, int typeOfoption, int typeOfGraph, String optionsarr2) {
        int result = 0, quesid = 0, result1 = 0, result2 = 0, updateRes = 0, updateRes2 = 0, updateRes3 = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                // insert here.
                pstmt = con.prepareStatement("update survey_question_index set question_type=?,question_description=?,sequence=?,required=?,alignment_type=?,graph_type=? where question_id=?");
                pstmt.setInt(1, qtypeid);
                pstmt.setString(2, question);
                pstmt.setInt(3, seq);
                pstmt.setInt(4, reqflag);
                pstmt.setInt(5, typeOfoption);
                pstmt.setInt(6, typeOfGraph);
                pstmt.setInt(7, qid);
                result = pstmt.executeUpdate();

                if (result > 0) {
                    pstmt1 = con.prepareStatement("delete from survey_options_of_questions where question_id=?");
                    pstmt1.setInt(1, qid);
                    result1 = pstmt1.executeUpdate();

                    pstmt1 = con.prepareStatement("delete from survey_question_index_rows where question_id=?");
                    pstmt1.setInt(1, qid);
                    result2 = pstmt1.executeUpdate();

                    if (result1 > 0 && result2 > 0) {

                        if (qtypeid == 6) {
                            // insert grid row here
                            String[] parts = optionsarr.split(",");
                            for (int i = 0; i < parts.length; i++) {
                                pstmt = con.prepareStatement("insert into survey_question_index_rows(question_id,row_description,sequence) values(?,?,?)");
                                pstmt.setInt(1, qid);
                                pstmt.setString(2, parts[i]);
                                int seqOpt = i + 1;
                                pstmt.setInt(3, seqOpt);
                                updateRes2 = pstmt.executeUpdate();
                            }

                            // insert grid column here
                            String[] parts1 = optionsarr2.split(",");
                            for (int i = 0; i < parts1.length; i++) {
                                pstmt = con.prepareStatement("insert into survey_options_of_questions(question_id,`option`,value_of_option,sequence_of_option) values(?,?,?,?)");
                                pstmt.setInt(1, qid);
                                pstmt.setString(2, parts1[i]);
                                int seqOpt = i + 1;
                                pstmt.setInt(3, seqOpt);
                                pstmt.setInt(4, seqOpt);
                                updateRes3 = pstmt.executeUpdate();
                            }
                        }
                    } else if (result1 == 0 || result2 == 0) {
                        int countOptions = 1;
                        pstmt1 = con.prepareStatement("select count(*) as total_options from survey_options_of_questions where question_id=?");
                        pstmt1.setInt(1, qid);
                        res = pstmt1.executeQuery();
                        while (res.next()) {
                            countOptions = res.getInt("total_options");
                        }

                        if (countOptions == 0) {
                            if (qtypeid == 6) {
                                // insert grid row here
                                String[] parts = optionsarr.split(",");
                                for (int i = 0; i < parts.length; i++) {
                                    pstmt = con.prepareStatement("insert into survey_question_index_rows(question_id,row_description,sequence) values(?,?,?)");
                                    pstmt.setInt(1, qid);
                                    pstmt.setString(2, parts[i]);
                                    int seqOpt = i + 1;
                                    pstmt.setInt(3, seqOpt);
                                    updateRes2 = pstmt.executeUpdate();
                                }

                                // insert grid column here
                                String[] parts1 = optionsarr2.split(",");
                                for (int i = 0; i < parts1.length; i++) {
                                    pstmt = con.prepareStatement("insert into survey_options_of_questions(question_id,`option`,value_of_option,sequence_of_option) values(?,?,?,?)");
                                    pstmt.setInt(1, qid);
                                    pstmt.setString(2, parts1[i]);
                                    int seqOpt = i + 1;
                                    pstmt.setInt(3, seqOpt);
                                    pstmt.setInt(4, seqOpt);
                                    updateRes3 = pstmt.executeUpdate();
                                }
                            }
                        }
                    }
                }
                if (result > 0 && updateRes2 > 0 && updateRes3 > 0) {
                    updateRes = 1;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closePStatement(pstmt1);
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return updateRes;
    }

    public Person validateLogin(String username, String password) {
        Person person = null;
        int id = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select l.login_id, l.usertypeid, l.last_login, l.login_name from login l where l.login_name=lower(?) and l.password=md5(?) and l.loginstatus = 1");
                //binding the userid and password to the query
                pstmt.setString(1, username);
                pstmt.setString(2, password);
                //executing the query
                res = pstmt.executeQuery();
                //checking whether any person exist with this userid or password
                if (res.next()) { //if exist then set all the details in Person class object.
                    //creating the object of Person class.
                    person = new Person();
                    //setting the values into variable of Person class
                    person.setLoginId(res.getInt("login_id"));
                    person.setLoginName(res.getString("login_name"));
                    person.setEmail(res.getString("login_name"));
                    //person.setFirstName(res.getString("firstname"));
                    // person.setLastName(res.getString("lastname"));
                    person.setLastLogin(res.getTimestamp("last_login"));
                    person.setRoleId(res.getInt("usertypeid"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return person;
    }

    /**
     * this method return the array data type of content from pagelist table
     *
     * @param page
     * @return
     */
    public ArrayList<Content> getPage_Content(String page) {
        ArrayList<Content> contents = new ArrayList<Content>();
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select content,comment,class from pagelist where name=?");
                pstmt.setString(1, page);
                res = pstmt.executeQuery();
                Content content = null;
                while (res.next()) {
                    content = new Content();
                    content.setContent(res.getString("content"));
                    content.setComment(res.getString("comment"));
                    content.setClass_type(res.getInt("class"));
                    contents.add(content);
                }
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return contents;
    }

    /*
     * check if survey link pressed by valid user
     */
    public int check_VerifyUserLink(String survey_id, String pid) {
        int flag = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select id from survey_log where id=? and survey_id=?");
                pstmt.setInt(1, Integer.parseInt(pid));
                pstmt.setInt(2, Integer.parseInt(survey_id));
                res = pstmt.executeQuery();
                while (res.next()) {
                    flag = res.getInt("id");
                }
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return flag;
    }

    public SurveyIndexBean listSurveyDetails() {
        SurveyIndexBean list = new SurveyIndexBean();
        int sCount = 0, pCount = 0, qCount = 0, mailCount = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {

                pstmt = con.prepareStatement("select count(distinct(survey_id)) as survey_count from survey_index");
                res = pstmt.executeQuery();
                while (res.next()) {
                    sCount = res.getInt("survey_count");
                }
                pstmt = con.prepareStatement("select count(distinct(personid)) as participant_count from survey_answers");
                res = pstmt.executeQuery();
                while (res.next()) {
                    pCount = res.getInt("participant_count");
                }
                pstmt = con.prepareStatement("select count(*) as total_questions from survey_question_index");
                res = pstmt.executeQuery();
                while (res.next()) {
                    qCount = res.getInt("total_questions");
                }
                pstmt = con.prepareStatement("select count(*) as total_mailsent from survey_log");
                res = pstmt.executeQuery();
                while (res.next()) {
                    mailCount = res.getInt("total_mailsent");
                }
                list.setSurvey_count(sCount);
                list.setParticipant_count(pCount);
                list.setTotal_questions(qCount);
                list.setTotal_mail_sent(mailCount);

            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return list;
    }

    public int insert_VistorLog(String ipAddress, String browser, String os_used, String pid) {
        int flag = 0, tempid = 0, tempVno = 1;
        String email = null, tempIp = null;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select email from survey_log where id=?");
                pstmt.setString(1, pid);
                res = pstmt.executeQuery();
                while (res.next()) {
                    email = res.getString("email");
                }
                if (!email.equals(null)) {
                    pstmt1 = con.prepareStatement("select * from visitorlog where email=?");
                    pstmt1.setString(1, email);
                    res1 = pstmt1.executeQuery();
                    while (res1.next()) {
                        tempid = res1.getInt("visitorid");
                        tempIp = res1.getString("ipAddress");
                        tempVno = res1.getInt("visit_number");
                    }
                    if (tempid == 0) {
                        pstmt = con.prepareStatement("insert into visitorlog(time,ipAddress,browser_type,os_used,visit_number,email) values(now(),?,?,?,?,?)");
                        pstmt.setString(1, ipAddress);
                        pstmt.setString(2, browser);
                        pstmt.setString(3, os_used);
                        pstmt.setInt(4, 1);
                        pstmt.setString(5, email);
                        pstmt.executeUpdate();
                    } else if (tempid > 0) {
                        tempIp = tempIp + "," + ipAddress;
                        tempVno++;
                        pstmt = con.prepareStatement("update visitorlog set time=now(),ipAddress=?,visit_number=?,browser_type=?,os_used=? where visitorid=? and email=?");
                        pstmt.setString(1, tempIp);
                        pstmt.setInt(2, tempVno);
                        pstmt.setString(3, browser);
                        pstmt.setString(4, os_used);
                        pstmt.setInt(5, tempid);
                        pstmt.setString(6, email);
                        pstmt.executeUpdate();
                        flag = tempid;
                    }
                }
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res1);
            DBConnection.closePStatement(pstmt1);
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return flag;
    }

    public int updatePassword(String userid, String password, String ipaddress) {
        int flag = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("update login set password=md5(?),last_passupdate=now(),ipaddress=? where login_id=?");
                pstmt.setString(1, password);
                pstmt.setString(2, ipaddress);
                pstmt.setInt(3, Integer.parseInt(userid));
                flag = pstmt.executeUpdate();
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return flag;
    }

    public Person getLoginUserDeatils(int loginid) {
        Person person = null;
        int id = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select * from login where loginstatus=1 and login_id=?");
                pstmt.setInt(1, loginid);
                res = pstmt.executeQuery();
                if (res.next()) {
                    person = new Person();
                    //setting the values into variable of Person class
                    person.setLoginId(res.getInt("login_id"));
                    person.setLoginName(res.getString("login_name"));
                    person.setLastLogin(res.getTimestamp("last_login"));
                    person.setRoleId(res.getInt("usertypeid"));
                    person.setPasswordUpdate(res.getString("last_passupdate"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return person;
    }

    public ArrayList<Person> getEmailList() {
        ArrayList<Person> list = new ArrayList<Person>();
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select login_name from login where usertypeid=5 and loginstatus=1 limit 5");
                res = pstmt.executeQuery();
                Person per = null;
                while (res.next()) {
                    per = new Person();
                    per.setEmail(res.getString("login_name"));
                    list.add(per);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return list;
    }

    public ArrayList<SurveyIndexBean> getAllSurveyList() {
        ArrayList<SurveyIndexBean> list = new ArrayList<SurveyIndexBean>();
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select * from survey_index");
                res = pstmt.executeQuery();
                SurveyIndexBean surveylist = null;
                while (res.next()) {
                    surveylist = new SurveyIndexBean();
                    surveylist.setSurvey_id(res.getInt("survey_id"));
                    surveylist.setSurvey_name(res.getString("survey_name"));
                    surveylist.setPurpose(res.getString("survey_purpose"));
                    surveylist.setStart_date(res.getString("start_date"));
                    surveylist.setEnd_date(res.getString("end_date"));
                    
                    pstmt1 = con.prepareStatement("select count(*) as totalCount from survey_log where survey_id=?");
                    pstmt1.setInt(1, surveylist.getSurvey_id());
                    res1=pstmt1.executeQuery();
                    while(res1.next()){
                        surveylist.setParticipant_count(res1.getInt("totalCount"));
                    }
                    pstmt1 = con.prepareStatement("select count(distinct(personid)) as participantCount from survey_answers where survey_id=?");
                    pstmt1.setInt(1, surveylist.getSurvey_id());
                    res1=pstmt1.executeQuery();
                    while(res1.next()){
                        surveylist.setNumber_of_responses(res1.getInt("participantCount"));
                    }
                    list.add(surveylist);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res1);
            DBConnection.closePStatement(pstmt1);
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return list;
    }
    
    public SurveyIndexBean getSurveyDetails(String surveyid) {
        SurveyIndexBean sbean=null;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select ifnull(success_title,'') as success_title,ifnull(error_title,'') as error_title,ifnull(success_content,'') as success_content,ifnull(error_content,'') as error_content from survey_index where survey_id=?");
                pstmt.setString(1, surveyid);
                res = pstmt.executeQuery();
                while (res.next()) {
                    sbean = new SurveyIndexBean();
                    sbean.setSuccessTitle(res.getString("success_title"));
                    sbean.setErrorTitle(res.getString("error_title"));
                    sbean.setSuccessContent(res.getString("success_content"));
                    sbean.setErrorContent(res.getString("error_content"));
                }
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return sbean;
    }
    
    public int updateSurveyDetails1(int surveyid, String stitle, String spurpose, String start_date, String end_date,String successtitle,String errortitle, String sMsg,String eMsg) {
        int result = 0, checkIfExist = 0;
        try {
            if (con == null || con.isClosed()) {
                con = DBConnection.getDBConnection();
            }
            if (con != null) {
                pstmt = con.prepareStatement("select survey_id from survey_index where survey_id=?");
                pstmt.setInt(1, surveyid);
                res = pstmt.executeQuery();
                while (res.next()) {
                    checkIfExist = res.getInt("survey_id");
                }
                if (checkIfExist > 0) {
                    // update here.
                    pstmt = con.prepareStatement("update survey_index set survey_name=?,survey_purpose=?, start_date=?, end_date=?,success_title=?,error_title=?,success_content=?,error_content=? where survey_id=?");
                    pstmt.setString(1, stitle);
                    pstmt.setString(2, spurpose);
                    pstmt.setString(3, start_date);
                    pstmt.setString(4, end_date);
                    pstmt.setString(5, successtitle);
                    pstmt.setString(6, errortitle);
                    pstmt.setString(7, sMsg);
                    pstmt.setString(8, eMsg);
                    pstmt.setInt(9, surveyid);
                    result = pstmt.executeUpdate();

                } else if (checkIfExist == 0) {
                    // no insertion happen in update method
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResultSet(res);
            DBConnection.closePStatement(pstmt);
            DBConnection.closeDBConnection(con);
        }
        return result;
    }
}
