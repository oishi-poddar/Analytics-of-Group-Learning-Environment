<%-- 
    Document   : pollOptions
    Created on : 26 Jun, 2017, 1:18:35 PM
    Author     : Kunal & Pratik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@taglib prefix="s" uri="/struts-tags"%>
<head>

    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.23/angular.min.js"></script>
    <link href="asset/datatables/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <!--    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>-->
    <script type="text/javascript"></script>
    <script src="js/pollOptions.js"></script>
    <style>
        #exTab1 .tab-content {
            color: #1e0b0b;
        }
    </style>
    <script>
        function selectPoll(index)
        {
            //alert(index);
            selectedPoll = index;
            google.charts.setOnLoadCallback(drawChart);
        }
    </script>

</head>

<body>
    <div class="col-md-6 col-sm-6 col-xs-12">
        <h5 style="color:black">Options distribution for each poll</h5>               
        <select onclick="selectPoll(this.value)" class="selectpicker" data-style="btn-primary" title="Choose one of the following..."> 
            <option value="-1 ">Select a poll ...</option>
            <s:set var="cnt" value="0"/>
            <s:iterator value="poll" status="increment" begin="0" end="poll.size-1">
                <option value='<s:property value="pollId"/>'> <s:property value="question"/></option>
                <script>
                    var li = [];
                    var li1 = [];
                </script>

                <s:iterator value="#attr.poll.get(#cnt).options">

                    <s:iterator value="value">
                        <script>
                            li.push('<s:property value="key"/>');
                            li1.push('<s:property value="value"/>');
                        </script>
                    </s:iterator>

                </s:iterator>
                <script>
//                  alert(li);
//                    alert(li1); 
                        optionsMap['<s:property value="#attr.poll.get(#cnt).pollId"/>'] = li;
                        voteMap['<s:property value="#attr.poll.get(#cnt).pollId"/>'] = li1;
                </script>
                <s:set var="cnt" value="#cnt+1"/>

            </s:iterator>   

        </select>
        <div id="barchart_material" style="width: 1000px; height: 500px; margin-top: 70px"></div>
        <br><br><br>
    </div>

</body>


<%@ include file="/include/script.jsp" %>
