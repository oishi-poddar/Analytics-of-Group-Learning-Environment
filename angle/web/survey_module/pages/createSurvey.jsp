
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ include file="/include/header.jsp" %>
        <title>Survey| Home </title>
        <!-- bootstrap-daterangepicker -->
        <link href="css/daterangepicker.css" rel="stylesheet">
        <!-- iCheck -->
        <link href="asset/iCheck/skins/flat/green.css" rel="stylesheet">
        <!-- Switchery -->
        <link href="asset/switchery/dist/switchery.min.css" rel="stylesheet">
        <link href="asset/jquery_alerts/jquery-confirm.min.css" rel="stylesheet">
    </head>
    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <%@ include file="/include/menu.jsp" %>
                <div class="right_col" role="main">
                    <%--<div class="x_panel">
                        <div class="x_title">
                            <h2>Create Survey</h2>
                            <div class="clearfix"></div>
                        </div>    
                    </div>--%>

                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">

                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Create Survey</h2>
                                    <ul class="nav navbar-right panel_toolbox">
                                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                                <p><input type="hidden" id="survey_id" name="survey_id" value="<s:property value="surveyId"/>"/></p>

                                <div class="x_content">
                                    <%--<center><h2>Basic Survey Information</h2></center>--%>
                                    <div id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="stitle">Title of Survey <span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="stitle" name="stitle" required="required" class="form-control col-md-7 col-xs-12" value="">
                                                <%--<ul class="parsley-errors-list filled">
                                                    <li id="sTitleError" class="parsley-required"></li>
                                                </ul>--%>
                                            </div>
                                            <div id="sTitleError" class="errorMsgalert" style="display: none;">
                                                please put something here
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="spurpose">Purpose of Survey <span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <textarea id="spurpose" name="spurpose" required="required" class="form-control"  data-parsley-trigger="keyup" data-parsley-minlength="20" data-parsley-maxlength="100" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.."
                                                          data-parsley-validation-threshold="10"></textarea>
                                                <%--<ul class="parsley-errors-list filled">
                                                    <li id="sPurposeError" class="parsley-required"></li>
                                                </ul>--%>
                                            </div>
                                            <div id="sPurposeError" class="errorMsgalert" style="display: none;">
                                                please put something here
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="datepicker1">Start date <span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" class="form-control has-feedback-left" id="datepicker1" name="start_date" placeholder="Start date " aria-describedby="inputSuccess2Status">
                                                <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true"></span>
                                                <span id="inputSuccess2Status" class="sr-only">(success)</span>
                                                <%--<ul class="parsley-errors-list filled">
                                                    <li id="startdateError" class="parsley-required"></li>
                                                </ul>
                                                <label id="startdateError" style="display: none; color: red;">please enter valid start date</label>--%>
                                            </div>
                                            <div id="startdateError" class="errorMsgalert" style="display: none;">
                                                please select date
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="datepicker2">End date <span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" class="form-control has-feedback-left" id="datepicker2" name="end_date" placeholder="End date" aria-describedby="inputSuccess2Status">
                                                <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true"></span>
                                                <span id="inputSuccess2Status" class="sr-only">(success)</span>
                                                <%--<ul class="parsley-errors-list filled">
                                                    <li id="enddateError" class="parsley-required"></li>
                                                </ul>
                                                <label id="enddateError" style="display: none; color: red;">please enter valid end date</label>--%>
                                            </div>
                                            <div id="enddateError" class="errorMsgalert" style="display: none;">
                                                please select date
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Success Message Title <span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="successMsg" class="form-control" value="<s:property value="surveydetails.successTitle"/>">
                                            </div>
                                            <div id="successMsgError" class="errorMsgalert" style="display: none;">
                                                please put something here
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Success Message Content <span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <textarea id="successContent" class="form-control" rows="3" placeholder=''><s:property value="surveydetails.successContent"/></textarea>
                                            </div>
                                            <div id="successContentError" class="errorMsgalert" style="display: none;">
                                                please put something here
                                            </div>
                                        </div>
                                         <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Error Message Title <span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="alerrorMsg" class="form-control" value="<s:property value="surveydetails.errorTitle"/>">
                                            </div>
                                            <div id="alerrorMsgError" class="errorMsgalert" style="display: none;">
                                                please put something here
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Error Message Content<span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <textarea id="errorContent" class="form-control" rows="3" placeholder=''><s:property value="surveydetails.errorContent"/></textarea>
                                            </div>
                                            <div id="errorContentError" class="errorMsgalert" style="display: none;">
                                                please put something here
                                            </div>
                                        </div>    

                                        <button id="snext" class="btn btn-success" onclick="saveSurvey();">Next</button>
                                        <p id="sinformationError" style="display: none; color: red;">Please Fill Survey Information</p>

                                    </div>
                                </div>
                            </div>        
                        </div>    
                    </div>                   

                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div id="QuestionsContent" style="display: none;">
                            </div>
                            <div class="x_panel" id="AddQuestions" style="display: none;">
                                <div  class="x_content" >
                                    To Add New Question <input class="btn btn-warning" style="" type="button" value="ADD" onclick="createQuestions();"/>
                                </div>                     

                            </div>
                        </div>
                        <select style="display: none;" id="hiddenSelect" class="displayselect" name="">
                            <option value="-1">--Select question type--</option>
                            <s:iterator value="questiontpyelist">
                                <option value="<s:property value="question_type_id"/>"><s:property value="question_type"/></option>
                            </s:iterator>
                        </select>
                    </div>
                </div>
                <%@ include file="/include/footer.jsp" %>
            </div>
        </div>     
        <%@ include file="/include/script.jsp" %>
        <script src="js/moment.min.js"></script>
        <script src="js/daterangepicker.js"></script>
        <script src="asset/iCheck/icheck.min.js"></script>
        <script src="asset/switchery/dist/switchery.min.js"></script>
        <script src="asset/jquery_alerts/jquery-confirm.min.js"></script>
        <script type="text/javascript">

                                        function createQuestions() {
                                            var hidden_select = document.getElementById("hiddenSelect");

                                            document.getElementById("QuestionsContent").style.display = "inline";
                                            var arr = document.getElementsByClassName("question_form_box");
                                            var lastid = arr.length;
                                            //lastid++;
                                            if (lastid == 0) {
                                                lastid = 1;
                                            } else {
                                                var ques_div_id = document.getElementsByClassName('question_form_box')[lastid - 1].id;
                                                var quesid_part = ques_div_id.split("_");
                                                var lastqId = parseInt(quesid_part[1])
                                                lastid = (lastqId + 1);
                                            }
                                            //alert(lastid);
                                            var xPanelHtml = '';
                                            var x_title_div = document.createElement('div');
                                            x_title_div.className = 'x_title';
                                            x_title_div.innerHTML = "Question " + lastid;

                                            var x_title_ul = document.createElement("ul");
                                            x_title_ul.className = 'nav navbar-right panel_toolbox';

                                            var x_title_li = document.createElement("li");

                                            var x_title_a = document.createElement("a");
                                            //x_title_a.className = 'collapse-link';
                                            $(x_title_a).addClass('collapse-link');
                                            //x_title_a.setAttribute("data-toggle", "collapse");

                                            var x_title_i = document.createElement("i");
                                            x_title_i.className = 'fa fa-chevron-up';

                                            x_title_a.appendChild(x_title_i);
                                            x_title_li.appendChild(x_title_a);
                                            x_title_ul.appendChild(x_title_li);
                                            x_title_div.appendChild(x_title_ul);
                                            //$('.collapse-link').collapse()

                                            var clearfix_div = document.createElement('div');
                                            clearfix_div.className = 'clearfix';
                                            x_title_div.appendChild(clearfix_div);

                                            var x_content_div = document.createElement('div');
                                            x_content_div.className = 'x_content';

                                            var x_content_row1 = document.createElement('div');
                                            x_content_row1.className = 'row';
                                            var x_content_row2 = document.createElement('div');
                                            x_content_row2.className = 'row';
                                            /*row1 column*/
                                            var x_content_row1_left = document.createElement('div');
                                            var x_content_row1_right = document.createElement('div');
                                            var x_content_row2_left = document.createElement('div');
                                            var x_content_row2_right = document.createElement('div');
                                            x_content_row1_left.className = "col-md-9 col-sm-12 col-xs-12 form-group";
                                            x_content_row1_right.className = "col-md-3 col-sm-12 col-xs-12 form-group";
                                            x_content_row2_left.className = "col-md-9 col-sm-12 col-xs-12 form-group";
                                            x_content_row2_right.className = "col-md-3 col-sm-12 col-xs-12 form-group";

                                            x_content_row1.appendChild(x_content_row1_left);
                                            x_content_row1.appendChild(x_content_row1_right);
                                            x_content_row2.appendChild(x_content_row2_left);
                                            x_content_row2.appendChild(x_content_row2_right);

                                            var x_row1_right_element1 = document.createElement('div');
                                            x_row1_right_element1.className = "form-group";
                                            var x_row1_right_element3 = document.createElement('div');
                                            x_row1_right_element3.className = "form-group";
                                            var x_row1_left_element1 = document.createElement('div');
                                            x_row1_left_element1.className = "form-group";
                                            var x_row1_left_element2 = document.createElement('div');
                                            x_row1_left_element2.className = "form-group";

                                            var iDiv = document.createElement('div');
                                            iDiv.id = 'question_' + lastid;
                                            iDiv.className = 'x_panel question_form_box';
                                            iDiv.name = "questions";
                                            iDiv.innerHTML = "";

                                            document.getElementById("QuestionsContent").appendChild(iDiv);

                                            var innerDiv = document.createElement('div');
                                            innerDiv.id = 'question_typeBlock_' + lastid;
                                            innerDiv.className = 'question_typeBlock';

                                            /*var table = document.createElement('table');
                                             table.className='question_table_block';
                                             var tr = document.createElement('tr'); 
                                             var td1 = document.createElement('td');
                                             var td2 = document.createElement('td');
                                             td1.className='question_tdleft_block';
                                             td2.className='question_tdright_block';*/

                                            var input = document.createElement("textarea");
                                            input.id = "question_textarea_" + lastid;
                                            //input.cols = "50";
                                            input.rows = "3";
                                            input.className = "form-control";
                                            input.placeholder ="Question";
                                            //input.setAttribute("style", "width: 450px;");

                                            var selectList = document.createElement("select");
                                            selectList.id = "mySelect_" + lastid;
                                            selectList.className = "form-control";
                                            //selectList.setAttribute("style", "width: 200px;");
                                            selectList.addEventListener("change", function () {
                                                createQuestionTypes(this.value, lastid)
                                            }, false);

                                            // td1.appendChild(input);
                                            //td2.appendChild(selectList);


                                            for (i = 0; i < hidden_select.length; i++) {
                                                var option = document.createElement("option");
                                                option.value = hidden_select.options[i].value;
                                                option.text = hidden_select.options[i].text;
                                                selectList.appendChild(option);
                                            }

                                            /*append selectlist to right col*/
                                            x_row1_right_element1.appendChild(selectList);
                                            //tr.appendChild(td1);
                                            // tr.appendChild(td2);

                                            // table.appendChild(tr);



                                            //document.getElementById("question_"+lastid).appendChild(inneriDiv);
                                            x_content_div.appendChild(x_content_row1);
                                            x_content_div.appendChild(x_content_row2);
                                            //x_content_div.innerHTML="testkjdk f kdfjdskf<br>djfdlfjd f<br>djfdlkfj "
                                            //x_content_div.appendChild(table);
                                            //x_content_div.appendChild(innerDiv);
                                            document.getElementById("question_" + lastid).appendChild(x_title_div);
                                            document.getElementById("question_" + lastid).appendChild(x_content_div);
                                            //document.getElementById("question_"+lastid).appendChild(table);
                                            //document.getElementById("question_"+lastid).appendChild(innerDiv);


                                            var iDivQuestionsSeq = document.createElement('div');
                                            iDivQuestionsSeq.id = 'QuestionsSeq_' + lastid;
                                            iDivQuestionsSeq.className = "form-group";
                                            //iDivQuestionsSeq.setAttribute("style", "margin-top: 0px; padding-bottom: 15px;");

                                            var labelSeqQuestion = document.createElement('label');
                                            labelSeqQuestion.innerHTML = 'Question Sequence : ';
                                            //labelSeqQuestion.setAttribute("style", "float: none; margin-right: 15px; font-size: 16px;");

                                            var seqInput = document.createElement('input');
                                            seqInput.type = "text";
                                            seqInput.id = "seqInput_" + lastid;
                                            seqInput.name = "seqInput_" + lastid;
                                            seqInput.setAttribute("style", "width: 50px; margin-left: 3px;");

                                            var labelQuestionError = document.createElement('label');
                                            labelQuestionError.id = "labelQuestionError_" + lastid;
                                            labelQuestionError.innerHTML = 'please fill all the information - question, question type, sequence ';
                                            labelQuestionError.setAttribute("style", "display:none; color: #ff6666;");

                                            var iDivButtons = document.createElement('div');
                                            iDivButtons.id = 'qFunctions_' + lastid;
                                            iDivButtons.setAttribute("style", "margin-left: 8px;")

                                            iDivQuestionsSeq.appendChild(labelSeqQuestion);
                                            iDivQuestionsSeq.appendChild(seqInput);
                                            //iDivQuestionsSeq.appendChild(labelQuestionError);
                                            //document.getElementById("question_"+lastid).appendChild(iDivQuestionsSeq);
                                            //document.getElementById(iDivQuestionsSeq.id).appendChild(labelSeqQuestion);
                                            //document.getElementById(iDivQuestionsSeq.id).appendChild(seqInput);
                                            //document.getElementById(iDivQuestionsSeq.id).appendChild(labelQuestionError);

                                            //document.getElementById("question_"+lastid).appendChild(iDivButtons);

                                            var qSave = document.createElement("button");
                                            //qSave.type = "button";
                                            qSave.id = "qsave_" + lastid;
                                            qSave.className = "btn btn-success";
                                            qSave.innerHTML = "Save";
                                            //qSave.setAttribute("style", "width: 50px; background: #008000; color: white; margin-right: 5px;");
                                            qSave.addEventListener("click", function () {
                                                saveQuestions(lastid)
                                            }, false);

                                            var qEdit = document.createElement("button");
                                            //qEdit.type = "button";
                                            qEdit.id = "qedit_" + lastid;
                                            qEdit.className = "btn btn-primary";
                                            qEdit.innerHTML = "Edit";
                                            //qEdit.setAttribute("style", "width: 50px; background: #2591FE; color: white; display: none; margin-right: 5px;");
                                            qEdit.addEventListener("click", function () {
                                                editQuestions(lastid)
                                            }, false);

                                            var qDelete = document.createElement("button");
                                            //qDelete.type = "button";
                                            qDelete.id = "qdelete_" + lastid;
                                            qDelete.className = "btn btn-danger";
                                            qDelete.innerHTML = "Delete";
                                            //qDelete.setAttribute("style", "width: 50px; background: #ff1919; color: white;");
                                            qDelete.addEventListener("click", function () {
                                                deleteQuestions(lastid)
                                            }, false);

                                            var qhiddenId = document.createElement("input");
                                            qhiddenId.type = "hidden";
                                            qhiddenId.id = "qhiddenId_" + lastid;
                                            qhiddenId.value = "0";

                                            var req_div_checkbox = document.createElement("div");
                                            req_div_checkbox.className = "checkbox";


                                            var qlabelReq = document.createElement("label");
                                            qlabelReq.id = "qlabelReq_" + lastid;
                                            qlabelReq.setAttribute("style", "font-weight: 700; padding-left: 0px;");
                                            qlabelReq.innerHTML = "Required : ";

                                            var qlabelReq_input = document.createElement("label");

                                            var qcheckboxReq = document.createElement("input");
                                            qcheckboxReq.type = "checkbox";
                                            qcheckboxReq.id = "qcheckboxReq_" + lastid;
                                            qcheckboxReq.className = "flat";
                                            qcheckboxReq.setAttribute("unchecked", "");
                                            //qcheckboxReq.setAttribute("style", "position: relative; left: 52%; top: 5px;");
                                            //qhiddenId.setAttribute("style", "width: 50px; background: red; color: white;");
                                            qlabelReq_input.appendChild(qcheckboxReq);
                                            req_div_checkbox.appendChild(qlabelReq);
                                            req_div_checkbox.appendChild(qlabelReq_input);
                                            x_row1_right_element3.appendChild(req_div_checkbox);
                                            //document.getElementById(iDivButtons.id).appendChild(labelQuestionError);

                                            x_content_row2_left.appendChild(qSave);
                                            x_content_row2_left.appendChild(qEdit);
                                            x_content_row2_left.appendChild(qDelete);
                                            x_content_row2_left.appendChild(qhiddenId);
                                            x_content_row2_left.appendChild(labelQuestionError);

                                            x_content_row1_right.appendChild(x_row1_right_element1);
                                            x_content_row1_right.appendChild(iDivQuestionsSeq);
                                            x_content_row1_right.appendChild(x_row1_right_element3);

                                            x_row1_left_element1.appendChild(input);
                                            x_content_row1_left.appendChild(x_row1_left_element1);
                                            x_row1_left_element2.appendChild(innerDiv);
                                            x_content_row1_left.appendChild(x_row1_left_element2);

                                            $('#' + qcheckboxReq.id).iCheck({checkboxClass: 'icheckbox_flat-green', radioClass: 'iradio_flat-green'});
                                         
                                            initCollpase();
                                        }
                                        function initCollpase() {
                                            $(".collapse-link").unbind("click");
                                            $('.collapse-link').on('click', function () {
                                                var $BOX_PANEL = $(this).closest('.x_panel'),
                                                        $ICON = $(this).find('i'),
                                                        $BOX_CONTENT = $BOX_PANEL.find('.x_content');

                                                // fix for some div with hardcoded fix class
                                                if ($BOX_PANEL.attr('style')) {
                                                    $BOX_CONTENT.slideToggle(200, function () {
                                                        $BOX_PANEL.removeAttr('style');
                                                    });
                                                } else {
                                                    $BOX_CONTENT.slideToggle(200);
                                                    $BOX_PANEL.css('height', 'auto');
                                                }

                                                $ICON.toggleClass('fa-chevron-up fa-chevron-down');
                                            });
                                        }
                                        function createQuestionTypes(value, divId) {
                                            //alert(divId)
                                            if (value == 1) {
                                                document.getElementById('question_typeBlock_' + divId).innerHTML = "";
                                                var shortAns = document.createElement('input');
                                                shortAns.type = "text";
                                                shortAns.id = "shortAns_" + divId;
                                                shortAns.name = "shortAns_" + divId;
                                                shortAns.value = "short answer";
                                                shortAns.readOnly = true;
                                                shortAns.className = "form-control col-md-7 col-xs-12";
                                                document.getElementById('question_typeBlock_' + divId).appendChild(shortAns);
                                            } else if (value == 2) {
                                                document.getElementById('question_typeBlock_' + divId).innerHTML = "";
                                                var longAns = document.createElement("textarea");
                                                longAns.cols = "50";
                                                longAns.rows = "1";
                                                longAns.id = "longAns_" + divId;
                                                longAns.className = "question_textarea";
                                                longAns.className = "form-control col-md-7 col-xs-12";
                                                //longAns.setAttribute("style", "width: 450px;");
                                                longAns.value = "Long Answer";
                                                longAns.readOnly = true;
                                                document.getElementById('question_typeBlock_' + divId).appendChild(longAns);
                                            } else if (value == 3) {
                                                document.getElementById('question_typeBlock_' + divId).innerHTML = "";

                                                var optionContainerMain = document.createElement('div');
                                                optionContainerMain.id = 'optionContainerMain_' + divId;
                                                optionContainerMain.className = 'optionContainerMain';

                                                var optionContainer = document.createElement('div');
                                                optionContainer.id = 'optionContainer_' + divId + '_1';
                                                optionContainer.className = 'form-group optionContainer_' + divId;

                                                var option_row = document.createElement('div');
                                                option_row.className = "row";

                                                var option_row_left = document.createElement('div');
                                                var option_row_middle = document.createElement('div');
                                                var option_row_right = document.createElement('div');
                                                option_row_left.className = "col-md-1 col-sm-2 col-xs-2 fluid form-group text-left";
                                                option_row_middle.className = "col-md-10 col-sm-8 col-xs-8 fluid form-group text-left";
                                                option_row_right.className = "col-md-1 col-sm-2 col-xs-2 fluid form-group text-left";

                                                var div_radio = document.createElement('div');
                                                div_radio.className = "radio";

                                                var radio_label = document.createElement('label');

                                                var radioInput = document.createElement('input');
                                                radioInput.setAttribute('type', 'radio');
                                                radioInput.disabled = true;
                                                radioInput.className = "flat";

                                                radio_label.appendChild(radioInput);
                                                div_radio.appendChild(radio_label);
                                                //radioInput.setAttribute("style", "padding: 10px; width: 20px; margin-right: 10px;");

                                                var mcqOptions = document.createElement('input');
                                                mcqOptions.type = "text";
                                                mcqOptions.id = "mcqOptions_" + divId + "_1";
                                                mcqOptions.name = "mcqOptions_" + divId;
                                                mcqOptions.value = "Option 1";
                                                mcqOptions.className = "form-control col-md-7 col-xs-12";
                                                //mcqOptions.setAttribute("style", "padding: 5px; width: 150px; margin-right: 10px");

                                                /*var qOptionRemove = document.createElement("input");
                                                 qOptionRemove.type = "button";
                                                 qOptionRemove.id="qOptionRemove_"+divId;
                                                 qOptionRemove.value="Remove";
                                                 qOptionRemove.setAttribute("style", "width: 70px; background: gray; color: white; right: 0px;");
                                                 qOptionRemove.addEventListener("click", function(){removeOption(optionContainer.id)}, false);*/

                                                option_row_left.appendChild(div_radio);
                                                option_row_middle.appendChild(mcqOptions);

                                                document.getElementById('question_typeBlock_' + divId).appendChild(optionContainerMain);
                                                document.getElementById(optionContainerMain.id).appendChild(optionContainer);

                                                option_row.appendChild(option_row_left);
                                                option_row.appendChild(option_row_middle);
                                                option_row.appendChild(option_row_right);
                                                optionContainer.appendChild(option_row);
                                                //document.getElementById(optionContainer.id).appendChild(radioInput);
                                                //document.getElementById(optionContainer.id).appendChild(mcqOptions);

                                                var radioInput2 = document.createElement('input');
                                                radioInput2.setAttribute('type', 'radio');
                                                radioInput2.disabled = true;
                                                radioInput2.setAttribute("style", "padding: 10px; width: 20px; margin-right: 10px;");

                                                var addOptions = document.createElement("button");
                                                addOptions.className = "btn btn-round btn-primary";
                                                addOptions.innerHTML = "<i class='fa fa-plus' aria-hidden='true'></i>";
                                                //addOptions.setAttribute("style", "float: none; font-size: 16px; cursor:pointer; text-decoration: underline; color: #4F76A3;");
                                                addOptions.addEventListener("click", function () {
                                                    addOptionsMCQ(divId)
                                                }, false);

                                                var addOptionContainer = document.createElement('div');
                                                addOptionContainer.id = 'addOptionContainer_' + divId;
                                                addOptionContainer.setAttribute("style", "padding: 5px;");

                                                document.getElementById('question_typeBlock_' + divId).appendChild(addOptionContainer);
                                                //document.getElementById(addOptionContainer.id).appendChild(radioInput2);
                                                document.getElementById(addOptionContainer.id).appendChild(addOptions);
                                                //document.getElementById(optionContainer.id).appendChild(qOptionRemove);

                                                var typesOfOptionContainer = document.createElement('div');
                                                typesOfOptionContainer.id = 'typesOfOptionContainer_' + divId;
                                                typesOfOptionContainer.className = "form-group";
                                                //typesOfOptionContainer.setAttribute("style", "margin-top: 10px;");

                                                var typeLabel = document.createElement('p');
                                                //typeLabel.innerHTML='<label>Option Alignment :</label> ';

                                                typeLabel.innerHTML = '<label>Option Alignment :</label>&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" id="radioHorizontal_' + divId + '" name="typeOfOption_' + divId + '" class="flat" style="" checked/> Horizontal &nbsp;&nbsp; <input type="radio" id="radioVertical_' + divId + '" name="typeOfOption_' + divId + '" class="flat" style="" unchecked=""/> Vertical';
                                                typeLabel.setAttribute("style", "")

                                                document.getElementById('question_typeBlock_' + divId).appendChild(typesOfOptionContainer);
                                                document.getElementById(typesOfOptionContainer.id).appendChild(typeLabel);

                                                var typesOfGraphContainer = document.createElement('div');
                                                typesOfGraphContainer.id = 'typesOfGraphContainer_' + divId;
                                                typesOfGraphContainer.className = "form-group";
                                                //typesOfGraphContainer.setAttribute("style", "margin-top: 10px;");
                                                var typesOfGraphLabel = document.createElement('p');
                                                typesOfGraphLabel.innerHTML = '<label>Graph Type in Report:</label>&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" id="radioBar_' + divId + '" name="typeOfGraph_' + divId + '" class="flat" style="" checked=""/> Bar Graph &nbsp;&nbsp; <input type="radio" id="radioPie_' + divId + '" name="typeOfGraph_' + divId + '" class="flat" style="" unchecked=""/> Pie Chart';
                                                typesOfGraphLabel.setAttribute("style", "");
                                                document.getElementById('question_typeBlock_' + divId).appendChild(typesOfGraphContainer);
                                                document.getElementById(typesOfGraphContainer.id).appendChild(typesOfGraphLabel);
                                                $('#radioHorizontal_' + divId).iCheck({checkboxClass: 'icheckbox_flat-green', radioClass: 'iradio_flat-green'});
                                                $('#radioVertical_' + divId).iCheck({checkboxClass: 'icheckbox_flat-green', radioClass: 'iradio_flat-green'});
                                                $('#radioBar_' + divId).iCheck({checkboxClass: 'icheckbox_flat-green', radioClass: 'iradio_flat-green'});
                                                $('#radioPie_' + divId).iCheck({checkboxClass: 'icheckbox_flat-green', radioClass: 'iradio_flat-green'});
                                                $(radioInput).iCheck({checkboxClass: 'icheckbox_flat-green', radioClass: 'iradio_flat-green'});

                                            } else if (value == 4) {
                                                document.getElementById('question_typeBlock_' + divId).innerHTML = "";

                                                var optionCheckBoxMain = document.createElement('div');
                                                optionCheckBoxMain.id = 'optionCheckBoxMain_' + divId;
                                                optionCheckBoxMain.className = 'optionCheckBoxMain';

                                                var optionCheckBoxContainer = document.createElement('div');
                                                optionCheckBoxContainer.id = 'optionCheckBoxContainer_' + divId + '_1';
                                                optionCheckBoxContainer.className = 'form-group optionCheckBoxContainer_' + divId;

                                                var option_row = document.createElement('div');
                                                option_row.className = "row";

                                                var option_row_left = document.createElement('div');
                                                var option_row_middle = document.createElement('div');
                                                var option_row_right = document.createElement('div');
                                                option_row_left.className = "col-md-1 col-sm-2 col-xs-2 fluid form-group text-left";
                                                option_row_middle.className = "col-md-10 col-sm-8 col-xs-8 fluid form-group text-left";
                                                option_row_right.className = "col-md-1 col-sm-2 col-xs-2 fluid form-group text-left";

                                                var div_radio = document.createElement('div');
                                                div_radio.className = "checkbox";

                                                var checkbox_label = document.createElement('label');

                                                var radioInput = document.createElement('input');
                                                radioInput.setAttribute('type', 'checkbox');
                                                radioInput.disabled = true;
                                                radioInput.className = "flat";
                                                //radioInput.setAttribute("style", "padding: 10px; width: 20px; margin-right: 10px;");

                                                checkbox_label.appendChild(radioInput);
                                                div_radio.appendChild(checkbox_label);


                                                var checkboxOptions = document.createElement('input');
                                                checkboxOptions.type = "text";
                                                checkboxOptions.id = "checkboxOptions_" + divId + "_1";
                                                checkboxOptions.name = "checkboxOptions_" + divId;
                                                checkboxOptions.value = "Option 1";
                                                checkboxOptions.className = "form-control col-md-7 col-xs-12";
                                                //checkboxOptions.setAttribute("style", "padding: 5px; width: 150px; margin-right: 10px");

                                                /*var qOptionRemove = document.createElement("input");
                                                 qOptionRemove.type = "button";
                                                 qOptionRemove.id="qOptionRemove_"+divId;
                                                 qOptionRemove.value="Remove";
                                                 qOptionRemove.setAttribute("style", "width: 70px; background: gray; color: white; right: 0px;");
                                                 qOptionRemove.addEventListener("click", function(){removeOption(optionContainer.id)}, false);*/

                                                option_row_left.appendChild(div_radio);
                                                option_row_middle.appendChild(checkboxOptions);

                                                document.getElementById('question_typeBlock_' + divId).appendChild(optionCheckBoxMain);
                                                document.getElementById(optionCheckBoxMain.id).appendChild(optionCheckBoxContainer);

                                                option_row.appendChild(option_row_left);
                                                option_row.appendChild(option_row_middle);
                                                option_row.appendChild(option_row_right);
                                                optionCheckBoxContainer.appendChild(option_row);
                                                //document.getElementById(optionCheckBoxContainer.id).appendChild(radioInput);
                                                //document.getElementById(optionCheckBoxContainer.id).appendChild(checkboxOptions);

                                                var radioInput2 = document.createElement('input');
                                                radioInput2.setAttribute('type', 'radio');
                                                radioInput2.disabled = true;
                                                //radioInput2.className="flat";
                                                radioInput2.setAttribute("style", "padding: 10px; width: 20px; margin-right: 10px;");

                                                var addOptions = document.createElement("button");
                                                addOptions.className = "btn btn-round btn-primary";
                                                addOptions.innerHTML = "<i class='fa fa-plus' aria-hidden='true'></i>";
                                                //addOptions.setAttribute("style", "float: none; font-size: 16px; cursor:pointer; text-decoration: underline; color: #4F76A3;");
                                                addOptions.addEventListener("click", function () {
                                                    addOptionsCheckBox(divId)
                                                }, false);

                                                var addOptionCheckBoxContainer = document.createElement('div');
                                                addOptionCheckBoxContainer.id = 'addOptionContainer_' + divId;
                                                addOptionCheckBoxContainer.setAttribute("style", "padding: 5px;");

                                                document.getElementById('question_typeBlock_' + divId).appendChild(addOptionCheckBoxContainer);
                                                //document.getElementById(addOptionContainer.id).appendChild(radioInput2);
                                                document.getElementById(addOptionCheckBoxContainer.id).appendChild(addOptions);
                                                //document.getElementById(optionContainer.id).appendChild(qOptionRemove);

                                                var typesOfOptionContainer = document.createElement('div');
                                                typesOfOptionContainer.id = 'typesOfOptionContainer_' + divId;
                                                typesOfOptionContainer.className = "form-group";
                                                //typesOfOptionContainer.setAttribute("style", "margin-top: 10px;");

                                                var typeLabel = document.createElement('p');
                                                typeLabel.innerHTML = '<label>Option Alignment :</label>&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" id="radioHorizontal_' + divId + '" name="typeOfOption_' + divId + '" style="" class="flat" checked=""/> Horizontal &nbsp;&nbsp; <input type="radio" id="radioVertical_' + divId + '" name="typeOfOption_' + divId + '" style="" class="flat" unchecked=""/> Vertical';
                                                typeLabel.setAttribute("style", "")

                                                document.getElementById('question_typeBlock_' + divId).appendChild(typesOfOptionContainer);
                                                document.getElementById(typesOfOptionContainer.id).appendChild(typeLabel);

                                                var typesOfGraphContainer = document.createElement('div');
                                                typesOfGraphContainer.id = 'typesOfGraphContainer_' + divId;
                                                typesOfGraphContainer.className = "form-group";
                                                //typesOfGraphContainer.setAttribute("style", "margin-top: 10px;");
                                                var typesOfGraphLabel = document.createElement('p');
                                                typesOfGraphLabel.innerHTML = '<label>Graph Type in Report:</label>&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" id="radioBar_' + divId + '" name="typeOfGraph_' + divId + '" style="" class="flat" checked=""/> Bar Graph &nbsp;&nbsp; <input type="radio" id="radioPie_' + divId + '" name="typeOfGraph_' + divId + '" style="" class="flat" unchecked=""/> Pie Chart';
                                                typesOfGraphLabel.setAttribute("style", "");
                                                document.getElementById('question_typeBlock_' + divId).appendChild(typesOfGraphContainer);
                                                document.getElementById(typesOfGraphContainer.id).appendChild(typesOfGraphLabel);
                                                $('#radioHorizontal_' + divId).iCheck({checkboxClass: 'icheckbox_flat-green', radioClass: 'iradio_flat-green'});
                                                $('#radioVertical_' + divId).iCheck({checkboxClass: 'icheckbox_flat-green', radioClass: 'iradio_flat-green'});
                                                $('#radioBar_' + divId).iCheck({checkboxClass: 'icheckbox_flat-green', radioClass: 'iradio_flat-green'});
                                                $('#radioPie_' + divId).iCheck({checkboxClass: 'icheckbox_flat-green', radioClass: 'iradio_flat-green'});
                                                $(radioInput).iCheck({checkboxClass: 'icheckbox_flat-green', radioClass: 'iradio_flat-green'});

                                            } else if (value == 5) {
                                                document.getElementById('question_typeBlock_' + divId).innerHTML = "";

                                                var div_lower = document.createElement("div");
                                                var div_upper = document.createElement("div");
                                                var div_step = document.createElement("div");
                                                div_lower.className = "row form-group";
                                                div_upper.className = "row form-group";
                                                div_step.className = "row form-group";

                                                var div_lower_left = document.createElement("div");
                                                var div_lower_right = document.createElement("div");
                                                var div_upper_left = document.createElement("div");
                                                var div_upper_right = document.createElement("div");
                                                var div_step_left = document.createElement("div");
                                                var div_step_right = document.createElement("div");
                                                div_lower_left.className = "col-md-2 col-sm-2 col-xs-3  form-group text-left";
                                                div_lower_right.className = "col-md-1 col-sm-1 col-xs-2 fluid form-group text-left";
                                                div_upper_left.className = "col-md-2 col-sm-2 col-xs-3  form-group text-left";
                                                div_upper_right.className = "col-md-1 col-sm-1 col-xs-2 fluid form-group text-left";
                                                div_step_left.className = "col-md-2 col-sm-2 col-xs-3  form-group text-left";
                                                div_step_right.className = "col-md-1 col-sm-1 col-xs-2 fluid form-group text-left";

                                                div_lower_left.innerHTML = "<label>Lower limit :</label>";
                                                div_upper_left.innerHTML = "<label>Upper limit :</label>";
                                                div_step_left.innerHTML = "<label>Step size :</label>";
                                                div_lower_right.innerHTML = '<input type="text" style="width:50px;" class="form-control col-md-7 col-xs-12" value="" pattern="[0-9]+" id="lowerLimit_' + divId + '"/>';
                                                div_upper_right.innerHTML = '<input type="text" style="width:50px;" class="form-control col-md-7 col-xs-12" value="" pattern="[0-9]+" id="upperLimit_' + divId + '"/>';
                                                div_step_right.innerHTML = '<input type="text" style="width:50px;" class="form-control col-md-7 col-xs-12" value="" pattern="[0-9]+" id="step_size_' + divId + '"/>';

                                                div_lower.appendChild(div_lower_left);
                                                div_lower.appendChild(div_lower_right);
                                                div_upper.appendChild(div_upper_left);
                                                div_upper.appendChild(div_upper_right);
                                                div_step.appendChild(div_step_left);
                                                div_step.appendChild(div_step_right);

                                                var typesOfGraphContainer = document.createElement('div');
                                                typesOfGraphContainer.id = 'typesOfGraphContainer_' + divId;
                                                typesOfGraphContainer.className = "form-group";
                                                //typesOfGraphContainer.setAttribute("style", "margin-top: 10px;");
                                                var typesOfGraphLabel = document.createElement('p');
                                                typesOfGraphLabel.innerHTML = '<label>Graph Type in Report:</label>&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" id="radioBar_' + divId + '" name="typeOfGraph_' + divId + '" style="" class="flat" checked=""/> Bar Graph &nbsp;&nbsp; <input type="radio" id="radioPie_' + divId + '" name="typeOfGraph_' + divId + '" style="" class="flat" unchecked=""/> Pie Chart';
                                                typesOfGraphLabel.setAttribute("style", "");

                                                //document.getElementById('question_typeBlock_'+divId).appendChild(table);
                                                document.getElementById('question_typeBlock_' + divId).appendChild(div_lower);
                                                document.getElementById('question_typeBlock_' + divId).appendChild(div_upper);
                                                document.getElementById('question_typeBlock_' + divId).appendChild(div_step);

                                                document.getElementById('question_typeBlock_' + divId).appendChild(typesOfGraphContainer);
                                                document.getElementById(typesOfGraphContainer.id).appendChild(typesOfGraphLabel);
                                                $('#radioBar_' + divId).iCheck({checkboxClass: 'icheckbox_flat-green', radioClass: 'iradio_flat-green'});
                                                $('#radioPie_' + divId).iCheck({checkboxClass: 'icheckbox_flat-green', radioClass: 'iradio_flat-green'});
                                            } else if (value == 6) {
                                                document.getElementById('question_typeBlock_' + divId).innerHTML = "";

                                                var div_row = document.createElement("div");
                                                div_row.className = "row";

                                                var div_row_left = document.createElement("div");
                                                div_row_left.className = "col-md-6 col-sm-12 col-xs-12 form-group";
                                                var div_row_right = document.createElement("div");
                                                div_row_right.className = "col-md-6 col-sm-12 col-xs-12 form-group";

                                                //var grid_table = document.createElement("TABLE");
                                                //grid_table.id="table_"+divId;
                                                //grid_table.setAttribute("style", "width: 100%;");

                                                //var rowElem = document.createElement('tr');
                                                //rowElem.id="table_tr_"+divId;

                                                // var colElem1 = document.createElement('td');
                                                //colElem1.id="table_grid_row_"+divId;
                                                //colElem1.setAttribute("style", "width: 50%; background: #FFFFFF; vertical-align: top;");

                                                //var colElem2 = document.createElement('td');
                                                //colElem2.id="table_grid_column_"+divId;
                                                //colElem2.setAttribute("style", "width: 50%; background: #FFFFFF; vertical-align: top;");

                                                var rowContainerMain = document.createElement('div');
                                                rowContainerMain.id = 'rowContainerMain_' + divId;
                                                rowContainerMain.className = 'rowContainerMain';

                                                var columnContainerMain = document.createElement('div');
                                                columnContainerMain.id = 'columnContainerMain_' + divId;
                                                columnContainerMain.className = 'columnContainerMain';

                                                var rowContainer = document.createElement('div');
                                                rowContainer.id = 'rowContainer_' + divId + '_1';
                                                rowContainer.className = 'rowContainer_' + divId;
                                                rowContainer.setAttribute("style", "");

                                                var columnContainer = document.createElement('div');
                                                columnContainer.id = 'columnContainer_' + divId + '_1';
                                                columnContainer.className = 'columnContainer_' + divId;
                                                columnContainer.setAttribute("style", "");

                                                var div_left_row = document.createElement('div');
                                                div_left_row.className = "row form-group";
                                                var div_right_row = document.createElement('div');
                                                div_right_row.className = "row form-group";

                                                var div_left_row_content1 = document.createElement('div');
                                                div_left_row_content1.className = "col-md-2 col-sm-4 col-xs-4 form-group text-left";
                                                div_left_row_content1.setAttribute("style", "text-align: center");
                                                var div_left_row_content2 = document.createElement('div');
                                                div_left_row_content2.className = "col-md-8 col-sm-6 col-xs-6 fluid form-group text-left";
                                                var div_left_row_content3 = document.createElement('div');
                                                div_left_row_content3.className = "col-md-1 col-sm-2 col-xs-2 fluid form-group text-left";

                                                var div_right_row_content1 = document.createElement('div');
                                                div_right_row_content1.className = "col-md-3 col-sm-4 col-xs-4 form-group";
                                                div_right_row_content1.setAttribute("style", "text-align: center");
                                                var div_right_row_content2 = document.createElement('div');
                                                div_right_row_content2.className = "col-md-8 col-sm-6 col-xs-6 fluid form-group text-left";
                                                var div_right_row_content3 = document.createElement('div');
                                                div_right_row_content3.className = "col-md-1 col-sm-2 col-xs-2 fluid form-group text-left";

                                                var rowNum = document.createElement('label');
                                                rowNum.innerHTML = "Row 1"
                                                //rowNum.setAttribute("style", "padding-left: 5px; padding-top: 5px; width: 40px; margin-right: 10px; font-size: 12px;");

                                                var rowOptions = document.createElement('input');
                                                rowOptions.type = "text";
                                                rowOptions.id = "rowOptions_" + divId + "_1";
                                                rowOptions.name = "rowOptions_" + divId;
                                                rowOptions.value = "Row 1";
                                                rowOptions.className = "form-control col-md-7 col-xs-12";
                                                //rowOptions.setAttribute("style", "padding: 5px; width: 150px; margin-right: 10px");

                                                var columnNum = document.createElement('label');
                                                columnNum.innerHTML = "Column 1"
                                                //columnNum.setAttribute("style", "padding-left: 5px; padding-top: 5px; width: 60px; margin-right: 10px; font-size: 12px;");

                                                var columnOptions = document.createElement('input');
                                                columnOptions.type = "text";
                                                columnOptions.id = "columnOptions_" + divId + "_1";
                                                columnOptions.name = "columnOptions_" + divId;
                                                columnOptions.value = "Column 1";
                                                columnOptions.className = "form-control col-md-7 col-xs-12";
                                                //columnOptions.setAttribute("style", "padding: 5px; width: 150px; margin-right: 10px");

                                                div_left_row_content1.appendChild(rowNum);
                                                div_left_row_content2.appendChild(rowOptions);
                                                div_left_row.appendChild(div_left_row_content1);
                                                div_left_row.appendChild(div_left_row_content2);
                                                div_left_row.appendChild(div_left_row_content3);

                                                rowContainer.appendChild(div_left_row);
                                                columnContainer.appendChild(div_right_row);
                                                //rowContainer.appendChild(rowNum);
                                                //rowContainer.appendChild(rowOptions);

                                                div_right_row_content1.appendChild(columnNum);
                                                div_right_row_content2.appendChild(columnOptions);
                                                div_right_row.appendChild(div_right_row_content1);
                                                div_right_row.appendChild(div_right_row_content2);
                                                div_right_row.appendChild(div_right_row_content3);
                                                //columnContainer.appendChild(columnNum);
                                                //columnContainer.appendChild(columnOptions);

                                                var addRowOption = document.createElement("button");
                                                addRowOption.innerHTML = "<i class='fa fa-plus' aria-hidden='true'></i>";
                                                addRowOption.className = "btn btn-round btn-primary";
                                                //addRowOption.setAttribute("style", "float: none; font-size: 16px; cursor:pointer; text-decoration: underline; color: #4F76A3;");
                                                addRowOption.addEventListener("click", function () {
                                                    addRowOptionsGrid(divId)
                                                }, false);

                                                var addRowContainer = document.createElement('div');
                                                addRowContainer.id = 'addRowContainer_' + divId;
                                                addRowContainer.setAttribute("style", "padding: 5px;");

                                                var addColumnOption = document.createElement("button");
                                                addColumnOption.innerHTML = "<i class='fa fa-plus' aria-hidden='true'></i>";
                                                addColumnOption.className = "btn btn-round btn-primary";
                                                //addColumnOption.setAttribute("style", "float: none; font-size: 16px; cursor:pointer; text-decoration: underline; color: #4F76A3;");
                                                addColumnOption.addEventListener("click", function () {
                                                    addColumnOptionsGrid(divId)
                                                }, false);

                                                var addColumnContainer = document.createElement('div');
                                                addColumnContainer.id = 'addColumnContainer_' + divId;
                                                addColumnContainer.setAttribute("style", "padding: 5px;");

                                                /*add row and column*/
                                                rowContainerMain.appendChild(rowContainer);
                                                columnContainerMain.appendChild(columnContainer);
                                                div_row_left.appendChild(rowContainerMain);
                                                div_row_right.appendChild(columnContainerMain);


                                                addColumnContainer.appendChild(addColumnOption);
                                                div_row_right.appendChild(addColumnContainer);
                                                //columnContainerMain.appendChild(columnContainer);

                                                addRowContainer.appendChild(addRowOption);
                                                div_row_left.appendChild(addRowContainer);

                                                //rowContainerMain.appendChild(rowContainer);

                                                //colElem1.appendChild(rowContainerMain);
                                                //colElem1.appendChild(addRowContainer);

                                                //colElem2.appendChild(columnContainerMain);
                                                //colElem2.appendChild(addColumnContainer);

                                                //rowElem.appendChild(colElem1);
                                                //rowElem.appendChild(colElem2);
                                                //grid_table.appendChild(rowElem);

                                                // document.getElementById('question_typeBlock_'+divId).appendChild(grid_table);
                                                div_row.appendChild(div_row_left);
                                                div_row.appendChild(div_row_right);
                                                document.getElementById('question_typeBlock_' + divId).appendChild(div_row);
                                            }else if (value == 7) {
                                                document.getElementById('question_typeBlock_' + divId).innerHTML = "";
                                                var shortAns = document.createElement('input');
                                                shortAns.type = "text";
                                                shortAns.id = "dateAns_" + divId;
                                                shortAns.name = "dateAns_" + divId;
                                                shortAns.value = "Date";
                                                shortAns.readOnly = true;
                                                shortAns.className = "form-control col-md-7 col-xs-12";
                                                document.getElementById('question_typeBlock_' + divId).appendChild(shortAns);
                                            }else if (value == 8) {
                                                document.getElementById('question_typeBlock_' + divId).innerHTML = "";
                                                var shortAns = document.createElement('input');
                                                shortAns.type = "text";
                                                shortAns.id = "timeAns_" + divId;
                                                shortAns.name = "timeAns_" + divId;
                                                shortAns.value = "Time";
                                                shortAns.readOnly = true;
                                                shortAns.className = "form-control col-md-7 col-xs-12";
                                                document.getElementById('question_typeBlock_' + divId).appendChild(shortAns);
                                            } else {
                                                document.getElementById('question_typeBlock_' + divId).innerHTML = "";
                                            }
                                        }
                                        function addOptionsMCQ(id) {
                                            var optionsDiv = document.getElementsByClassName("optionContainer_" + id);
                                            var nextId = optionsDiv.length;

                                            if (nextId == 0) {
                                                nextId = 1;
                                            } else {
                                                var mcq_opt_id = document.getElementsByClassName("optionContainer_" + id)[nextId - 1].id;
                                                var quesid_part = mcq_opt_id.split("_");
                                                var lastOptId = parseInt(quesid_part[2])
                                                nextId = (lastOptId + 1);
                                            }
                                            //nextId++;
                                            //alert('add options '+id+' '+nextId);

                                            var optionContainer = document.createElement('div');
                                            optionContainer.id = 'optionContainer_' + id + '_' + nextId;
                                            optionContainer.className = 'form-group optionContainer_' + id;
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
                                            mcqOptions.id = "mcqOptions_" + id + "_" + nextId;
                                            mcqOptions.name = "mcqOptions_" + nextId;
                                            mcqOptions.value = "Option " + nextId;
                                            mcqOptions.className = "form-control col-md-7 col-xs-12";
                                            //mcqOptions.setAttribute("style", "padding: 5px; width: 150px; margin-right: 10px");

                                            var qOptionRemove = document.createElement("button");
                                            //qOptionRemove.type = "button";
                                            qOptionRemove.id = "qOptionRemove_" + nextId;
                                            qOptionRemove.innerHTML = '<i class="fa fa-times" aria-hidden="true"></i>';
                                            qOptionRemove.className = "btn btn-danger";
                                            //qOptionRemove.setAttribute("style", "width: 70px; background: gray; color: white; right: 0px;");
                                            qOptionRemove.addEventListener("click", function () {
                                                removeOption(optionContainer.id)
                                            }, false);

                                            div_row_left.appendChild(div_radio);
                                            div_row_middle.appendChild(mcqOptions);
                                            div_row_right.appendChild(qOptionRemove);

                                            document.getElementById('optionContainerMain_' + id).appendChild(optionContainer);
                                            div_row.appendChild(div_row_left);
                                            div_row.appendChild(div_row_middle);
                                            div_row.appendChild(div_row_right);
                                            optionContainer.appendChild(div_row);

                                            $(radioInput).iCheck({checkboxClass: 'icheckbox_flat-green', radioClass: 'iradio_flat-green'});
                                            /*document.getElementById(optionContainer.id).appendChild(radioInput);
                                             document.getElementById(optionContainer.id).appendChild(mcqOptions);
                                             document.getElementById(optionContainer.id).appendChild(qOptionRemove);*/
                                        }
                                        function addOptionsCheckBox(id) {
                                            var optionsDiv = document.getElementsByClassName("optionCheckBoxContainer_" + id);
                                            var nextId = optionsDiv.length;

                                            if (nextId == 0) {
                                                nextId = 1;
                                            } else {
                                                var checkbox_opt_id = document.getElementsByClassName("optionCheckBoxContainer_" + id)[nextId - 1].id;
                                                var quesid_part = checkbox_opt_id.split("_");
                                                var lastOptId = parseInt(quesid_part[2])
                                                nextId = (lastOptId + 1);
                                            }
                                            //nextId++;
                                            //alert('add options '+id+' '+nextId);

                                            var optionCheckBoxContainer = document.createElement('div');
                                            optionCheckBoxContainer.id = 'optionCheckBoxContainer_' + id + '_' + nextId;
                                            optionCheckBoxContainer.className = 'form-group optionCheckBoxContainer_' + id;
                                            //optionCheckBoxContainer.className = 'optionCheckBoxContainer_'+id;
                                            // optionCheckBoxContainer.setAttribute("style", "padding-top: 10px;");

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


                                            var checkboxInput = document.createElement('input');
                                            checkboxInput.setAttribute('type', 'checkbox');
                                            checkboxInput.disabled = true;
                                            checkboxInput.className = "flat";

                                            radio_label.appendChild(checkboxInput);
                                            div_radio.appendChild(radio_label);
                                            //checkboxInput.setAttribute("style", "padding: 10px; width: 20px; margin-right: 15px;");

                                            var checkboxOptions = document.createElement('input');
                                            checkboxOptions.type = "text";
                                            checkboxOptions.id = "checkboxOptions_" + id + "_" + nextId;
                                            checkboxOptions.name = "checkboxOptions_" + nextId;
                                            checkboxOptions.value = "Option " + nextId;
                                            checkboxOptions.className = "form-control col-md-7 col-xs-12";
                                            //checkboxOptions.setAttribute("style", "padding: 5px; width: 150px; margin-right: 13px");

                                            var qOptionRemove = document.createElement("button");
                                            qOptionRemove.id = "qOptionRemove_" + nextId;
                                            qOptionRemove.innerHTML = '<i class="fa fa-times" aria-hidden="true"></i>';
                                            qOptionRemove.className = "btn btn-danger";
                                            //qOptionRemove.setAttribute("style", "width: 70px; background: gray; color: white; right: 0px;");
                                            qOptionRemove.addEventListener("click", function () {
                                                removeOption(optionCheckBoxContainer.id)
                                            }, false);

                                            div_row_left.appendChild(div_radio);
                                            div_row_middle.appendChild(checkboxOptions);
                                            div_row_right.appendChild(qOptionRemove);

                                            document.getElementById('optionCheckBoxMain_' + id).appendChild(optionCheckBoxContainer);
                                            div_row.appendChild(div_row_left);
                                            div_row.appendChild(div_row_middle);
                                            div_row.appendChild(div_row_right);
                                            optionCheckBoxContainer.appendChild(div_row);

                                            $(checkboxInput).iCheck({checkboxClass: 'icheckbox_flat-green', radioClass: 'iradio_flat-green'});

                                            /*document.getElementById(optionCheckBoxContainer.id).appendChild(checkboxInput);
                                             document.getElementById(optionCheckBoxContainer.id).appendChild(checkboxOptions);
                                             document.getElementById(optionCheckBoxContainer.id).appendChild(qOptionRemove);*/
                                        }
                                        function removeOption(id) {
                                            document.getElementById(id).remove();
                                            //alert("remove "+id)
                                        }


                                        function saveQuestions(questionId) {
                                            var stitle = document.getElementById("stitle").value;
                                            var spurpose = document.getElementById("spurpose").value;
                                            var survey_id = document.getElementById("survey_id").value;
                                            document.getElementById("sinformationError").style.display = "none";
                                            document.getElementById("labelQuestionError_" + questionId).style.display = "none";
                                            if (stitle.trim().length > 0 && spurpose.trim().length > 0) {
                                                var questionText = document.getElementById("question_textarea_" + questionId).value;
                                                var questionType = document.getElementById("mySelect_" + questionId).value;
                                                var questionSeq = document.getElementById("seqInput_" + questionId).value
                                                if (questionText.trim().length == 0 || questionType == -1 || questionSeq.trim().length == 0) {
                                                    document.getElementById("labelQuestionError_" + questionId).style.display = "inline";
                                                } else {
                                                    document.getElementById("labelQuestionError_" + questionId).style.display = "none";
                                                    if (questionType == 1 || questionType == 2 || questionType == 7 || questionType == 8) {
                                                        // save short anwser.
                                                        var options = "none";
                                                        var reqFlag = 0;
                                                        var req_question = document.getElementById("qcheckboxReq_" + questionId).checked;
                                                        if (req_question == true) {
                                                            reqFlag = 1;
                                                        } else if (req_question == false) {
                                                            reqFlag = 0;
                                                        }
                                                        // alert(req_question)
                                                        var typesOfOption = 0;
                                                        saveQuestionsDetails(questionId, questionText, survey_id, questionSeq, questionType, stitle, spurpose, options, reqFlag, typesOfOption);
                                                    } else if (questionType == 3) {
                                                        var countOptDiv = document.getElementsByClassName("optionContainer_" + questionId);
                                                        var totalOptions = countOptDiv.length;
                                                        var inputArray = [];
                                                        var arrayOfIds = $.map($(".optionContainer_" + questionId), function (n, i) {
                                                            var parts = (n.id).split("_");
                                                            var optionsValue = document.getElementById('mcqOptions_' + parts[1] + '_' + parts[2]).value;
                                                            inputArray.push(optionsValue);
                                                            return n.id;
                                                        });
                                                        var radioH = document.getElementById("radioHorizontal_" + questionId).checked;
                                                        var radioV = document.getElementById("radioVertical_" + questionId).checked
                                                        var typesOfOption = 0;
                                                        if (radioH == true) {
                                                            typesOfOption = 0;
                                                        } else if (radioV == true) {
                                                            typesOfOption = 1;
                                                        }

                                                        var radioBar = document.getElementById("radioBar_" + questionId).checked;
                                                        var radioPie = document.getElementById("radioPie_" + questionId).checked
                                                        var typeOfGraph = 0;
                                                        if (radioBar == true) {
                                                            typeOfGraph = 0;
                                                        } else if (radioPie == true) {
                                                            typeOfGraph = 1;
                                                        }

                                                        //var test=document.getElementById("mcqOptions_1_1").value;
                                                        //alert(test)
                                                        //                    
                                                        //                    for(var i=0; i< totalOptions; i++){
                                                        //                        var temp=i+1;
                                                        //                        //alert('mcqOptions_'+questionId+'_'+temp)
                                                        //                        var opt_id=document.getElementsByClassName("optionContainer_"+questionId)[temp].id
                                                        //                        alert(opt_id);
                                                        //                        var optionsValue=document.getElementById("mcqOptions_"+questionId+"_"+temp).value;
                                                        //                        inputArray.push(optionsValue);
                                                        //                    }
                                                        //alert(inputArray);
                                                        var reqFlag = 0;
                                                        var req_question = document.getElementById("qcheckboxReq_" + questionId).checked;
                                                        if (req_question == true) {
                                                            reqFlag = 1;
                                                        } else if (req_question == false) {
                                                            reqFlag = 0;
                                                        }
                                                        saveQuestionsDetails(questionId, questionText, survey_id, questionSeq, questionType, stitle, spurpose, inputArray, reqFlag, typesOfOption, typeOfGraph);
                                                    } else if (questionType == 4) {
                                                        var countOptDiv = document.getElementsByClassName("optionCheckBoxContainer_" + questionId);
                                                        var totalOptions = countOptDiv.length;
                                                        var inputArray = [];
                                                        var arrayOfIds = $.map($(".optionCheckBoxContainer_" + questionId), function (n, i) {
                                                            var parts = (n.id).split("_");
                                                            var optionsValue = document.getElementById('checkboxOptions_' + parts[1] + '_' + parts[2]).value;
                                                            inputArray.push(optionsValue);
                                                            return n.id;
                                                        });
                                                        /*var inputArray=[];
                                                         for(var i=0; i< totalOptions; i++){
                                                         var temp=i+1;
                                                         //alert('checkboxOptions_'+questionId+'_'+temp)
                                                         var optionsValue=document.getElementById("checkboxOptions_"+questionId+"_"+temp).value;
                                                         inputArray.push(optionsValue);
                                                         }*/
                                                        var reqFlag = 0;
                                                        var req_question = document.getElementById("qcheckboxReq_" + questionId).checked;
                                                        if (req_question == true) {
                                                            reqFlag = 1;
                                                        } else if (req_question == false) {
                                                            reqFlag = 0;
                                                        }

                                                        var radioH = document.getElementById("radioHorizontal_" + questionId).checked;
                                                        var radioV = document.getElementById("radioVertical_" + questionId).checked
                                                        var typesOfOption = 0;
                                                        if (radioH == true) {
                                                            typesOfOption = 0;
                                                        } else if (radioV == true) {
                                                            typesOfOption = 1;
                                                        }

                                                        var radioBar = document.getElementById("radioBar_" + questionId).checked;
                                                        var radioPie = document.getElementById("radioPie_" + questionId).checked
                                                        var typeOfGraph = 0;
                                                        if (radioBar == true) {
                                                            typeOfGraph = 0;
                                                        } else if (radioPie == true) {
                                                            typeOfGraph = 1;
                                                        }

                                                        saveQuestionsDetails(questionId, questionText, survey_id, questionSeq, questionType, stitle, spurpose, inputArray, reqFlag, typesOfOption, typeOfGraph);
                                                    } else if (questionType == 5) {
                                                        var options = "none";
                                                        var reqFlag = 0;
                                                        var req_question = document.getElementById("qcheckboxReq_" + questionId).checked;
                                                        if (req_question == true) {
                                                            reqFlag = 1;
                                                        } else if (req_question == false) {
                                                            reqFlag = 0;
                                                        }
                                                        var radioBar = document.getElementById("radioBar_" + questionId).checked;
                                                        var radioPie = document.getElementById("radioPie_" + questionId).checked
                                                        var typeOfGraph = 0;
                                                        if (radioBar == true) {
                                                            typeOfGraph = 0;
                                                        } else if (radioPie == true) {
                                                            typeOfGraph = 1;
                                                        }
                                                        var typesOfOption = 0;
                                                        var lowerLimit = parseInt(document.getElementById("lowerLimit_" + questionId).value, 10);
                                                        var upperLimit = parseInt(document.getElementById("upperLimit_" + questionId).value, 10);
                                                        var step_size = parseInt(document.getElementById("step_size_" + questionId).value, 10);
                                                        if (isNaN(lowerLimit) || isNaN(upperLimit) || isNaN(step_size)) {
                                                            document.getElementById("labelQuestionError_" + questionId).innerHTML = "Please enter lower bounds, upper bounds and step size";
                                                            document.getElementById("labelQuestionError_" + questionId).style.display = "inline";
                                                        } else if ((upperLimit < lowerLimit) || (step_size > upperLimit)) {
                                                            document.getElementById("labelQuestionError_" + questionId).innerHTML = "Please enter lower bounds, upper bounds and step size";
                                                            document.getElementById("labelQuestionError_" + questionId).style.display = "inline";
                                                        } else {
                                                            saveQuestionsDetails(questionId, questionText, survey_id, questionSeq, questionType, stitle, spurpose, options, reqFlag, typesOfOption, typeOfGraph, lowerLimit, upperLimit, step_size);
                                                        }
                                                    } else if (questionType == 6) {
                                                        var countRowDiv = document.getElementsByClassName("rowContainer_" + questionId);
                                                        var rowOptions = countRowDiv.length;
                                                        var inputArray = [];
                                                        var arrayOfIds = $.map($(".rowContainer_" + questionId), function (n, i) {
                                                            var parts = (n.id).split("_");
                                                            var optionsValue = document.getElementById('rowOptions_' + parts[1] + '_' + parts[2]).value;
                                                            inputArray.push(optionsValue);
                                                            return n.id;
                                                        });
                                                        var inputArray2 = [];
                                                        var arrayOfIds2 = $.map($(".columnContainer_" + questionId), function (n, i) {
                                                            var parts1 = (n.id).split("_");
                                                            var optionsValue1 = document.getElementById('columnOptions_' + parts1[1] + '_' + parts1[2]).value;
                                                            inputArray2.push(optionsValue1);
                                                            return n.id;
                                                        });
                                                        var typesOfOption = 0;
                                                        var typeOfGraph = 0;
                                                        /*var radioH= document.getElementById("radioHorizontal_"+questionId).checked;
                                                         var radioV= document.getElementById("radioVertical_"+questionId).checked
                                                         if(radioH == true){
                                                         typesOfOption=0;
                                                         }else if(radioV == true){
                                                         typesOfOption=1;
                                                         }
                                                         
                                                         var radioBar= document.getElementById("radioBar_"+questionId).checked;
                                                         var radioPie= document.getElementById("radioPie_"+questionId).checked
                                                         if(radioBar == true){
                                                         typeOfGraph=0;
                                                         }else if(radioPie == true){
                                                         typeOfGraph=1;
                                                         }*/

                                                        var reqFlag = 0;
                                                        var req_question = document.getElementById("qcheckboxReq_" + questionId).checked;
                                                        if (req_question == true) {
                                                            reqFlag = 1;
                                                        } else if (req_question == false) {
                                                            reqFlag = 0;
                                                        }
                                                        saveQuestionsDetails(questionId, questionText, survey_id, questionSeq, questionType, stitle, spurpose, inputArray, reqFlag, typesOfOption, typeOfGraph, 0, 0, 0, inputArray2);
                                                    }
                                                }
                                                //alert(questionText+" "+questionType+" "+questionSeq);
                                            } else {
                                                document.getElementById("sinformationError").style.display = "inline";
                                                $.alert({
                                                    title: '',
                                                    content: 'please enter survey details first'
                                                });
                                                //alert('please enter survey details first')
                                            }
                                            //alert('save here');
                                            //saveQuestionsDetails('1',1)
                                        }

                                        function editQuestions(questionId) {
                                            var stitle = document.getElementById("stitle").value;
                                            var spurpose = document.getElementById("spurpose").value;
                                            var survey_id = document.getElementById("survey_id").value;
                                            var ques_hid = document.getElementById("qhiddenId_" + questionId).value;
                                            if (ques_hid != 0) {
                                                document.getElementById("sinformationError").style.display = "none";
                                                document.getElementById("labelQuestionError_" + questionId).style.display = "none";
                                                if (stitle.trim().length > 0 && spurpose.trim().length > 0) {
                                                    var questionText = document.getElementById("question_textarea_" + questionId).value;
                                                    var questionType = document.getElementById("mySelect_" + questionId).value;
                                                    var questionSeq = document.getElementById("seqInput_" + questionId).value
                                                    if (questionText.trim().length == 0 || questionType == -1 || questionSeq.trim().length == 0) {
                                                        document.getElementById("labelQuestionError_" + questionId).style.display = "inline";
                                                    } else {
                                                        document.getElementById("labelQuestionError_" + questionId).style.display = "none";
                                                        if (questionType == 1 || questionType == 2 || questionType == 7 || questionType == 8) {
                                                            // save short anwser.
                                                            var options = "none";
                                                            var reqFlag = 0;
                                                            var req_question = document.getElementById("qcheckboxReq_" + questionId).checked;
                                                            if (req_question == true) {
                                                                reqFlag = 1;
                                                            } else if (req_question == false) {
                                                                reqFlag = 0;
                                                            }
                                                            var typesOfOption = 0;
                                                            editQuestionsDetails(questionId, questionText, survey_id, questionSeq, questionType, stitle, spurpose, options, ques_hid, reqFlag, typesOfOption);
                                                        } else if (questionType == 3) {
                                                            var countOptDiv = document.getElementsByClassName("optionContainer_" + questionId);
                                                            var totalOptions = countOptDiv.length;
                                                            //var test=document.getElementById("mcqOptions_1_1").value;
                                                            var inputArray = [];
                                                            var arrayOfIds = $.map($(".optionContainer_" + questionId), function (n, i) {
                                                                var parts = (n.id).split("_");
                                                                var optionsValue = document.getElementById('mcqOptions_' + parts[1] + '_' + parts[2]).value;
                                                                inputArray.push(optionsValue);
                                                                return n.id;
                                                            });
                                                            /*var inputArray=[];
                                                             for(var i=0; i< totalOptions; i++){
                                                             var temp=i+1;
                                                             //alert('mcqOptions_'+questionId+'_'+temp)
                                                             var optionsValue=document.getElementById("mcqOptions_"+questionId+"_"+temp).value;
                                                             inputArray.push(optionsValue);
                                                             }*/
                                                            //alert(inputArray);
                                                            var reqFlag = 0;
                                                            var req_question = document.getElementById("qcheckboxReq_" + questionId).checked;
                                                            if (req_question == true) {
                                                                reqFlag = 1;
                                                            } else if (req_question == false) {
                                                                reqFlag = 0;
                                                            }

                                                            var radioH = document.getElementById("radioHorizontal_" + questionId).checked;
                                                            var radioV = document.getElementById("radioVertical_" + questionId).checked
                                                            var typesOfOption = 0;
                                                            if (radioH == true) {
                                                                typesOfOption = 0;
                                                            } else if (radioV == true) {
                                                                typesOfOption = 1;
                                                            }

                                                            var radioBar = document.getElementById("radioBar_" + questionId).checked;
                                                            var radioPie = document.getElementById("radioPie_" + questionId).checked
                                                            var typeOfGraph = 0;
                                                            if (radioBar == true) {
                                                                typeOfGraph = 0;
                                                            } else if (radioPie == true) {
                                                                typeOfGraph = 1;
                                                            }

                                                            editQuestionsDetails(questionId, questionText, survey_id, questionSeq, questionType, stitle, spurpose, inputArray, ques_hid, reqFlag, typesOfOption, typeOfGraph);
                                                        } else if (questionType == 4) {
                                                            var countOptDiv = document.getElementsByClassName("optionCheckBoxContainer_" + questionId);
                                                            var totalOptions = countOptDiv.length;
                                                            var inputArray = [];
                                                            var arrayOfIds = $.map($(".optionCheckBoxContainer_" + questionId), function (n, i) {
                                                                var parts = (n.id).split("_");
                                                                var optionsValue = document.getElementById('checkboxOptions_' + parts[1] + '_' + parts[2]).value;
                                                                inputArray.push(optionsValue);
                                                                return n.id;
                                                            });
                                                            /*for(var i=0; i< totalOptions; i++){
                                                             var temp=i+1;
                                                             //alert('checkboxOptions_'+questionId+'_'+temp)
                                                             var optionsValue=document.getElementById("checkboxOptions_"+questionId+"_"+temp).value;
                                                             inputArray.push(optionsValue);
                                                             }*/
                                                            var reqFlag = 0;
                                                            var req_question = document.getElementById("qcheckboxReq_" + questionId).checked;
                                                            if (req_question == true) {
                                                                reqFlag = 1;
                                                            } else if (req_question == false) {
                                                                reqFlag = 0;
                                                            }

                                                            var radioH = document.getElementById("radioHorizontal_" + questionId).checked;
                                                            var radioV = document.getElementById("radioVertical_" + questionId).checked
                                                            var typesOfOption = 0;
                                                            if (radioH == true) {
                                                                typesOfOption = 0;
                                                            } else if (radioV == true) {
                                                                typesOfOption = 1;
                                                            }

                                                            var radioBar = document.getElementById("radioBar_" + questionId).checked;
                                                            var radioPie = document.getElementById("radioPie_" + questionId).checked
                                                            var typeOfGraph = 0;
                                                            if (radioBar == true) {
                                                                typeOfGraph = 0;
                                                            } else if (radioPie == true) {
                                                                typeOfGraph = 1;
                                                            }
                                                            editQuestionsDetails(questionId, questionText, survey_id, questionSeq, questionType, stitle, spurpose, inputArray, ques_hid, reqFlag, typesOfOption, typeOfGraph);
                                                        } else if (questionType == 5) {

                                                            var reqFlag = 0;
                                                            var req_question = document.getElementById("qcheckboxReq_" + questionId).checked;
                                                            if (req_question == true) {
                                                                reqFlag = 1;
                                                            } else if (req_question == false) {
                                                                reqFlag = 0;
                                                            }
                                                            var typesOfOption = 0;
                                                            var radioBar = document.getElementById("radioBar_" + questionId).checked;
                                                            var radioPie = document.getElementById("radioPie_" + questionId).checked
                                                            var typeOfGraph = 0;
                                                            if (radioBar == true) {
                                                                typeOfGraph = 0;
                                                            } else if (radioPie == true) {
                                                                typeOfGraph = 1;
                                                            }

                                                            var lowerLimit = parseInt(document.getElementById("lowerLimit_" + questionId).value, 10);
                                                            var upperLimit = parseInt(document.getElementById("upperLimit_" + questionId).value, 10);
                                                            var step_size = parseInt(document.getElementById("step_size_" + questionId).value, 10);
                                                            if (isNaN(lowerLimit) || isNaN(upperLimit) || isNaN(step_size)) {
                                                                document.getElementById("labelQuestionError_" + questionId).innerHTML = "Please enter lower bounds, upper bounds and step size";
                                                                document.getElementById("labelQuestionError_" + questionId).style.display = "inline";
                                                            } else if ((upperLimit < lowerLimit) || (step_size > upperLimit)) {
                                                                document.getElementById("labelQuestionError_" + questionId).innerHTML = "Please enter lower bounds, upper bounds and step size";
                                                                document.getElementById("labelQuestionError_" + questionId).style.display = "inline";
                                                            } else {
                                                                editQuestionsDetails(questionId, questionText, survey_id, questionSeq, questionType, stitle, spurpose, inputArray, ques_hid, reqFlag, typesOfOption, typeOfGraph, lowerLimit, upperLimit, step_size);
                                                            }
                                                        } else if (questionType == 6) {
                                                            var countRowDiv = document.getElementsByClassName("rowContainer_" + questionId);
                                                            var rowOptions = countRowDiv.length;
                                                            var inputArray = [];
                                                            var arrayOfIds = $.map($(".rowContainer_" + questionId), function (n, i) {
                                                                var parts = (n.id).split("_");
                                                                var optionsValue = document.getElementById('rowOptions_' + parts[1] + '_' + parts[2]).value;
                                                                inputArray.push(optionsValue);
                                                                return n.id;
                                                            });
                                                            var inputArray2 = [];
                                                            var arrayOfIds2 = $.map($(".columnContainer_" + questionId), function (n, i) {
                                                                var parts1 = (n.id).split("_");
                                                                var optionsValue1 = document.getElementById('columnOptions_' + parts1[1] + '_' + parts1[2]).value;
                                                                inputArray2.push(optionsValue1);
                                                                return n.id;
                                                            });
                                                            var typesOfOption = 0;
                                                            var typeOfGraph = 0;
                                                            /*var radioH= document.getElementById("radioHorizontal_"+questionId).checked;
                                                             var radioV= document.getElementById("radioVertical_"+questionId).checked
                                                             if(radioH == true){
                                                             typesOfOption=0;
                                                             }else if(radioV == true){
                                                             typesOfOption=1;
                                                             }
                                                             
                                                             var radioBar= document.getElementById("radioBar_"+questionId).checked;
                                                             var radioPie= document.getElementById("radioPie_"+questionId).checked
                                                             if(radioBar == true){
                                                             typeOfGraph=0;
                                                             }else if(radioPie == true){
                                                             typeOfGraph=1;
                                                             }*/

                                                            var reqFlag = 0;
                                                            var req_question = document.getElementById("qcheckboxReq_" + questionId).checked;
                                                            if (req_question == true) {
                                                                reqFlag = 1;
                                                            } else if (req_question == false) {
                                                                reqFlag = 0;
                                                            }
                                                            editQuestionsDetails(questionId, questionText, survey_id, questionSeq, questionType, stitle, spurpose, inputArray, ques_hid, reqFlag, typesOfOption, typeOfGraph, 0, 0, 0, inputArray2);
                                                        }
                                                    }
                                                } else {
                                                    document.getElementById("sinformationError").style.display = "inline";
                                                    //alert('please enter survey details first');  
                                                }

                                            }
                                        }

                                        function deleteQuestions(questionid) {
                                            var survey_id = document.getElementById("survey_id").value;
                                            var hiddeQuesid = document.getElementById("qhiddenId_" + questionid).value;
                                            if (hiddeQuesid == 0) {
                                                document.getElementById("question_" + questionid).remove();
                                            } else if (hiddeQuesid > 0) {
                                                //delete from databases first
                                                var questionType = document.getElementById("mySelect_" + questionid).value;
                                                deleteQuestionsDetails(hiddeQuesid, survey_id, questionType, questionid);
                                            }
                                            // alert('delete here')
                                        }


                                        function saveQuestionsDetails(qid, question, surveyid, seqid, questype, stitle, spurpose, qOptions, reqFlag, typeofoption, typeOfGraph, lowerLimit, upperLimit, step_size, qOptions2) {
                                            var start_date = document.getElementById("datepicker1").value;
                                            start_date = start_date.split("-").reverse().join("-");
                                            var end_date = document.getElementById("datepicker2").value;
                                            end_date = end_date.split("-").reverse().join("-");
                                            var data = "question=" + question + "&qid=" + qid + "&surveyid=" + surveyid + "&seqid=" + seqid + "&questype=" + questype + "&stitle=" + stitle + "&spurpose=" + spurpose + "&optionarr=" + qOptions + "&reqflag=" + reqFlag + "&typeofoption=" + typeofoption + "&typeOfGraph=" + typeOfGraph + "&lowerLimit=" + lowerLimit + "&upperLimit=" + upperLimit + "&step_size=" + step_size + "&start_date=" + start_date + "&end_date=" + end_date + "&optionarr2=" + qOptions2;
                                            $.ajax({
                                                url: "survey_module/pages/DAO_saveQuestionsDetails.jsp",
                                                type: "GET",
                                                data: data,
                                                dataType: "json",
                                                success: set_saveQuestionsDetail,
                                                error: onError
                                            });
                                        }

                                        function set_saveQuestionsDetail(data) {
                                            var res = data.split("#");
                                            if (parseInt(res[1]) > 0) {
                                                document.getElementById("qhiddenId_" + parseInt(res[0])).value = parseInt(res[1]);
                                                document.getElementById("qsave_" + parseInt(res[0])).style.display = 'none';
                                                document.getElementById("qedit_" + parseInt(res[0])).style.display = 'inline';
                                                $.alert({
                                                    title: 'Data Saved Successfully',
                                                    content: ''
                                                });
                                                //alert("data saved successfully")
                                            } else {
                                                $.alert({
                                                    title: 'Error',
                                                    content: ''
                                                });
                                                //alert("error");
                                                // document.getElementById("").innerHTML="Error while saving...";
                                            }
                                            /*var spl_data=data.split("$");
                                             document.getElementById(spl_data[1]).value=spl_data[0];
                                             if(spl_data[1] == 'lastName'){
                                             showhints();
                                             }*/
                                        }

                                        function onError(jqXHR, textStatus, errorThrown) {
                                            $.alert({
                                                title: 'Error',
                                                content: textStatus+' '+errorThrown
                                            });
                                            //alert("Error : " + textStatus + " " + errorThrown);
                                        }

                                        function deleteQuestionsDetails(qid, surveyid, questype, dyid) {
                                            var data = "qid=" + qid + "&surveyid=" + surveyid + "&questype=" + questype + "&dyid=" + dyid;
                                            $.ajax({
                                                url: "survey_module/pages/DAO_deleteQuestionsDetails.jsp",
                                                type: "GET",
                                                data: data,
                                                dataType: "json",
                                                success: set_deleteQuestionsDetails,
                                                error: onError
                                            });
                                        }

                                        function set_deleteQuestionsDetails(data) {
                                            var res = data.split("#");
                                            if (parseInt(res[1]) > 0) {
                                                $.alert({
                                                    title: 'Data Deleted Successfully',
                                                    content: ''
                                                });
                                                //alert("data deleted successfully " + parseInt(res[0]));
                                                document.getElementById("question_" + parseInt(res[0])).remove();
                                            } else {
                                                $.alert({
                                                    title: 'Error',
                                                    content: ''
                                                });
                                                alert("error");
                                            }
                                        }

                                        function editQuestionsDetails(qid, question, surveyid, seqid, questype, stitle, spurpose, qOptions, hquesid, reqFlag, typeofoption, typeOfGraph, lowerLimit, upperLimit, step_size, qOptions2) {
                                            var start_date = document.getElementById("datepicker1").value;
                                            start_date = start_date.split("-").reverse().join("-");
                                            var end_date = document.getElementById("datepicker2").value;
                                            end_date = end_date.split("-").reverse().join("-");
                                            var data = "question=" + question + "&qid=" + qid + "&surveyid=" + surveyid + "&seqid=" + seqid + "&questype=" + questype + "&stitle=" + stitle + "&spurpose=" + spurpose + "&optionarr=" + qOptions + "&hquesid=" + hquesid + "&reqflag=" + reqFlag + "&typeofoption=" + typeofoption + "&typeOfGraph=" + typeOfGraph + "&lowerLimit=" + lowerLimit + "&upperLimit=" + upperLimit + "&step_size=" + step_size + "&start_date=" + start_date + "&end_date=" + end_date + "&optionarr2=" + qOptions2;
                                            $.ajax({
                                                url: "survey_module/pages/DAO_editQuestionsDetails.jsp",
                                                type: "GET",
                                                data: data,
                                                dataType: "json",
                                                success: set_editQuestionsDetail,
                                                error: onError
                                            });
                                        }

                                        function set_editQuestionsDetail(data) {
                                            var res = data.split("#");
                                            if (parseInt(res[1]) > 0) {
                                                //document.getElementById("qhiddenId_"+parseInt(res[0])).value=parseInt(res[1]);
                                                document.getElementById("qsave_" + parseInt(res[0])).style.display = 'none';
                                                document.getElementById("qedit_" + parseInt(res[0])).style.display = 'inline';
                                                $.alert({
                                                    title: 'Data Saved Successfully',
                                                    content: ''
                                                });
                                                //alert("data saved successfully")
                                            } else {
                                                 $.alert({
                                                    title: 'Error',
                                                    content: ''
                                                 });
                                                //alert("error");
                                                // document.getElementById("").innerHTML="Error while saving...";
                                            }
                                        }

                                        function saveSurvey() {
                                            var val=0;
                                            var surveyid = document.getElementById("survey_id").value;
                                            var stitle = document.getElementById("stitle").value;
                                            var spurpose = document.getElementById("spurpose").value;
                                            var success_title = document.getElementById("successMsg").value;
                                            var success_msg = document.getElementById("successContent").value;
                                            var error_title = document.getElementById("alerrorMsg").value;
                                            var error_msg = document.getElementById("errorContent").value;
                                            // set default border 
                                            document.getElementById("stitle").style.border = "";
                                            document.getElementById("spurpose").style.border = "";
                                            document.getElementById("datepicker1").style.border = "";
                                            document.getElementById("datepicker2").style.border = "";
                                            document.getElementById("successMsg").style.border = "";
                                            document.getElementById("successContent").style.border = "";
                                            document.getElementById("alerrorMsg").style.border = "";
                                            document.getElementById("errorContent").style.border = "";
                                            // hide error label
                                            document.getElementById("sTitleError").style.display = "none";
                                            document.getElementById("sPurposeError").style.display = "none";
                                            document.getElementById("startdateError").style.display = "none";
                                            document.getElementById("enddateError").style.display = "none";
                                            document.getElementById("sinformationError").style.display = "none";
                                            document.getElementById("successMsgError").style.display = "none";
                                            document.getElementById("successContentError").style.display = "none";
                                            document.getElementById("alerrorMsgError").style.display = "none";
                                            document.getElementById("errorContentError").style.display = "none";
                                            
                                            var start_date = document.getElementById("datepicker1").value;
                                            var end_date = document.getElementById("datepicker2").value;
                                            if (start_date.trim().length > 0) {
                                                start_date = start_date.split("-").reverse().join("-");
                                                document.getElementById("sinformationError").style.display = "none";
                                            } else {
                                                document.getElementById("datepicker1").style.border = "1px solid #CE5454";
                                                document.getElementById("startdateError").innerHTML = "Please enter a valid start date";
                                                document.getElementById("startdateError").style.display = "inline";
                                            }
                                            if (end_date.trim().length > 0) {
                                                end_date = end_date.split("-").reverse().join("-");
                                                document.getElementById("enddateError").style.display = "none";
                                            } else {
                                                document.getElementById("datepicker2").style.border = "1px solid #CE5454";
                                                document.getElementById("enddateError").innerHTML = "Please enter a valid end date";
                                                document.getElementById("enddateError").style.display = "inline";
                                            }

                                            var d1 = new Date(start_date);
                                            var d2 = new Date(end_date);
                                            if(d1 >= d2){
                                            //if (d1 > d2) {
                                                document.getElementById("datepicker2").value = "";
                                                document.getElementById("datepicker2").style.border = "1px solid #CE5454";
                                                document.getElementById("enddateError").innerHTML = "Please enter a valid end date. Start date cannot be greater than or equal to end date";
                                                document.getElementById("enddateError").style.display = "inline";
                                            }
                                            
                                            if(stitle.trim().length == 0){
                                                document.getElementById("stitle").style.border = "1px solid #CE5454";
                                                document.getElementById("sTitleError").style.display = "inline";
                                            }
                                            if(spurpose.trim().length == 0){
                                                document.getElementById("spurpose").style.border = "1px solid #CE5454";
                                                document.getElementById("sPurposeError").style.display = "inline";
                                            }
                                            
                                            if(success_title.trim().length == 0){
                                                document.getElementById("successMsg").style.border = "1px solid #CE5454";
                                                document.getElementById("successMsgError").style.display = "inline";
                                                val++;
                                            }
                                            if(error_title.trim().length == 0){
                                                document.getElementById("alerrorMsg").style.border = "1px solid #CE5454";
                                                document.getElementById("alerrorMsgError").style.display = "inline";
                                                val++;
                                            }
                                            if(success_msg.trim().length == 0){
                                                document.getElementById("successContent").style.border = "1px solid #CE5454";
                                                document.getElementById("successContentError").style.display = "inline";
                                                val++;
                                            }
                                            if(error_msg.trim().length == 0){
                                                document.getElementById("errorContent").style.border = "1px solid #CE5454";
                                                document.getElementById("errorContentError").style.display = "inline";
                                                val++;
                                            }
                                            
                                            if (stitle.trim().length > 0 && spurpose.trim().length > 0 && (d2 > d1) && val == 0) {
                                               // document.getElementById("stitle").style.border = "";
                                                //document.getElementById("sTitleError").style.display = "none";
                                                document.getElementById("sinformationError").style.display = "none";
                                                saveSurveyData(surveyid, stitle, spurpose, start_date, end_date,success_title,error_title,success_msg,error_msg);
                                            } else {
                                                //document.getElementById("sinformationError").style.display = "inline";
                                            }

                                        }

                                        function saveSurveyData(sid, title, purpose, start_date, end_date,success_title,error_title,successMsg,errorMsg) {
                                            var data = "surveyid=" + sid + "&stitle=" + title + "&spurpose=" + purpose + "&start_date=" + start_date + "&end_date=" + end_date+"&success_title="+success_title+"&error_title="+error_title+"&successMsg="+successMsg+"&errorMsg="+errorMsg;
                                            $.ajax({
                                                url: "survey_module/pages/DAO_saveSurveyData.jsp",
                                                type: "GET",
                                                data: data,
                                                dataType: "json",
                                                success: set_saveSurveyData,
                                                error: onError
                                            });
                                        }

                                        function set_saveSurveyData(data) {
                                            var res = data.split("#");
                                            if (parseInt(res[0]) == 1) {
                                                //document.getElementById("qhiddenId_"+parseInt(res[0])).value=parseInt(res[1]);
                                                document.getElementById("QuestionsContent").style.display = 'inline';
                                                document.getElementById("AddQuestions").style.display = 'inline-block';
                                                document.getElementById("survey_id").value = parseInt(res[1]);
                                                document.getElementById("snext").style.display = "none";
                                                //alert("data save successfully")
                                            } else {
                                                $.alert({
                                                    title: 'Error',
                                                    content: ''
                                                });
                                                //alert("error");
                                                // document.getElementById("").innerHTML="Error while saving...";
                                            }
                                        }
                                        function addRowOptionsGrid(id){
            var optionsDiv = document.getElementsByClassName("rowContainer_"+id);
            var nextId=optionsDiv.length;
        
            if(nextId == 0){
                nextId =1;
            }else{
                var row_opt_id=document.getElementsByClassName("rowContainer_"+id)[nextId-1].id;
                var quesid_part=row_opt_id.split("_");
                var lastOptId=parseInt(quesid_part[2])
                nextId=(lastOptId+1);
            }
        
        
            // nextId++;
            //alert('add options '+id+' '+nextId);
        
            var rowContainer = document.createElement('div');
            rowContainer.id = 'rowContainer_'+id+'_'+nextId;
            rowContainer.className = 'rowContainer_'+id;
            //rowContainer.setAttribute("style", "padding-top: 10px;");
            
            var div_row=document.createElement('div');
            div_row.className="row form-group";
            
            var div_row_content1=document.createElement('div');
            var div_row_content2=document.createElement('div');
            var div_row_content3=document.createElement('div');
            div_row_content1.className="col-md-2 col-sm-4 col-xs-4 form-group text-left";
            div_row_content1.setAttribute("style", "text-align: center;");
            div_row_content2.className="col-md-8 col-sm-6 col-xs-6 fluid form-group text-left";
            div_row_content3.className="col-md-1 col-sm-2 col-xs-2 fluid form-group text-left";
            
            var rowNum = document.createElement('label');
            rowNum.innerHTML="Row "+nextId
            //rowNum.setAttribute("style", "padding-left: 5px; padding-top: 5px; width: 40px; margin-right: 10px; font-size: 12px;");
        
            
            var rowOptions= document.createElement('input'); 
            rowOptions.type = "text";
            rowOptions.id="rowOptions_"+id+"_"+nextId;
            rowOptions.name="rowOptions_"+nextId;
            rowOptions.value="Row "+nextId;
            rowOptions.className="form-control col-md-7 col-xs-12";
            //rowOptions.setAttribute("style", "padding: 5px; width: 150px; margin-right: 10px");
        
            var qOptionRemove = document.createElement("button");
            qOptionRemove.id="qOptionRemove_"+nextId;
            qOptionRemove.className="btn btn-danger";
            qOptionRemove.innerHTML="<i class='fa fa-times' aria-hidden='true'></i>";
            //qOptionRemove.setAttribute("style", "width: 70px; background: gray; color: white; right: 0px;");
            qOptionRemove.addEventListener("click", function(){removeOption(rowContainer.id)}, false);
            
            div_row_content1.appendChild(rowNum);
            div_row_content2.appendChild(rowOptions);
            div_row_content3.appendChild(qOptionRemove);
            div_row.appendChild(div_row_content1);
            div_row.appendChild(div_row_content2);
            div_row.appendChild(div_row_content3);
            
            rowContainer.appendChild(div_row)
            
            document.getElementById('rowContainerMain_'+id).appendChild(rowContainer);
            /*document.getElementById(rowContainer.id).appendChild(rowNum);
            document.getElementById(rowContainer.id).appendChild(rowOptions);
            document.getElementById(rowContainer.id).appendChild(qOptionRemove);*/
        }
    
                                        function addColumnOptionsGrid(id){
            var optionsDiv = document.getElementsByClassName("columnContainer_"+id);
            var nextId=optionsDiv.length;
        
            if(nextId == 0){
                nextId =1;
            }else{
                var column_opt_id=document.getElementsByClassName("columnContainer_"+id)[nextId-1].id;
                var quesid_part=column_opt_id.split("_");
                var lastOptId=parseInt(quesid_part[2])
                nextId=(lastOptId+1);
            }
        
        
            // nextId++;
            //alert('add options '+id+' '+nextId);
        
            var columnContainer = document.createElement('div');
            columnContainer.id = 'columnContainer_'+id+'_'+nextId;
            columnContainer.className = 'columnContainer_'+id;
            //columnContainer.setAttribute("style", "padding-top: 10px;");
            
            var div_row=document.createElement('div');
            div_row.className="row form-group";
            
            var div_row_content1=document.createElement('div');
            var div_row_content2=document.createElement('div');
            var div_row_content3=document.createElement('div');
            div_row_content1.className="col-md-3 col-sm-4 col-xs-4 form-group text-left";
            div_row_content1.setAttribute("style", "text-align: center;");
            div_row_content2.className="col-md-8 col-sm-6 col-xs-6 fluid form-group text-left";
            div_row_content3.className="col-md-1 col-sm-2 col-xs-2 fluid form-group text-left";
            
            var columnNum = document.createElement('label');
            columnNum.innerHTML="Column "+nextId;
            //columnNum.setAttribute("style", "padding-left: 5px; padding-top: 5px; width: 60px; margin-right: 10px; font-size: 12px;");
        
            
            var columnOptions= document.createElement('input'); 
            columnOptions.type = "text";
            columnOptions.id="columnOptions_"+id+"_"+nextId;
            columnOptions.name="columnOptions_"+nextId;
            columnOptions.value="Column "+nextId;
            columnOptions.className="form-control col-md-7 col-xs-12";
            //columnOptions.setAttribute("style", "padding: 5px; width: 150px; margin-right: 10px");
        
            var qOptionRemove = document.createElement("button");
            qOptionRemove.id="qOptionRemove_"+nextId;
            qOptionRemove.className="btn btn-danger";
            qOptionRemove.innerHTML="<i class='fa fa-times' aria-hidden='true'></i>";
            //qOptionRemove.setAttribute("style", "width: 70px; background: gray; color: white; right: 0px;");
            qOptionRemove.addEventListener("click", function(){removeOption(columnContainer.id)}, false);
            
            div_row_content1.appendChild(columnNum);
            div_row_content2.appendChild(columnOptions);
            div_row_content3.appendChild(qOptionRemove);
            div_row.appendChild(div_row_content1);
            div_row.appendChild(div_row_content2);
            div_row.appendChild(div_row_content3);
            
            columnContainer.appendChild(div_row)
            document.getElementById('columnContainerMain_'+id).appendChild(columnContainer);
            /*document.getElementById(columnContainer.id).appendChild(columnNum);
            document.getElementById(columnContainer.id).appendChild(columnOptions);
            document.getElementById(columnContainer.id).appendChild(qOptionRemove);*/
        }
                                        

                                        $(document).ready(function () {
                                            $('#datepicker1').daterangepicker({
                                                singleDatePicker: true,
                                                singleClasses: "picker_1",
                                                locale: {
                                                    format: 'DD-MM-YYYY'
                                                }
                                            }, function (start, end, label) {
                                                console.log(start.toISOString(), end.toISOString(), label);
                                            }).val('');
                                            $('#datepicker2').daterangepicker({
                                                singleDatePicker: true,
                                                singleClasses: "picker_1",
                                                locale: {
                                                    format: 'DD-MM-YYYY'
                                                }
                                            }, function (start, end, label) {
                                                console.log(start.toISOString(), end.toISOString(), label);
                                            }).val('');
                                        });


                                        function toggleCheckBoxTest(id) {
                                            var checked_input = document.getElementById(id).checked;
                                            if (checked_input) {
                                                document.getElementById(id).checked = false;
                                                // document.getElementById('div_' + id).className = "icheckbox_flat-green";
                                            }
                                            if (!checked_input) {
                                                document.getElementById(id).checked = true;
                                                // document.getElementById('div_' + id).className = "icheckbox_flat-green checked";
                                            }
                                            alert("here .. ")
                                        }
        </script>
    </body>
</html>
