/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/*
 Created by Oishi for notes*/


function createNote()
{
    var note = document.getElementById("note").value;
   
  
    if (note.trim().length !== 0)

    {document.getElementById("notes_div").innerHTML = "";
            document.getElementById("notes_div").display = "none";
        
        var GID = document.getElementById("groupId").value;


        var createdBy = document.getElementById("createdById").value;

        var noteFileName = document.getElementById("files").value;
        var noteLink = document.getElementById("referenceLink").value;
        var file_data = $("#files").prop("files")[0]; // Getting the properties of file from file field
        var form_data = new FormData(); // Creating object of FormData class
        if (noteFileName.length > 0) {
            form_data.append("n.myFile", file_data)                   // Appending parameter named file with properties of file_field to form_data
            form_data.append("n.myFileFileName", noteFileName);
        }
        form_data.append("n.note", note);
        form_data.append("n.groupId", GID);                 // Adding extra parameters to form_data
        form_data.append("n.createdById", createdBy);
        form_data.append("n.referenceLink", noteLink);
        $.ajax({
            url: "note-form.html",
            dataType: 'json',
            cache: false,
            contentType: false,
            processData: false,
            data: form_data, // Setting the data attribute of ajax with file_data
            type: 'post',
            success: successNote,
            error: function (xhr, status, error) {
                alert("done");
            }
        });
        return true;
    }
    else
    {        document.getElementById("notes_div").innerHTML = "Enter a Note";
      //  document.getElementById("submitButtonNew").disabled = true;
        document.getElementById("notes_div").style.color = "red";
        return false;
}}
function NoteValidation()
{        
     var note = document.getElementById("note").value;
   
  
    if (note.trim().length === 0)
    {
    document.getElementById("notes_div").innerHTML = "Enter a Note";
      //  document.getElementById("submitButtonNew").disabled = true;
        document.getElementById("notes_div").style.color = "red";
    }
    else
    {
        
        
            document.getElementById("notes_div").innerHTML = "";
            document.getElementById("notes_div").display = "none";
        }}

function onError()
{
    alert("!Done");
}
function successNote(data)
{
    alert('Done')

}
function validateURL()
{

    var url = document.getElementById("referenceLink").value;

    var re = /(http|https):\/\/(\w+:{0,1}\w*)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%!\-\/]))?/;
    if (!re.test(url)) {
        alert("url not acceptable");
        var btn = document.getElementById("sub");
        btn.disabled = true;
        return false;
    } else {
        alert('url acceptable');
        btn.disabled = false;
    }
}
function validate1() {
    var size = 2097152;
    var file_size = document.getElementById('files').files[0].size;
    if (file_size >= size) {
        alert('File too large' + file_size + "in bytes. Acceptable size is 2 MB.");
        var btn = document.getElementById("sub");
        btn.disabled = true;
        return false;
    } else
    {

        var btn = document.getElementById("sub");
        btn.disabled = false;
        return true;
    }
    
}

