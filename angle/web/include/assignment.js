
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 *
 *
 *Created by Manushi
 **/

function validateURL1(url)
{
    var re = /(http|https):\/\/(\w+:{0,1}\w*)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%!\-\/]))?/;
    if (!re.test(url.value)) {
        alert("url not acceptable");
        return false;
    }
}

function datepickerValidation() {
    var d = new Date();
    var duedateStr = document.getElementById("datepicker").value;
    var d1 = new Date(duedateStr);
    var strDate = (d.getMonth() + 1) + "/" + d.getDate() + "/" + d.getFullYear();
    var d2 = new Date(strDate);
    if (d1 < d2) {
        alert("Due date can not be smaller than current date");
    }
}

function fileValidation() {
    var size = 2097152;
    var file_size = document.getElementById("myFile").files[0].size;
    if (file_size >= size) {
        alert('This file size is too large: ' + file_size / 1024 / 1024 + "MB\nAcceptable size=2MB");
        var btn = document.getElementById("sub1");
        btn.disabled = true;
    } else
    {
        var btn = document.getElementById("sub1");
        btn.disabled = false;
    }
}

function saveData(data) {
    alert(data);
    var split = data.result.split("_");
    alert(split);
    if (split[0] == "success") {
        $.alert({
            title: 'Data Save Successfully',
            content: ''
        });
    } else {
        $.alert({
            title: 'Error',
            content: ''
        });
    }
}

function createAssignment() {
    
    var groupid = document.getElementById("groupid").value;
    var name = document.getElementById("Assignment_Name").value;
    var description = document.getElementById("description").value;
    var datepicker = document.getElementById("datepicker").value;
    if ((!name == "") && (!description == "") && (!datepicker == "")) {
        var hour = document.getElementById("hour").value;
        var min = document.getElementById("min").value;
        var topicName = document.getElementById("topicName").value;
        var referenceLink = document.getElementById("referenceLink").value;
        var filename = $('input[type=file]').val().split('\\').pop();
        var myFileName = document.getElementById("myFile").value.trim();
        var myFile = document.getElementById("myFile");
        var file_data = $("#myFile").prop("files")[0]; // Getting the properties of file from file field
        var form_data = new FormData(); // Creating object of FormData class
        if (myFileName.length > 0) {
            form_data.append("a.myFile", file_data)                   // Appending parameter named file with properties of file_field to form_data
            // form_data.append("a.myFile", myFileName)
        }
        form_data.append("a.groupid", groupid)                 // Adding extra parameters to form_data
        form_data.append("a.name", name)
        form_data.append("a.description", description)
        form_data.append("a.datepicker", datepicker)
        form_data.append("a.hour", hour)
        form_data.append("a.min", min)
        form_data.append("a.topicName", topicName)
        form_data.append("a.referenceLink", referenceLink)
        form_data.append("a.myFileFileName", filename)

        $.ajax({
            url: "assignment_home.html",
            dataType: 'json',
            cache: false,
            contentType: false,
            processData: false,
            data: form_data, // Setting the data attribute of ajax with file_data
            type: 'post',
            success: saveData,
            error: onError
        });
    }
}

function onError() {
   /* $.alert({
        title: '!Done',
        content: ''
    });*/
}

function GoToAssignment(id, name)
{
    window.open('submitAssignment.html?id=' + id + "&name=" + name, '_blank');
}
function GoToUpdateAssignment(id, name)
{
    window.open('updateAssignment.html?id=' + id + "&name=" + name, '_blank');
}

function GradeAssignment(id, name)
{
    window.open('gradeAssignment.html?id=' + id + "&name=" + name, '_blank');
}

function resetForm() {
    document.getElementById("assignment_home").reset();
}

function updateView_Assignment()
{ 
    $( "#View_Assignment" ).load(window.location.href + " #View_Assignment" );
}
function updateSubmit_Assignment()
{ 
    $( "#Submit_Assignment" ).load(window.location.href + " #Submit_Assignment" );
}
function updateView_Grades()
{ 
    $( "#View_Grades").load(window.location.href + "#View_Grades" );
}
function updateCreate_Assignment()
{ 
    $( "#Create_Assignment" ).load(window.location.href + " #Create_Assignment" );
}
