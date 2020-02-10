/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function getXMLObject() //XML Object
{
    var xmlHttp = false;
    try {
        xmlHttp = new ActiveXObject("Msxml2.XMLHTTP") //For old Microsoft Browers
    }catch(e) {
        try{
            xmlHttp = new ActiveXObject("Microsoft.XMLHTTP") // For Microsoft IE 6.0+
        }catch(e2) {
            xmlHttp = false; // No browser accepts the XMLHTTP Object then false
        }
    }
    if(!xmlHttp && typeof XMLHttpRequest != 'undefined') {
        xmlHttp = new XMLHttpRequest(); // For Mozilla, opera Browers
    }
    return xmlHttp; //Mandatory statement returning the ajax object created
}

var xmlhttp = new getXMLObject(); //xmlhttp holds the ajax objec
function changeImage() {
        if(xmlhttp) {
            xmlhttp.open("POST","captchaImage",true);
            xmlhttp.onreadystatechange = handleServerResponse;
            xmlhttp.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
            xmlhttp.send(null);
        }

}

function handleServerResponse() {
    if(xmlhttp.readyState == 4){
        if( xmlhttp.status == 200) {
           var obj = document.getElementById('imgCaptcha');
           var src = obj.src;
           obj.src = "/images/loading.gif";
           var pos = src.indexOf('?');
           if (pos >= 0) {
              src = src.substr(0, pos);
           }
           var date = new Date();
           obj.src = src + '?v=' + date.getTime();

        }else {
            alert("ajax captcha error during ajax call. Please try again");
        }
    }
}

function addElement() {
  var ni = document.getElementById('myDiv');
  var newdiv = document.createElement('img');
  var divIdName = 'myImgDiv';
  newdiv.setAttribute('id',divIdName);
  newdiv.setAttribute('src', 'captchaImage');
  ni.appendChild(newdiv);
}