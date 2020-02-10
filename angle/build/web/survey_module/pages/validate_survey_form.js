/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


function survey_answer(form) {
    alert("here .. ");
    var return_flag = 0;
    // getting number of questions
    var no_of_questions = document.getElementById('no_of_questions').value;
    // clearing previous errors
    for (var i = 0; i < no_of_questions; i++) {
        document.getElementById("error_" + i).innerHTML = "";
        alert("ere...")
        document.getElementById("errorDiv_" + i).style.display="none";
    }
    // validation for each question.
    for (var i = 0; i < no_of_questions; i++) {
        var question_type = document.getElementById('question_type_' + i).value;
        var question_options = document.getElementById('question_options_' + i).value;
        var required = document.getElementById('required_' + i).value;
        // question type 1 and 2 are short ans or paragraph questions
        if ((question_type == 1 || question_type == 2) && required == 1) {
            var ans = document.getElementById("ans_" + i).value;
            if (ans == "" || ans == null) {
                alert("ere...")
                document.getElementById("errorDiv_" + i).style.display="inline-block";
                document.getElementById("error_" + i).innerHTML = "This field cannot be left blank";
                return_flag++;
            }
        }
        // question type 3 and 4 atleast one option to be chosen
        var flag = false; // set to default false
        if ((question_type == 3 || question_type == 4) && required == 1) {
            for (var j = 0; j < question_options; j++) {
                flag = (flag || document.getElementById(i + "_" + j).checked);
            }
            if (flag == false) {
                alert("ere...")
                document.getElementById("error_" + i).innerHTML = "Please choose atleast one option";
                return_flag++;
            }
        }
        var err_row = 0; // set to default false
        if (question_type == 6 && required == 1) {
            var row_size = document.getElementById("row_size_" + i).value;
            for (var k = 0; k < row_size; k++) {
                var flag = false;
                for (var j = 0; j < question_options; j++) {
                    flag = (flag || document.getElementById(i + "_" + k + "_" + j).checked);
                }
                if (flag == false) {
                    err_row++;
                }
            }
            if (err_row > 0) {
                alert("ere...")
                document.getElementById("error_" + i).innerHTML = "Please choose atleast one option for all rows";
                return_flag++;
            }
        }
    }

    return false;
    if (return_flag == 0)
        return false;
    else
        return false;
}