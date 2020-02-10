<%-- 
    Document   : DAOGetValidateSurveyExcelData
    Created on : 10 Mar, 2017, 10:57:39 AM
    Author     : dipesh
--%>

<%@page import="survey.ReadExcelData"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.Person"%>
<%
    try {
        
        String upid = request.getParameter("fileid");
        String surveyid=request.getParameter("sid");
        Person person;
        ArrayList personsdata = new ArrayList();
        ReadExcelData excelData=new ReadExcelData();
        String errormessage = "";
        int invl_count = 0, val_count = 0, total_count = 0,em_flag=0;
        personsdata = excelData.getAllPartRegData(Integer.parseInt(upid));
        total_count = personsdata.size();
        for (int i = 0; i < personsdata.size(); i++) {
            person = (bean.Person) personsdata.get(i);
            int flag = 0;
            int check_vre = 0;
            if (!excelData.isFieldEmpty(person.getEmail())) {
                flag++;
                errormessage = errormessage + "@Email Blank";
                em_flag = 1;
            }else if (excelData.isFieldEmpty(person.getEmail())) {
                if (excelData.validateEmail(person.getEmail()) == false) {
                    flag++;
                    errormessage = errormessage + "@Email not valid";
                }
            }
            
            if (flag > 0) {
                person.setPer_errormessage(errormessage);
                person.setPer_userstatus("error");
                int res2 = excelData.invalidDataMessage(person);
                if (res2 > 0) {
                    invl_count++;
                }
            } else if (flag == 0) {
                //valid data
                person.setPer_userstatus("valid");
                int res3 = excelData.validData(person);
                person.setBulkmail_templateid(Integer.parseInt(upid));
                person.setSurveyid(Integer.parseInt(surveyid));
                int res4= excelData.insertUserToSurveyLog(person);
                if (res3 > 0 && res4 > 0) {
                    val_count++;
                }
            }
            errormessage = "";
        }
        
        String out_res = +total_count + "#" + val_count + "#" + invl_count;
        //String out_res ="1";
        Gson gson = new Gson();
        gson.toJson(out_res);
        out.print(gson.toJson(out_res));
    }catch(Exception e){
        e.printStackTrace();
    }
%>
