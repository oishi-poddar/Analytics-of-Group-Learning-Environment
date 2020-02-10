<%-- 
    Document   : Poll
    Author     : Kunal & Pratik

    Created on : 23 Jun, 2017, 11:50:33 AM
   
--%>

    <!--    Create Polls
                        -->
                        
<div class="tab-pane" id="Create_Poll">
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">

            <div class="x_panel">
                <div class="x_title">
                    <h2>Create Poll</h2>
                    <input type="hidden" id="poll_id">
                    <input type="hidden" id="groupId" value="<s:property value="gid"/>" >
                    <input type="hidden" id="userId" value="<s:property value="#session.loggedInUser.loginId"/>" >
                    <ul class="nav navbar-right panel_toolbox">
                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                    </ul>
                    <div class="clearfix"></div>
                </div>

                <div class="x_content">
                    <div id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">
                        <div class="row">     
                            <div class="form-group">
                                <div class="col-md-4 col-sm-4 col-xs-12">
                                    <input type="text" class="form-control has-feedback-left" id="enddatepicker" name="date" placeholder="End Date " aria-describedby="inputSuccess2Status">

                                    <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true"></span>
                                    <span id="inputSuccess2Status" class="sr-only">(success)</span>
                                </div>
                                <div id="pdateError" class="errorMsgalert" style="display: none;">
                                    Please select a valid date
                                </div>

                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-9 col-sm-12 col-xs-12 form-group">
                                <div class="form-group">                                    
                                    <textarea id="pquestion_textarea_1" rows="3" class="form-control" placeholder="Question"></textarea>
                                </div>
                                <div class="form-group">
                                    <div id="pquestion_typeBlock_1" class="question_typeBlock">
                                        <div id="poptionContainerMain_1" class="poptionContainerMain">
                                            <div id="poptionContainer_1_1" class="form-group poptionContainer_1">
                                                <div class="row">
                                                    <div class="col-md-1 col-sm-2 col-xs-2 fluid form-group text-left">
                                                        <div class="radio">
                                                            <label>
                                                                <div class="iradio_flat-green disabled" style="position: relative;">
                                                                    <input disabled="" class="flat" style="position: absolute; opacity: 0;" type="radio">
                                                                    <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"></ins>
                                                                </div>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-10 col-sm-8 col-xs-8 fluid form-group text-left">
                                                        <input id="pmcqOptions_1_1" name="pmcqOptions_1" class="form-control col-md-7 col-xs-12" type="text" placeholder="Option 1">
                                                    </div>
                                                    <div class="col-md-1 col-sm-2 col-xs-2 fluid form-group text-left"></div>
                                                </div>
                                            </div>
                                            <div id="poptionContainer_1_2" class="form-group poptionContainer_1">
                                                <div class="row">
                                                    <div class="col-md-1 col-sm-2 col-xs-2 fluid form-group text-left">
                                                        <div class="radio">
                                                            <label>
                                                                <div class="iradio_flat-green disabled">
                                                                    <input disabled="" class="flat" style="position: absolute; opacity: 0;" type="radio">
                                                                    <ins class="iCheck-helper"></ins>
                                                                </div>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-10 col-sm-8 col-xs-8 fluid form-group text-left">
                                                        <input id="pmcqOptions_1_2" name="mcqOptions_2" class="form-control col-md-7 col-xs-12" type="text" placeholder="Option 2">
                                                    </div>
                                                    <div class="col-md-1 col-sm-2 col-xs-2 fluid form-group text-left">
                                                    </div>
                                                </div>
                                            </div>

                                            <!--New option to be appended here-->

                                        </div>
                                        <div id="paddOptionContainer_1" style="padding: 5px;">
                                            <button class="btn btn-round btn-primary" onclick="addPollOptions()">
                                                <i class="fa fa-plus" aria-hidden="true"></i>
                                            </button>
                                        </div>
<!--                                        <div id="ptypesOfGraphContainer_1" class="form-group">
                                            <p style="">
                                                <label>Graph Type in Report:</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                            <div class="col-md-12 col-sm-12 col-xs-12 fluid text-left" style="position: relative;">
                                                <input id="pbarRadio" value="1" name="graph" class="flat" checked="checked" type="radio"> Bar Graph&nbsp;&nbsp;
                                                <input id="ppieRadio" value="2" name="graph" class="flat" type="radio"> Pie Chart
                                            </div>
                                        </div>-->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button id="pnext" class="btn btn-success" onclick="validatePoll();">Create</button>
                        <p id="pinformationError" style="display: none; color: red;">Please Fill all the fields</p>

                    </div>
                </div>
            </div>        
        </div>    
    </div> 

</div>

  <!--    Create Polls
                        -->
                    

  <!--    View Answered Polls
                        -->
                        
<div class="tab-pane" id="View_Answered_Poll">
    <div class="row" style="">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h4 style="color:#3f5265;"><b>Polls</b></h4>
                    <h4>List of Answered Polls : <s:property value="listOfAnsweredPolls.size"/> </h4>
                    <div class="clearfix"></div>
                </div>

                <div class="x_content">
                    <br>
                        <s:iterator value="listOfAnsweredPolls" status="incrementer">
                        <div class="w3-panel w3-card">
                            <h4 style="color:#3f5265;">
                                    <b><s:property value="question"/></b>
                                </h4>
                                <p>Poll End Date : <s:property value="endDate"/></p>
                                <s:iterator value="options" status="statusOptions">
                                    <s:if test="optionsId[#statusOptions.index] == selectedOption" >
                                        <p style="line-height:200%;"> <input type="radio" disabled="" checked="true" class="flat"/> <s:property/> 
                                        <b>
                                            <s:property value="noOfVotes[#statusOptions.index]"/> Votes<br/>
                                       </b>  
                                       </p>
                                    </s:if>
                                        <s:else>
                                            <p style="line-height:200%;"> <input type="radio" disabled="" class="flat"/> <s:property/>
                                             <b>
                                                <s:property value="noOfVotes[#statusOptions.index]"/> Votes<br/>
                                             </b>  
                                            </p>
                                        </s:else>
                                    </s:iterator>
                            <br>
                        </div>
                        </s:iterator> 
                    <br/><br/>

                </div>
            </div>        
        </div>    
    </div>
</div>

  <!--    View Answered Polls
                        -->
                    

<!--    View unanswered Polls
                        -->
                    
<div class="tab-pane" id="Answer_Poll">
    <div class="row" style="">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h4 style="color:#3f5265;"><b>Polls</b></h4>
                    <h6>No. of unanswered polls : <s:property value="listOfUnansweredPolls.size" /></h6>
                    <div class="clearfix"></div>
                </div>

                <div class="x_content">
                    <br>
                    <!-- start form for validation -->
                    <input type="hidden" id="userId" value="<s:property value="#session.loggedInUser.loginId"/>"/>
                    <input type="hidden" id="groupId" value="<s:property value="gid"/>"/>
                        <s:iterator value="listOfUnansweredPolls">
                         <div class="w3-panel w3-card">
                                <br>
                                <label style="color:#526374;">  <s:property escape="false" value="question"/> </label>
                                <p>Poll End Date : <s:property value="endDate"/></p> 
                                <s:iterator value="options" status="optionStatus">
                                    <p style="line-height:200%;"> <input value="<s:property value="optionsId[#optionStatus.index]"/>" id="<s:property value="pollId"/>_<s:property value="#optionStatus.index"/>" name="option_<s:property value="pollId"/>" type="radio" class="flat"/>  <s:property/>
                                      <b>
                                            <s:property value="noOfVotes[#optionStatus.index]"/> Votes<br/>
                                       </b>
                                    </p>
                                </s:iterator>
                                <div class="col-md-8 col-sm-12 col-xs-12">
                                    <button class="btn btn-primary" onclick="votePoll(<s:property value="pollId"/>);">Submit</button>
                                </div>
                                <br><br><br>
                           </div>
                        </s:iterator>
                    <br/><br/>

                </div>
            </div>        
        </div>    
    </div>
</div>

  <!--    View unanswered Polls
                        -->
                        
<script>
    function validatePoll()
    {
        var todaysDate = new Date();
        var enteredDate = new Date(document.getElementById("enddatepicker").value);
        var optionsDiv = document.getElementsByClassName("poptionContainer_1");
        document.getElementById("pdateError").style.display = "none";
        document.getElementById("pinformationError").style.display = "none";
        document.getElementById("pquestion_textarea_1").style.border = "";
        document.getElementById("enddatepicker").style.border = "";
        for (i = 0; i < optionsDiv.length; i++)
        {
            document.getElementById("pmcqOptions_1_" + (i + 1)).style.border = "";
        }
        var count = 0;
        if (document.getElementById("enddatepicker").value.trim().length == 0)
        {
            count++;
            document.getElementById("enddatepicker").style.border = "1px solid #CE5454";
        }
        
        if (document.getElementById("pquestion_textarea_1").value.trim().length == 0)
        {
            document.getElementById("pquestion_textarea_1").style.border = "1px solid #CE5454";
            count++;
        }
        for (i = 0; i < optionsDiv.length; i++)
        {
            if (document.getElementById("pmcqOptions_1_" + (i + 1)).value.trim().length == 0)
            {
                document.getElementById("pmcqOptions_1_" + (i + 1)).style.border = "1px solid #CE5454";
                count++;
            }
        }
        if (count > 0)
        {
            document.getElementById("pinformationError").style.display = "inline";
        } else
        {
            createPoll();
        }

    }
    function createPoll()
    {
        var optionsDiv = document.getElementsByClassName("poptionContainer_1");
        var question = document.getElementById("pquestion_textarea_1").value.trim();
        var end_date = document.getElementById("enddatepicker").value.trim();
        var options = '';
        var graph = 1;      //default setting to 1 
//        if (document.getElementById("pbarRadio").checked)
//            graph = document.getElementById("pbarRadio").value;
//        else
//            graph = document.getElementById("ppieRadio").value;
        inputArray = [];
        var options = '';

        for (i = 0; i < optionsDiv.length; i++)
        {
            var optionsValue = document.getElementById('pmcqOptions_1' + '_' + (i + 1)).value.trim();
            if (i < optionsDiv.length - 1)
                options += optionsValue + "__";
            else
                options += optionsValue;
            inputArray.push(optionsValue);
        }
        <%
            int groupid = Integer.parseInt(request.getParameter("groupId").toString());
        %>
                        
        var data = "uid=" + <s:property value="#session.loggedInUser.loginId"/> + "&gid=" + <%=groupid%> + "&question=" + question + "&end_date=" + end_date + "&graph=" + graph + "&options=" + options;
        $.ajax({
            url: "angle_group/SavePoll.jsp",
            type: "GET",
            data: data,
            dataType: "json",
            success: pollCreated,
            error: onError
        });
    }
    function pollCreated(data)
    {
        if (data == true)
        {
            alert("Poll successfully created!");
            
            location.reload();
        }
        else{
            alert("Please try again later");
            }
    }
    function addPollOptions()
    {
        var optionsDiv = document.getElementsByClassName("poptionContainer_1");
        var nextId = optionsDiv.length;
        if (nextId < 2) {
            nextId++;
        } else {
            var mcq_opt_id = document.getElementsByClassName("poptionContainer_1")[nextId - 1].id;
            var quesid_part = mcq_opt_id.split("_");
            var lastOptId = parseInt(quesid_part[2])
            nextId = (lastOptId + 1);
        }
        //nextId++;
       

        var poptionContainer = document.createElement("div");
        poptionContainer.id = 'poptionContainer_1' + '_' + nextId;
        poptionContainer.className = 'form-group poptionContainer_1';
        //optionContainer.setAttribute("style", "padding-top: 10px;");

        var div_row = document.createElement('div');
        div_row.className = "row";
        var div_row_left = document.createElement('div');
        var div_row_middle = document.createElement('div');
        var div_row_right = document.createElement('div');
        div_row_left.className = "col-md-1 col-sm-2 col-xs-2 fluid form-group text-left";
        div_row_middle.className = "col-md-10 col-sm-8 col-xs-8 fluid form-group text-left";
        div_row_right.className = "col-md-1 col-sm-2 col-xs-2 fluid form-group text-left";
        var div_radio = document.createElement('div');
        div_radio.className = "radio";
        var radio_label = document.createElement('label');
        var radioInput = document.createElement('input');
        radioInput.setAttribute('type', 'radio');
        radioInput.disabled = true;
        radioInput.className = "flat";
        radio_label.appendChild(radioInput);
        div_radio.appendChild(radio_label);
        
            /*var radioInput = document.createElement('input');
         radioInput.setAttribute('type', 'radio');
         radioInput.disabled = true;
         radioInput.setAttribute("style", "padding: 10px; width: 20px; margin-right: 13px;");*/

        var mcqOptions = document.createElement('input');
        mcqOptions.type = "text";
        mcqOptions.id = "pmcqOptions_1" + "_" + nextId;
        mcqOptions.name = "pmcqOptions_" + nextId;
        mcqOptions.placeholder = "Option " + nextId;
        mcqOptions.className = "form-control col-md-7 col-xs-12";
        //mcqOptions.setAttribute("style", "padding: 5px; width: 150px; margin-right: 10px");

        var qOptionRemove = document.createElement("button");
        //qOptionRemove.type = "button";
        qOptionRemove.id = "qOptionRemove_" + nextId;
        qOptionRemove.innerHTML = '<i class="fa fa-times" aria-hidden="true" style="margin-top: 4px;margin-bottom: 2px;"></i>';
        qOptionRemove.className = "btn btn-danger";
        //qOptionRemove.setAttribute("style", "padding-bottom: 13px;");

        //qOptionRemove.setAttribute("style", "width: 70px; padding-bottom: 13px; background: gray; color: white; right: 0px;");
        qOptionRemove.addEventListener("click", function () {
            removeOption(poptionContainer.id)
        }, false);
        div_row_left.appendChild(div_radio);
        div_row_middle.appendChild(mcqOptions);
        div_row_right.appendChild(qOptionRemove);
        document.getElementById('poptionContainerMain_1').appendChild(poptionContainer);
        div_row.appendChild(div_row_left);
        div_row.appendChild(div_row_middle);
        div_row.appendChild(div_row_right);
        poptionContainer.appendChild(div_row);
        $(radioInput).iCheck({checkboxClass: 'icheckbox_flat-green', radioClass: 'iradio_flat-green'});
    }
    function removeOption(id)
    {
        document.getElementById(id).remove();
    }
    function votePoll(pollId)
    {
        var noOfOptions = document.getElementsByName("option_" + pollId).length;
        var flag = false;
        for (i = 0; i < noOfOptions; i++)
        {
            var option = document.getElementById(pollId + "_" + i);
            if (option.checked)
            {
                flag = true;
                insertVotePoll(pollId, option.value);
            }
        }
        if (flag == false)
            alert("Please Select an Option to Vote...");
    }

    function insertVotePoll(pollId, optionId)
    {
        var userId = document.getElementById("userId").value;
        var data = "pid=" + pollId + "&optionid=" + optionId + "&userId=" + userId;
        $.ajax({
            url: "angle_group/DAO_votePoll.jsp",
            type: "GET",
            data: data,
            dataType: "json",
            success: voteSuccess,
            error: onError
        });
    }
    function voteSuccess(data)
    {
        if (data > 0)
        {
            //   success
            alert("Success! You have taken the poll ...");
            location.reload();
        } else
        {
            alert("Please Try Again!!!");
        }
    }

</script>