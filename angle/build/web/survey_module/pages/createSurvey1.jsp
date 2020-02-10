<%-- 
    Document   : createSurvey
    Created on : 9 Nov, 2016, 2:52:07 PM
    Author     : dipesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<style>
    .question_block{
        padding: 5px;
        width: 70%;
    }

    .question_type_block{
        padding: 5px;
        float: left;
    }

    .question_table_block{
        width: 100%;
    }

    .question_tdleft_block{
        background: white;
        width: 70%;
    }

    .question_tdright_block{
        background: white;
        width: 70%;
    }

    .question_textarea{
        width: 450px;
    }
    
    .question_typeBlock{
        padding: 10px;
     }
</style>
<body>
    <h3>Create Survey</h3>
    <div class="form_enclosure">
        <div class="form_settings">
            <div class="form_box">
                <br><br>
                <p><input type="hidden" id="survey_id" name="survey_id" value="<s:property value="surveyId"/>"/></p>
                <p><span>Title of Survey<sup><img src="images/star.png"></sup></span>
                    <textarea rows="3" cols="50" id="stitle" name="stitle"  class="tipTip" title=""></textarea>
                    <label id="sTitleError" class="errormsg"><s:property value="getText('surveymodule.stitleerror')"/></label>
                    <label class="errorLabel"><s:property value="fieldErrors.get('stitleError').get(0)"/></label>
                </p><br/>
                <p><span>Purpose of Survey<sup><img src="images/star.png"></sup></span>
                    <textarea rows="6" cols="50" id="spurpose" name="spurpose"  class="tipTip" title=""></textarea>
                    <label id="sPurposeError" class="errormsg"><s:property value="getText('surveymodule.spurposeerror')"/></label>
                    <label class="errorLabel"><s:property value="fieldErrors.get('spurposeError').get(0)"/></label>
                </p><br/>
            </div>
            <div id="QuestionsContent" style="display: inline;">

            </div>
            <div id="AddQuestions" class="form_box" style="padding: 10px;">
                To Add New Question <input style="width: 50px; padding: 5px; background: #5A5E67; color: white;" type="button" value="ADD" onclick="createQuestions();"/>

            </div>
        </div>
        <select style="display: none;" id="hiddenSelect" class="displayselect" name="">
            <option value="-1">--Select choice--</option>
            <s:iterator value="questiontpyelist">
                <option value="<s:property value="question_type_id"/>"><s:property value="question_type"/></option>
            </s:iterator>
        </select>
    </div>
</body>
<script>
    function createQuestions(){
        var hidden_select = document.getElementById("hiddenSelect");
        
        document.getElementById("QuestionsContent").style.display="inline";
        var arr = document.getElementsByClassName("question_form_box");
        var lastid=arr.length;
        lastid++;
        var iDiv = document.createElement('div');
        iDiv.id = 'question_'+lastid;
        iDiv.className = 'question_form_box';
        iDiv.name = "questions";
        iDiv.innerHTML = "Question";
        
        document.getElementById("QuestionsContent").appendChild(iDiv);
        
        var innerDiv = document.createElement('div');
        innerDiv.id='question_typeBlock_'+lastid;
        innerDiv.className='question_typeBlock';
        
        var table = document.createElement('table');
        table.className='question_table_block';
        var tr = document.createElement('tr'); 
        var td1 = document.createElement('td');
        var td2 = document.createElement('td');
        td1.className='question_tdleft_block';
        td2.className='question_tdright_block';
        
        var input = document.createElement("textarea");
        input.cols = "50";
        input.rows = "5";
        input.className="question_textarea";
        input.setAttribute("style", "width: 450px;");
        
        var selectList = document.createElement("select");
        selectList.id = "mySelect";
        selectList.setAttribute("style", "width: 200px;");
        selectList.addEventListener("change", function(){createQuestionTypes(this.value,lastid)}, false); 
        
        td1.appendChild(input);
        td2.appendChild(selectList);
        
        
        for (i = 0; i < hidden_select.length; i++) {
            var option = document.createElement("option");
            option.value = hidden_select.options[i].value;
            option.text = hidden_select.options[i].text;
            selectList.appendChild(option);
        }
        
        
        tr.appendChild(td1);
        tr.appendChild(td2);
         
        table.appendChild(tr);
         
         
        
        //document.getElementById("question_"+lastid).appendChild(inneriDiv);
        document.getElementById("question_"+lastid).appendChild(table);
        document.getElementById("question_"+lastid).appendChild(innerDiv);
        
        var iDivButtons = document.createElement('div');
        iDivButtons.id = 'qFunctions_'+lastid;
        
        document.getElementById("question_"+lastid).appendChild(iDivButtons);
        
        var qSave = document.createElement("input");
        qSave.type = "button";
        qSave.id="qsave_"+lastid;
        qSave.value="Save";
        qSave.setAttribute("style", "width: 50px; background: #11586A; color: white;");
        qSave.addEventListener("click", function(){saveQuestions()}, false); 
        
        var qEdit = document.createElement("input");
        qEdit.type = "button";
        qEdit.id="qedit_"+lastid;
        qEdit.value="Edit";
        qEdit.setAttribute("style", "width: 50px; background: blue; color: white;");
        qEdit.addEventListener("click", function(){editQuestions()}, false);
        
        var qDelete = document.createElement("input");
        qDelete.type = "button";
        qDelete.id="qdelete_"+lastid;
        qDelete.value="Delete";
        qDelete.setAttribute("style", "width: 50px; background: red; color: white;");
        qDelete.addEventListener("click", function(){deleteQuestions()}, false);
        
        document.getElementById(iDivButtons.id).appendChild(qSave);
        document.getElementById(iDivButtons.id).appendChild(qEdit);
        document.getElementById(iDivButtons.id).appendChild(qDelete);
        
        
        alert('called')
    }
    
    function createQuestionTypes(value,divId){
        alert(divId)
        if(value == 1){
            document.getElementById('question_typeBlock_'+divId).innerHTML="";
            var shortAns= document.createElement('input'); 
            shortAns.type = "text";
            shortAns.id="shortAns_"+divId;
            shortAns.name="shortAns_"+divId;
            shortAns.value="short answer";
            shortAns.readOnly=true;
            document.getElementById('question_typeBlock_'+divId).appendChild(shortAns);
        }else if(value == 2){
            document.getElementById('question_typeBlock_'+divId).innerHTML="";
            var longAns= document.createElement("textarea");
            longAns.cols = "50";
            longAns.rows = "1";
            longAns.id="longAns_"+divId;
            longAns.className="question_textarea";
            longAns.setAttribute("style", "width: 450px;");
            longAns.value="Long Answer";
            longAns.readOnly=true;
            document.getElementById('question_typeBlock_'+divId).appendChild(longAns);
        }else if(value == 3){
            document.getElementById('question_typeBlock_'+divId).innerHTML="";
            
            var optionContainerMain = document.createElement('div');
            optionContainerMain.id = 'optionContainerMain_'+divId;
            optionContainerMain.className = 'optionContainerMain';
            
            var optionContainer = document.createElement('div');
            optionContainer.id = 'optionContainer_'+divId+'_1';
            optionContainer.className = 'optionContainer_'+divId;
            
            var radioInput = document.createElement('input');
            radioInput.setAttribute('type', 'radio');
            radioInput.disabled = true;
            radioInput.setAttribute("style", "padding: 10px; width: 20px; margin-right: 10px;");
            
            var mcqOptions= document.createElement('input'); 
            mcqOptions.type = "text";
            mcqOptions.id="mcqOptions_"+divId;
            mcqOptions.name="mcqOptions_"+divId;
            mcqOptions.value="Option 1";
            mcqOptions.setAttribute("style", "padding: 5px; width: 150px; margin-right: 10px");
            
            /*var qOptionRemove = document.createElement("input");
            qOptionRemove.type = "button";
            qOptionRemove.id="qOptionRemove_"+divId;
            qOptionRemove.value="Remove";
            qOptionRemove.setAttribute("style", "width: 70px; background: gray; color: white; right: 0px;");
            qOptionRemove.addEventListener("click", function(){removeOption(optionContainer.id)}, false);*/
            
            document.getElementById('question_typeBlock_'+divId).appendChild(optionContainerMain);
            document.getElementById(optionContainerMain.id).appendChild(optionContainer);
            
            document.getElementById(optionContainer.id).appendChild(radioInput);
            document.getElementById(optionContainer.id).appendChild(mcqOptions);
            
            var radioInput2 = document.createElement('input');
            radioInput2.setAttribute('type', 'radio');
            radioInput2.disabled = true;
            radioInput2.setAttribute("style", "padding: 10px; width: 20px; margin-right: 10px;");
            
            var addOptions = document.createElement("Label");
            addOptions.innerHTML = "Add Option";
            addOptions.setAttribute("style", "float: none; font-size: 16px; cursor:pointer; text-decoration: underline;");
            addOptions.addEventListener("click", function(){addOptionsMCQ(divId)}, false);
            
            var addOptionContainer = document.createElement('div');
            addOptionContainer.id = 'addOptionContainer_'+divId;
            addOptionContainer.setAttribute("style", "padding: 5px;");
            
            document.getElementById('question_typeBlock_'+divId).appendChild(addOptionContainer);
            //document.getElementById(addOptionContainer.id).appendChild(radioInput2);
            document.getElementById(addOptionContainer.id).appendChild(addOptions);
            //document.getElementById(optionContainer.id).appendChild(qOptionRemove);
            
        }else if(value == 4){
           document.getElementById('question_typeBlock_'+divId).innerHTML=""; 
           
            var optionCheckBoxMain = document.createElement('div');
            optionCheckBoxMain.id = 'optionCheckBoxMain_'+divId;
            optionCheckBoxMain.className = 'optionCheckBoxMain';
            
            var optionCheckBoxContainer = document.createElement('div');
            optionCheckBoxContainer.id = 'optionCheckBoxContainer_'+divId+'_1';
            optionCheckBoxContainer.className = 'optionCheckBoxContainer_'+divId;
            
            var radioInput = document.createElement('input');
            radioInput.setAttribute('type', 'checkbox');
            radioInput.disabled = true;
            radioInput.setAttribute("style", "padding: 10px; width: 20px; margin-right: 10px;");
            
            var checkboxOptions= document.createElement('input'); 
            checkboxOptions.type = "text";
            checkboxOptions.id="checkboxOptions_"+divId;
            checkboxOptions.name="checkboxOptions_"+divId;
            checkboxOptions.value="Option 1";
            checkboxOptions.setAttribute("style", "padding: 5px; width: 150px; margin-right: 10px");
            
            /*var qOptionRemove = document.createElement("input");
            qOptionRemove.type = "button";
            qOptionRemove.id="qOptionRemove_"+divId;
            qOptionRemove.value="Remove";
            qOptionRemove.setAttribute("style", "width: 70px; background: gray; color: white; right: 0px;");
            qOptionRemove.addEventListener("click", function(){removeOption(optionContainer.id)}, false);*/
            
            document.getElementById('question_typeBlock_'+divId).appendChild(optionCheckBoxMain);
            document.getElementById(optionCheckBoxMain.id).appendChild(optionCheckBoxContainer);
            
            document.getElementById(optionCheckBoxContainer.id).appendChild(radioInput);
            document.getElementById(optionCheckBoxContainer.id).appendChild(checkboxOptions);
            
            var radioInput2 = document.createElement('input');
            radioInput2.setAttribute('type', 'radio');
            radioInput2.disabled = true;
            radioInput2.setAttribute("style", "padding: 10px; width: 20px; margin-right: 10px;");
            
            var addOptions = document.createElement("Label");
            addOptions.innerHTML = "Add Option";
            addOptions.setAttribute("style", "float: none; font-size: 16px; cursor:pointer; text-decoration: underline;");
            addOptions.addEventListener("click", function(){addOptionsCheckBox(divId)}, false);
            
            var addOptionCheckBoxContainer = document.createElement('div');
            addOptionCheckBoxContainer.id = 'addOptionContainer_'+divId;
            addOptionCheckBoxContainer.setAttribute("style", "padding: 5px;");
            
            document.getElementById('question_typeBlock_'+divId).appendChild(addOptionCheckBoxContainer);
            //document.getElementById(addOptionContainer.id).appendChild(radioInput2);
            document.getElementById(addOptionCheckBoxContainer.id).appendChild(addOptions);
            //document.getElementById(optionContainer.id).appendChild(qOptionRemove);
           
        }else{
            document.getElementById('question_typeBlock_'+divId).innerHTML="";
        }
    }
    
    function saveQuestions(){
        alert('save here')
    }
    
    function editQuestions(){
        alert('edit here')
    }
    
    function deleteQuestions(){
        alert('delete here')
    }
    
    function removeOption(id){
        document.getElementById(id).remove();
        alert("remove "+id)
    }
    
    function addOptionsMCQ(id){
        var optionsDiv = document.getElementsByClassName("optionContainer_"+id);
        var nextId=optionsDiv.length;
        nextId++;
        alert('add options '+id+' '+nextId);
        
        var optionContainer = document.createElement('div');
        optionContainer.id = 'optionContainer_'+id+'_'+nextId;
        optionContainer.className = 'optionContainer_'+id;
        optionContainer.setAttribute("style", "padding-top: 10px;");
            
        var radioInput = document.createElement('input');
        radioInput.setAttribute('type', 'radio');
        radioInput.disabled = true;
        radioInput.setAttribute("style", "padding: 10px; width: 20px; margin-right: 10px;");
            
        var mcqOptions= document.createElement('input'); 
        mcqOptions.type = "text";
        mcqOptions.id="mcqOptions_"+nextId;
        mcqOptions.name="mcqOptions_"+nextId;
        mcqOptions.value="Option "+nextId;
        mcqOptions.setAttribute("style", "padding: 5px; width: 150px; margin-right: 10px");
        
        var qOptionRemove = document.createElement("input");
        qOptionRemove.type = "button";
        qOptionRemove.id="qOptionRemove_"+nextId;
        qOptionRemove.value="Remove";
        qOptionRemove.setAttribute("style", "width: 70px; background: gray; color: white; right: 0px;");
        qOptionRemove.addEventListener("click", function(){removeOption(optionContainer.id)}, false);
        
        document.getElementById('optionContainerMain_'+id).appendChild(optionContainer);
        document.getElementById(optionContainer.id).appendChild(radioInput);
        document.getElementById(optionContainer.id).appendChild(mcqOptions);
        document.getElementById(optionContainer.id).appendChild(qOptionRemove);
    }
    
    function addOptionsCheckBox(id){
        var optionsDiv = document.getElementsByClassName("optionCheckBoxContainer_"+id);
        var nextId=optionsDiv.length;
        nextId++;
        alert('add options '+id+' '+nextId);
        
        var optionCheckBoxContainer = document.createElement('div');
        optionCheckBoxContainer.id = 'optionCheckBoxContainer_'+id+'_'+nextId;
        optionCheckBoxContainer.className = 'optionCheckBoxContainer_'+id;
        optionCheckBoxContainer.setAttribute("style", "padding-top: 10px;");
            
        var checkboxInput = document.createElement('input');
        checkboxInput.setAttribute('type', 'checkbox');
        checkboxInput.disabled = true;
        checkboxInput.setAttribute("style", "padding: 10px; width: 20px; margin-right: 10px;");
            
        var checkboxOptions= document.createElement('input'); 
        checkboxOptions.type = "text";
        checkboxOptions.id="mcqOptions_"+nextId;
        checkboxOptions.name="mcqOptions_"+nextId;
        checkboxOptions.value="Option "+nextId;
        checkboxOptions.setAttribute("style", "padding: 5px; width: 150px; margin-right: 10px");
        
        var qOptionRemove = document.createElement("input");
        qOptionRemove.type = "button";
        qOptionRemove.id="qOptionRemove_"+nextId;
        qOptionRemove.value="Remove";
        qOptionRemove.setAttribute("style", "width: 70px; background: gray; color: white; right: 0px;");
        qOptionRemove.addEventListener("click", function(){removeOption(optionCheckBoxContainer.id)}, false);
        
        document.getElementById('optionCheckBoxMain_'+id).appendChild(optionCheckBoxContainer);
        document.getElementById(optionCheckBoxContainer.id).appendChild(checkboxInput);
        document.getElementById(optionCheckBoxContainer.id).appendChild(checkboxOptions);
        document.getElementById(optionCheckBoxContainer.id).appendChild(qOptionRemove);
    }
</script>

