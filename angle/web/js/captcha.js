/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function checkCaptcha() {
 
    var answer = document.getElementById('captchaText').value;
    if (!isStringInRange(answer, 7, 7)) {
       
        document.getElementById('captchaError').style.display = "inline";
    } else {
   
        checkCaptchaAjax(answer);

    }
}

function checkCaptchaAjax(ans) {
    var data = "answer=" + ans;
    $.ajax({
        url: "angle_group/validateCaptcha.jsp",
        type: "GET",
        data: data,
        dataType: "json",
        success: captchaSuccess,
        error: onError2
    });
}
function captchaSuccess(res) {
                            if (res.match("false") != null) {
                               
                                //document.getElementById("button").disabled=true;
                                document.getElementById('captchaError').value="";
                            document.getElementById('captchaError').style.display = "inline";
                            document.getElementById('capCheck').value = "0";
                            borderRedError("captchaText");
                        } else {
                             //document.getElementById("button").disabled=false;
                            document.getElementById('captchaError').style.display = "none";
                            document.getElementById('capCheck').value = "1";
                           // document.getElementById('captchaText').style.border = "none";
                        }
                    
}
function onError2() {
    //alert("error .. ");
}

function isStringInRange(str, minLength, maxLength) {
    var result = false;
    str = alltrim(str);
    if (isStringValid(str)) {
        if (str.length >= minLength && str.length <= maxLength) {
            result = true;
        }
    }
    return result;
}

function alltrim(str)
{
    return str.replace(/^\s+|\s+$/g, '');
}

function isStringValid(str) {
    var result = true;
    str = alltrim(str);
    if (str == "") {
        result = false;
    }
    return result;
}