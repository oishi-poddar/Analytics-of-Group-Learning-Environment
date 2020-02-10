var res;
var mp = {};
var x = {};
var userId="";
var check;
 var GroupData = {};
function editGroup(gname, gid)
{
    document.getElementById("groupname1").value = gname;
    document.getElementById("hiddenId").value = gid;
}
function GoTo(gid, gcode)
{
    window.location.href = 'groupTopics.html?id=' + gid + "&groupCode=" + gcode;
}
function set(value) {
    if (value == "Student")
        document.getElementById("type").value = 1;
    else
        document.getElementById("type").value = 2;
}


//Function to check validity of group name    

function groupNameValidation()
{
    groupname = document.getElementById("groupName").value;
    document.getElementById("groupName_div").innerHTML = "";
    document.getElementById("submitButtonNew").disabled = false;
    if (groupname.trim().length == 0) {
        document.getElementById("groupName_div").innerHTML = "Enter a Group Name";
        document.getElementById("submitButtonNew").disabled = true;
        document.getElementById("groupName_div").style.color = "red";
    } else
    {
        var reg = /^[a-zA-Z0-9\s]+$/;
        if (reg.test(groupname))
        {
            document.getElementById("groupName_div").innerHTML = "";
            document.getElementById("groupName_div").display = "none";
            document.getElementById("submitButtonNew").disabled = false;
        } else
        {
            document.getElementById("groupName_div").innerHTML = "";
            document.getElementById("groupName_div").innerHTML = "Invalid group name";
            document.getElementById("groupName_div").style.color = "red";
            document.getElementById("submitButtonNew").disabled = true;
        }
    }
}
function validateDescription()
{
    var description = document.getElementById("message").value;
    document.getElementById("desc_error").innerHTML = "";
    document.getElementById("submitButtonNew").disabled = false;
    if (description.trim().length == 0) {
        document.getElementById("desc_error").innerHTML = "Enter a Description";
        document.getElementById("desc_error").style.color = "red";
        document.getElementById("submitButtonNew").disabled = true;
    } else {
        document.getElementById("submitButtonNew").disabled = false;
        document.getElementById("desc_error").innerHTML = "";
    }
}

function FormValidation()
{   ////alert("hey");
    var count = 0;
    var val = document.getElementById("sbTwo").value;
    var val2 = document.getElementById("selectBox2").value;
    var val3 = document.getElementById("message").value;
    var val4 = document.getElementById("groupName").value;

    //var description= document.getElementById("message").value;
    document.getElementById("select_error").innerHTML = "";
    document.getElementById("select_error2").innerHTML = "";
    document.getElementById("desc_error").innerHTML = "";
    document.getElementById("groupName_div").innerHTML = "";
    document.getElementById("desc_error").style.display = "none";
    document.getElementById("desc_error").style.display = "none";


    if (val == "")
    { //////alert("Enter defalut Profile ");
        document.getElementById("select_error").innerHTML = "Please select the profiles of your group ";
        document.getElementById("select_error").style.color = "red";

        count++;
    }
    if (val2 == "-1")
    { ////alert("Enter defalut Profile ");
        document.getElementById("select_error2").innerHTML = "Please select a default Profile";
        document.getElementById("select_error2").style.color = "red";
        count++;
    }
    ////alert(val3.length);
    if (val3 == "")
    {
        document.getElementById("desc_error").innerHTML = "Enter a description ";
        document.getElementById("desc_error").style.color = "red";
        document.getElementById("desc_error").style.display = "inline";

        count++;
    }
    if (val4 == "")
    {
        document.getElementById("groupName_div").innerHTML = "Please Enter  a Group Name ";
        document.getElementById("groupName_div").style.color = "red";
        count++;
    }
    if (count > 0)
    {
        return false;
    }
}



function clearModal()
{
    document.createGroup.reset();
    document.getElementById("link_div").innerHTML = "";
    document.getElementById("link_div1").innerHTML = "";
}


function checkExisting(gname) {
    document.getElementById("Button").disabled = false;
    var gname = document.getElementById("groupname").value;
    var uid = document.getElementById("hiddenUserId").value;
    document.getElementById("groupname").style.border = "";
    document.getElementById("groupError").style.display = "none";
    var reg = /^[a-zA-Z0-9\s]+$/;
    if (reg.test(gname))
    {
        ////////alert(gname)
        document.getElementById("groupError").style.display = "none";
        validateGroupName(gname, uid);
    } else {
        document.getElementById("groupError").style.display = "inline";
        document.getElementById("link_div").innerHTML = "";
        document.getElementById("link_div").innerHTML = "Invalid group name";
        document.getElementById("link_div").style.color = "red";
        document.getElementById("Button").disabled = true;
    }

}


function validateGroupName(gname, uid) {
    var data = "groupname=" + gname + "&uida=" + uid;

    $.ajax({
        url: "angle_group/DAO_checkGroupName.jsp",
        type: "GET",
        data: data,
        dataType: "json",
        success: validGroupName,
        error: onError
    });
}


function validGroupName(data) {

    if (data > 0) {
        document.getElementById("link_div").innerHTML = "";
        document.getElementById("link_div").innerHTML = "group name approved";
        document.getElementById("link_div").style.color = "green";
        document.getElementById("Button").disabled = false;
        document.getElementById("link_div1").innerHTML = "";
        document.getElementById("link_div1").innerHTML = "group name approved";
        document.getElementById("link_div1").style.color = "green";
        document.getElementById("Button1").disabled = false;
    } else {
        document.getElementById("link_div").innerHTML = "";
        document.getElementById("link_div").innerHTML = "Group Name already taken";
        document.getElementById("link_div").style.color = "red";
        document.getElementById("Button").disabled = true;
        document.getElementById("link_div1").innerHTML = "";
        document.getElementById("link_div1").innerHTML = "Group Name already taken";
        document.getElementById("link_div1").style.color = "red";
        document.getElementById("Button1").disabled = true;
    }
}

function onError() {

    alert("Try Again");
}

//  Function to show modal for joining group using group code

function joinGroupModal()
{
    $('#joingroupModal').modal('show');
}


//Function to show create group form

function showForm()
{
    document.getElementById("userProfile").style.display = "none";
    document.getElementById('row1').style.display = "block";
    document.getElementById('row2').style.display = "none";
    document.getElementById('all_groups').style.display = "none";

}

//Function to hide create group form


function hideForm()
{
    document.getElementById("userProfile").style.display = "none";
    document.getElementById('row1').style.display = "none";
    document.getElementById('row2').style.display = "block";
    document.getElementById('pagination').style.display = "none";
    document.getElementById('all_groups').style.display = "none";

}

function showAllGroups()
{
    document.getElementById('pagination').style.display = "block";
    document.getElementById("userProfile").style.display = "none";
    document.getElementById("all_groups").style.display = "block";
    document.getElementById('row1').style.display = "none";
    document.getElementById('row2').style.display = "none";
}

//        Function to clear the contents of create group form on it's close 


function clearForm()
{
    document.createGroup.reset();
    document.getElementById("link_div").innerHTML = "";
    document.getElementById("link_div1").innerHTML = "";
}

//Function to Load rights for a profile



function searchGroup(key)
{
    var groupname = "group=" + key;
    $.ajax({
        url: "angle_group/SearchGroup.jsp",
        type: "GET",
        data: groupname,
        dataType: "json",
        success: GroupsList,
        error: emptyGroups
    });
}
function emptyGroups()
{

    document.getElementById("groups_list").innerHTML = "";
}

function openGroupPage(groupName, groupId)
{
    window.location.href = "MainGroupPage.html?groupId=" + groupId;
}
function GroupsList(data)
{
    document.getElementById("groupstbody").innerHTML = "";
    var tbody = document.getElementById("groupstbody");
    data2 = String(data);
    res2 = data2.split(":");
    len = res2.length;
    var item = document.createElement("tr");
    item.id = res2[0];
    var item2 = document.createElement("td");
    item2.innerHTML = res2[0];
    item2.id = res2[1];
    item2.style.cursor = "pointer";
    item2.addEventListener("click", function () {
        openGroupPage(res2[0], res2[1])
    }, false);
    item.appendChild(item2);
    tbody.appendChild(item);
    for (i = 2; i < len - 1; i += 2)
    {
        var item = document.createElement("tr");
        var item2 = document.createElement("td");
        item2.innerHTML = res2[i].substring(1, (res2[i].length));
        item2.id = res2[i + 1];
        item2.style.cursor = "pointer";
        item2.addEventListener("click", function () {
            openGroupPage(this.innerHTML, this.id)
        }, false);

        item.appendChild(item2);
        tbody.appendChild(item);
    }

//    $('#groups_list').html(temmp);
}

/*
 * Rights of the Profile
 * @param {type} pid
 * @param {type} features
 * @returns {undefined}
 */
function rights(pid)
{
    var data;
    data = "pid=" + pid;

    $.ajax({
        url: "angle_group/DAO_getRightsOfProfiles.jsp",
        type: "GET",
        data: data,
        dataType: "json",
        success: rightsOfProfile,
        error: onError
    });

}


function rights2(pid, gid , chk)
{
    alert(pid+ " " + gid + " "+ chk);
    check = chk;
    alert(check);
    var data;
    data = "gid=" + gid;
    $.ajax({
        url: "angle_group/DAO_FeaturesFromGroupPage.jsp",
        type: "GET",
        data: data,
        dataType: "json",
        success: convertToString,
        error: onError
    });
    //alert(pid);
    var data2 = "pid=" + pid;
    
    //alert("data2" + data2);
    $.ajax({
        url: "angle_group/DAO_getRightsOfProfiles.jsp",
        type: "GET",
        data: data2,
        dataType: "json",
        success: rightsOfProfile2,
        error: onError
    });


}
/*
 * convert the map back to String for further checks
 * @param {type} result
 * @returns {undefined}
 */
function convertToString(result) {
    var removeSplit = result.split(":");
    alert(removeSplit);
    for (var j in removeSplit)
    {
        if (removeSplit[j] != "null")
        {
            if(removeSplit[j] == "Notes")
            {
                alert("hello");
                x["Note"] = 1;
            }
            else
            {   
                x[removeSplit[j]] = 1;
            }
        }
    }
    
}


/*
 * show Profiles Available in Modal
 * @returns {undefined}
 */
function showProfiles(pid,gid,uid) {
    alert("hey in show Profiles"+uid);
    userId=uid;
    alert(typeof(userId)+" "+typeof(uid));
    alert("asdasadsadsads"+userId);
    
    document.getElementById("lele").innerHTML="";
    var splitWithComma = pid.split(",");
    splitWithComma[0] = splitWithComma[0].substring(1);
    splitWithComma[splitWithComma.length - 1] = splitWithComma[splitWithComma.length - 1].substring(0, splitWithComma[splitWithComma.length - 1].length - 1);
    var tempMap = {};
    for (var i = 0; i < splitWithComma.length; i++) {
        var s = splitWithComma[i].toString();
        var s2 = s.split("=");
        tempMap[s2[0]] = s2[1];

    }
    
    for (i in tempMap) {
        var data = document.createElement("span");
        data.innerHTML=tempMap[i];
        var input = document.createElement('input');
        input.value=i;
        input.type="radio";
        input.id=i.trim();
        input.name="name";
        input.addEventListener("click", function () {
                    rights2(this.id,gid,'0')
                }, false);
                
        document.getElementById("lele").appendChild(data);
        document.getElementById("lele").appendChild(input);
    }
    $('#editModal').modal('show');
}
/*
 * getTheFeatureList
 * @param {type} val
 * @returns {undefined}
 */
function getFeaturesList(val) {
    if (val.checked)
    {
        val.value = (val.value).charAt(0).toUpperCase() + (val.value).slice(1);
        if (val.value == "Notes")
            val.value = "Note";
        x[val.value] = 1;
        //    //alert(x[val.value]);
    } else
    {
        if (val.value == "Notes")
            val.value = "Note";
        x[val.value] = 0;
    }

}
/*
 * 
 * @param {type} data
 * @returns {undefined}
 * @author Sakshi And Apurv
 */
function rightsOfProfile2(data)
{   
    alert(data);
    if(check == '0')
    {
        document.getElementById("text").style = "visibility:hidden;";
        document.getElementById("newProfile").style = "visibility:hidden;";
        document.getElementById("newProfileLabel").style = "visibility:hidden;";
        document.getElementById("newProfile").style = "visibility:hidden;";
        document.getElementById("Button2").style = "visibility:hidden;";
        
        
    }
    else
    {
            document.getElementById("text").style = "visibility:visible;";
            document.getElementById("newProfile").style = "visibility:visible;";
            document.getElementById("newProfileLabel").style = "visibility:visible;";
            document.getElementById("newProfile").style = "visibility:visible;";
            document.getElementById("Button2").style = "visibility:visible;";
         
    }
    for(var mm in  x)
    {
        alert(mm + " map " +x[mm]);
    }
    document.getElementById("replace").innerHTML="";
    //alert(data);
    document.getElementById("Button2").disabled = true;
    res = data.split(":");
    var i = 2;
    var len = res.length;
    var text = "";
    var profileId = res[0];

    if (profileId == "1" || profileId == "2") {
        x['Admin'] = 1;
    }

    var table = document.createElement("table");
    table.border = 1;
    table.cellspacing = 10;
    var featureRights = {};
    if (x['Admin'])
    {
        var lis = [];
        lis.push('Accept Invite1');
        lis.push('Send Invite1');
        lis.push('Modify Group1');
        featureRights['Admin'] = lis;
    }
    x['Admin'] = 0;
    for (var j in x)
    {
        alert(j+" "+x[j]);
        var lis = [];
        if (x[j])
        {
            for (i = 2; i < len - 1; i++)
            {
                if ((res[i].substring(0, (res[i].length - 1)).indexOf(j) != -1) || (res[i].substring(0, (res[i].length - 1)) == "View Grades" && (j == "Assignment" || j == "Quiz")))
                {
                    lis.push(res[i]);
                }
            }
            featureRights[j] = lis;
            alert(featureRights[j]);
        }
    }
    var temp = "";
    if (profileId == "1" || profileId == "2") {
        x['Admin'] = 1;
    } else
        x['Admin'] = 0;


    for (var i = 0, keys = Object.keys(x); i < (Object.keys(x).length); i += 2)
    {
        var maindiv = document.createElement("div");
        maindiv.className = "row";
        if (x[keys[i]])
        {
            var row1 = document.createElement("span");
            row1.className = "col-md-6";
            //row1.className = "col-md-"+len;
            var divHead = document.createElement("div");
            var divBody = document.createElement("div");
            var table = document.createElement("table");
            table.border = 1;
            var h4 = document.createElement("h4");
            h4.innerHTML = keys[i];
            divHead.appendChild(h4);
            for (j in featureRights[keys[i]])
            {
                var t = featureRights[keys[i]][j];

                var chk = featureRights[keys[i]][j].charAt(featureRights[keys[i]][j].length - 1);

                var tableRow = document.createElement("tr");
                var tableData = document.createElement("td");
                var tableData2 = document.createElement("td");
                tableData.style = "padding:5px;";
                tableData2.style = "padding:5px;";
                var input = document.createElement("input");
                input.id = featureRights[keys[i]][j];
                mp[featureRights[keys[i]][j].substring(0, featureRights[keys[i]][j].length - 1)] = chk;
                input.type = "checkbox";
                input.addEventListener("click", function () {
                    functn(this.id)
                }, false);
                if (chk == '1')
                {
                    input.checked = "true";
                }
                tableData2.appendChild(input);
                tableData.innerHTML = featureRights[keys[i]][j].substring(0, featureRights[keys[i]][j].length - 1);
                tableRow.appendChild(tableData);
                tableRow.appendChild(tableData2);
                table.appendChild(tableRow);
                divBody.appendChild(table);

            }

            row1.appendChild(divHead);
            row1.appendChild(divBody);

            maindiv.appendChild(row1);
        }
        if (x[keys[i + 1]])
        {
            var row1 = document.createElement("span");
            //row1.className = "col-md-"+len;
            row1.className = "col-md-6";
            var divHead = document.createElement("div");
            var divBody = document.createElement("div");
            var table = document.createElement("table");
            table.border = 1;
            var h4 = document.createElement("h4");
            h4.innerHTML = keys[i + 1] + "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp";
            divHead.appendChild(h4);
            for (j in featureRights[keys[i + 1]])
            {
                var t = featureRights[keys[i + 1]][j];
                var chk = featureRights[keys[i + 1]][j].charAt(featureRights[keys[i + 1]][j].length - 1);

                var tableRow = document.createElement("tr");
                var tableData = document.createElement("td");
                var tableData2 = document.createElement("td");
                tableData.style = "padding:5px;";
                tableData2.style = "padding:5px;";

                var input = document.createElement("input");
                input.id = featureRights[keys[i + 1]][j];
                mp[featureRights[keys[i + 1]][j].substring(0, featureRights[keys[i + 1]][j].length - 1)] = chk;

                input.type = "checkbox";
                input.addEventListener("click", function () {
                    functn(this.id)
                }, false);
                if (chk == '1')
                {
                    input.checked = "true";
                }
                tableData2.appendChild(input);
                tableData.innerHTML = featureRights[keys[i + 1]][j].substring(0, featureRights[keys[i + 1]][j].length - 1);
                tableRow.appendChild(tableData);
                tableRow.appendChild(tableData2);
                table.appendChild(tableRow);
                divBody.appendChild(table);

            }

            row1.appendChild(divHead);
            row1.appendChild(divBody);
            maindiv.appendChild(row1);
            //outerRow.appendChid(row);

        }
        document.getElementById("replace").appendChild(maindiv);
    }
    $('#rightsModal').modal('show');
    document.getElementById("rightsModal").style="z-index:9999;";

}


function rightsOfProfile(data)
{    document.getElementById("replace").innerHTML="";
    document.getElementById("Button2").disabled = true;
    res = data.split(":");
    //alert(res);
    var i = 2;
    var len = res.length;
    var text = "";
    var profileId = res[0];

    if (profileId == "1" || profileId == "2") {
        x['Admin'] = 1;
        //featureRights["Admin"] = [];
        //featureRights["Admin"] = x['Admin'];
    }

    var table = document.createElement("table");
    table.border = 1;
    table.cellspacing = 10;
    var featureRights = {};
    if (x['Admin'])
    {
        var lis = [];
        lis.push('Accept Invite1');
        lis.push('Send Invite1');
        lis.push('Modify Group1');
        featureRights['Admin'] = lis;
    }
    x['Admin'] = 0;
    for (var j in x)
    {
        var lis = [];
        //alert("name "+ j + " value " + x[j]);
        if (x[j])
        {
            for (i = 2; i < len - 1; i++)
            {
                if ((res[i].substring(0, (res[i].length - 1)).indexOf(j) != -1) || (res[i].substring(0, (res[i].length - 1)) == "View Grades" && (j == "Assignment" || j == "Quiz")))
                {
                    ////alert(res[i]);
                    lis.push(res[i]);
                    ////alert(lis);
                }
            }
            //alert(j);
            featureRights[j] = lis;
            //alert(featureRights[j]);
        }
    }
    ////alert(Object.keys(x).length);
    var temp = "";
    if (profileId == "1" || profileId == "2") {
        x['Admin'] = 1;
    } else
        x['Admin'] = 0;


    for (var i = 0, keys = Object.keys(x); i < (Object.keys(x).length); i += 2)
    {
        var maindiv = document.createElement("div");
        maindiv.className = "row";
        if (x[keys[i]])
        {
            var row1 = document.createElement("span");
            row1.className = "col-md-6";
            //row1.className = "col-md-"+len;
            var divHead = document.createElement("div");
            var divBody = document.createElement("div");
            var table = document.createElement("table");
            table.border = 1;
            var h4 = document.createElement("h4");
            h4.innerHTML = keys[i];
            divHead.appendChild(h4);
            for (j in featureRights[keys[i]])
            {
                var t = featureRights[keys[i]][j];

                var chk = featureRights[keys[i]][j].charAt(featureRights[keys[i]][j].length - 1);

                var tableRow = document.createElement("tr");
                var tableData = document.createElement("td");
                var tableData2 = document.createElement("td");
                tableData.style = "padding:5px;";
                tableData2.style = "padding:5px;";
                var input = document.createElement("input");
                input.id = featureRights[keys[i]][j];
                mp[featureRights[keys[i]][j].substring(0, featureRights[keys[i]][j].length - 1)] = chk;
                input.type = "checkbox";
                input.addEventListener("click", function () {
                    functn(this.id)
                }, false);
                if (chk == '1')
                {
                    input.checked = "true";
                }
                tableData2.appendChild(input);
                tableData.innerHTML = featureRights[keys[i]][j].substring(0, featureRights[keys[i]][j].length - 1);
                tableRow.appendChild(tableData);
                tableRow.appendChild(tableData2);
                table.appendChild(tableRow);
                divBody.appendChild(table);

            }

            row1.appendChild(divHead);
            row1.appendChild(divBody);

            maindiv.appendChild(row1);
        }
        if (x[keys[i + 1]])
        {
            var row1 = document.createElement("span");
            //row1.className = "col-md-"+len;
            row1.className = "col-md-6";
            var divHead = document.createElement("div");
            var divBody = document.createElement("div");
            var table = document.createElement("table");
            table.border = 1;
            var h4 = document.createElement("h4");
            h4.innerHTML = keys[i + 1] + "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp";
            divHead.appendChild(h4);
            for (j in featureRights[keys[i + 1]])
            {
                var t = featureRights[keys[i + 1]][j];
                var chk = featureRights[keys[i + 1]][j].charAt(featureRights[keys[i + 1]][j].length - 1);

                var tableRow = document.createElement("tr");
                var tableData = document.createElement("td");
                var tableData2 = document.createElement("td");
                tableData.style = "padding:5px;";
                tableData2.style = "padding:5px;";

                var input = document.createElement("input");
                input.id = featureRights[keys[i + 1]][j];
                mp[featureRights[keys[i + 1]][j].substring(0, featureRights[keys[i + 1]][j].length - 1)] = chk;

                input.type = "checkbox";
                input.addEventListener("click", function () {
                    functn(this.id)
                }, false);
                if (chk == '1')
                {
                    input.checked = "true";
                }
                tableData2.appendChild(input);
                tableData.innerHTML = featureRights[keys[i + 1]][j].substring(0, featureRights[keys[i + 1]][j].length - 1);
                tableRow.appendChild(tableData);
                tableRow.appendChild(tableData2);
                table.appendChild(tableRow);
                divBody.appendChild(table);

            }

            row1.appendChild(divHead);
            row1.appendChild(divBody);
            maindiv.appendChild(row1);
            //outerRow.appendChid(row);

        }
        document.getElementById("replace").appendChild(maindiv);
    }

}

function resetModal()
{

//    document.getElementById("rights_modal").innerHTML = "";
//    document.getElementById("error_div").innerHTML = "";
//    document.getElementById("newProfile").value = "";
  //  document.getElementById("Button2").disabled = false;
}

//            Function to check if a profile already exists or not


function checkExistingProfile()
{
    document.getElementById("Button2").disabled = true;
    var profileName = document.getElementById("newProfile").value;
    var reg = /^[a-zA-Z0-9\s]+$/;
    document.getElementById("error_div").innerHTML = "";
    if (profileName.trim().length == 0)
    {
        document.getElementById("error_div").style.innerHTML = "Enter a Profile Name";
    } else
    {
        if (reg.test(profileName))
        {
            document.getElementById("error_div").style.innerHTML = "";
            var data = "profileName=" + profileName;
            // ////alert("data : " + data);
            $.ajax({
                url: "angle_group/DAO_checkProfileName.jsp",
                type: "GET",
                data: data,
                dataType: "json",
                success: validProfileName,
                error: onError
            });
        } else
        {
            document.getElementById("error_div").style.innerHTML = "Invalid Profile Name";
            document.getElementById("error_div").style.color = "red";
        }

    }
}


function validProfileName(data)
{
    document.getElementById("Button2").disabled = true;
    if (data > 0)
    {
        document.getElementById("error_div").innerHTML = "Profile Name Already Exists.";
        document.getElementById("error_div").style.color = "red";
        document.getElementById("Button2").disabled = true;
    } else {

        document.getElementById("error_div").innerHTML = "Valid Profile Name";
        document.getElementById("error_div").style.color = "green";
        document.getElementById("Button2").disabled = false;
    }
}



//           Function called when checkbox in Profile Rights modal is toggeled


function functn(se)
{
    if (mp[se.substring(0, se.length - 1)] == "1") {
        mp[se.substring(0, se.length - 1)] = "0";
        //alert(se.substring(0, se.length - 1) + " " + mp[se.substring(0, se.length - 1)]);
    } else {
        mp[se.substring(0, se.length - 1)] = "1";
        //alert(se.substring(0, se.length - 1) + "  " + mp[se.substring(0, se.length - 1)]);
    }

}
/*
 * Converts The Map Back To String 
 * 
 * 
 */
function convertMapToString()
{
    var str = "";
    for (var i in mp)
    {
        str += i + mp[i] + ":";
    }
    str = str.substring(0, str.length - 1);
    //alert(str);
    insertNewProfile(str);
}

/* 
 * 
 * Function To insert new Profile in database
 * 
 */


function insertNewProfile(rights)
{
    var data;

    var profileName = document.getElementById("newProfile").value;


    data = "rights=" + rights + "&profileName=" + profileName;

    $.ajax({
        url: "angle_group/DAO_addNewProfile.jsp",
        type: "GET",
        data: data,
        dataType: "json",
        success: newProfileAdded,
        error: onError
    });


}
function newProfileAdded(data)
{

    if (data)
    {
        var temp = "";
        temp = data.split(":");

        if (!alert('Profile Added Successfully'))
        {
            var x = document.getElementById("sbTwo");
            var option = document.createElement("option");
            option.text = temp[1];
            option.id = temp[0];
            option.value = temp[0];
            option.selected = true;
            option.checked = true;
            x.add(option);

            var y = document.getElementById("selectBox2");
            var newOption = document.createElement("option");
            newOption.text = temp[1];
            newOption.id = temp[0];
            newOption.value = temp[0];
            //alert(y.value);
            y.add(newOption);
        }
    } else
    {

    }

}


/*
 * Show the members
 * @returns {type=undefined} 
 * @author Apurv And Sakshi
 */
function showMembers()
{
    document.getElementById("userProfile").style.display = "none";
    document.getElementById("posts").style.display = "none";
    document.getElementById("groupPage").style.display = "none";
    document.getElementById("membersList").style.display = "block";
}






//  Function to show modal for joining group using group code

function joinGroupModal()
{
    $('#joingroupModal').modal('show');
}
function joinGroupModal1(va)
{
    //alert(va);
    $('#joingroupModal').modal('show');
    document.getElementById("code").value = va;
}
$(function () {
    function moveItems(origin, dest) {
        $(origin).find(':selected').appendTo(dest);
    }

    function moveAllItems(origin, dest) {
        $(origin).children().appendTo(dest);
    }

    $('#left').click(function () {
        moveItems('#sbTwo', '#sbOne');
    });

    $('#right').on('click', function () {
        moveItems('#sbOne', '#sbTwo');
    });

    $('#leftall').on('click', function () {
        moveAllItems('#sbTwo', '#sbOne');
    });

    $('#rightall').on('click', function () {
        moveAllItems('#sbOne', '#sbTwo');
    });
});

//Function to edit Role Of A Group Member

function editRole(gid)
{  //alert("heyyyyy heyyyyyy "+gid+"in edit role gid"+userId);
//    var data;
  var val = document.getElementsByName("name");
   for(var i in val)
   {
       if(val[i].checked)
       {   
           //alert(val[i].value);
          var  pid = val[i].value.trim();
       }
        
   }
   
    data = "pid=" + pid + "&gid=" + gid + "&uid=" + userId;
    //alert("heyyy data" + data);
    $.ajax({
        url:"angle_group/DAO_editRoleOfMember.jsp",
        type: "GET",
        data : data,
        dataType : "json",
        success : roleChanged,
        error : onError
  
    });
 
}

function roleChanged(data)
{
    //alert("data heyyyyyyyyyyyyy"+data );
   // alert("type" + typeof(data));
    if(data != "null")
    {   
        alert("profile Added Successfully");
        document.getElementById("roleOfMember").innerHTML=data;
    }
    $('#menu').load("../include/menu2.html");
}
/*
 * @author
 * @param {type} gid
 * @returns {undefined}
 */
function copyGroup(gid){
    //alert("in copy group"+gid);
    grpId = gid;
    data = "gid="+gid;
    $.ajax({
        url:"angle_group/DAO_getCopiableGroups.jsp",
        type: "GET",
        data : data,
        dataType : "json",
        success : copiableGroups,
        error : onError
  
    });
}
/*
 * @returns {type:undefined;} 
 * @author Sakshi & Apurv
 */
function copiableGroups(data){
    //alert(data);
    var arr1 = [];
    var arr2 = [];
    var arr3 = [];
    var arr = [];
    var others ={};
    GroupData = data;
    //alert(Object.keys(data));
    arr1 = Object.keys(data);
    for(var i=0; i<arr1.length;i++)
    {
        if(arr1[i] === "features")
            arr3 = data[arr1[i]];
        else if(arr1[i] === "profiles")
        {        
            for(var j= 0; j < data[arr1[i]].length; j++)
            {    
                arr2.push(data[arr1[i]][j]);
            }
        }
    }
    for(var i = 0 ; i < arr1.length ;i++)
    {
        if(arr1[i] != "profiles" || arr1[i] != "features")
        {
            others[arr1[i]] = data[arr1[i]];
            //alert(others[arr1[i]]);
        }
    }
    if(others["groupType"]==1)
        document.getElementById("groupType").innerHTML = "Peer To Peer";
    else
        document.getElementById("groupType").innerHTML = "Mentor To Student";
     if(others["groupStatus"]==1)
        document.getElementById("groupStatus").innerHTML = "Private";
    else
        document.getElementById("groupStatus").innerHTML = "Public";
    if(others["Description"]==1)
        document.getElementById("Description").innerHTML = others["description"];
    else
        document.getElementById("Description").innerHTML = others["description"];
    var st = "";
    for(var i in arr3)
    {
        st += arr3[i]+" ";
    }
    document.getElementById("Features").innerHTML = st;
    var st2="";
    var st3="";
    st3+=others['defaultProfileName']+" ";
    for(var i =0; i < Object.keys(arr2).length ;i++){
        st2+=arr2[i]['profileName']+" ";
    }
    document.getElementById("Profile").innerHTML = st2;
    document.getElementById("defaultProfile").innerHTML = st3;
    $("#copyModal").modal('show');
        
}


function newGroup()
{   alert("heyyy");
   var gname =  document.getElementById("newGroupName").value;
   alert(gname);
    data = "gname=" + gname + "&gid=" + grpId;
    alert(data);
    $.ajax({
        url:"angle_group/DAO_copyGroup.jsp",
        type: "GET",
        data : data,
        dataType : "json",
        success : newGroupCreated,
        error : onError
  
    });
 
}
function newGroupCreated(data)
{  // alert(data);
    // alert("New Group Created Successfully");
        var res = data.split(":");
        var desc = res[1];
        var gid = res[0];
        var gname = document.getElementById("newGroupName").value;
       // alert(" gid"+gid+"  desc"+desc+"  gname"+gname);
         var link = 'http://localhost:8080/test/newcategory.jsp?category=' + gname + '&desc=' + desc + '&id=' + gid;
        window.location = link;
        
}

/*
 * @author Apurv & Sakshi
 */
function displayTheToDoList(groupId,userId){
    //Expected TheToDoList Bean
    alert("Group Id "+groupId+" "+"User Id "+userId);
    var data = "groupId=" + groupId + "&userId=" + userId;
    $.ajax({
        url:"angle_group/DAO_getToDoList.jsp",
        type: "GET",
        data : data,
        dataType : "json",
        success : displayTemp,
        error : onError
  
    });
    
}
/*
 * @author Apurv & Sakshi
 */
function displayTemp(data)
{
    document.getElementById("toDoListShow").innerHTML="";
    arr = [];
    lis = ['topic', 'startTime','endTime'];
    arr = Object.keys(data['todoList']);
    for(var  i= 0 ; i < arr.length ;i++){
        li = Object.keys(data['todoList'][arr[i]]);
        var label1 = document.createElement("label");
        label1.innerHTML=arr[i];
        document.getElementById("toDoListShow").appendChild(label1);
        var div = document.createElement("div");
        div.className="col-md-12 col-sm-6 col-xs-12";    
            
        for(var j = 0 ; j < li.length; j++)
        {
            for(var m=0; m<lis.length; m++)
            {
                var span = document.createElement("span");
                span.className="col-md-2 col-sm-6 col-xs-12";
                var label = document.createElement("label");
                label.className="col-md-2 col-sm-6 col-xs-12";
                label.innerHTML=lis[m];
                span.innerHTML=data['todoList'][arr[i]][j][lis[m]];
                div.appendChild(label);
                div.appendChild(span);
                document.getElementById("toDoListShow").appendChild(div);      
            }
        }
        document.getElementById("toDoListShow").appendChild(document.createElement("br"));
    }
}

/*
 * @author Chirag & Sakshi
 */

function addTopic()
{

    var tname = document.getElementById("topic_name").value;
    var gid = document.getElementById("groupID").value;
    var uid = document.getElementById("userID").value;
    document.getElementById("successMsgError").style.display = "none";
    if (tname.trim().length == 0)
    {
        document.getElementById("successMsgError").style.display = "inline";
    } else
    {
        var data = "topicName=" + tname + "&gid=" + gid + "&uid=" + uid;
        $.ajax({
            url: "angle_group/DAO_addTopic.jsp",
            type: "GET",
            data: data,
            dataType: "json",
            success: setTopicName,
            error: onError
        });
    }
}
/*
 * @author Chirag & Sakshi
 */
function setTopicName(data) {

    var res = data.split("#");
    if (parseInt(res[1]) > 0) {

        if (!alert('Topic Added Successfully'))
            location.reload();
    } else
    {
        if (!alert('Try Again'))
            location.reload();
    }
}
/*
 * @author Chirag & Sakshi
 */
function showTopic()
{
    document.getElementById("topic_name").value = "";
    document.getElementById("link_div1").innerHTML = "";

    $('#addTopic').modal('show');
}



/*
 * @author Chirag & Sakshi
 */
function checkExisting(tname) {

    document.getElementById("Button").disabled = false;
    //var gname = document.getElementById("groupname").value;
    var gid = document.getElementById("groupID").value;
    // document.getElementById("groupname").style.border = "";
    document.getElementById("topicError").style.display = "none";
    var reg = /^[a-zA-Z0-9\s]+$/;
    if (reg.test(tname))
    {
        //            	alert(tname)
        document.getElementById("topicError").style.display = "none";
        validateTopicName(tname, gid);
    } else {
        document.getElementById("topicError").style.display = "inline";
        document.getElementById("link_div1").innerHTML = "";
        document.getElementById("link_div1").innerHTML = "Invalid group name";
        document.getElementById("link_div1").style.color = "red";
        document.getElementById("Button").disabled = true;

    }

}
/*
 * @author Chirag & Sakshi
 */
function validateTopicName(tname, gid) {

    var data = "topicname=" + tname + "&gid=" + gid;

    $.ajax({
        url: "angle_group/DAO_checkTopicName.jsp",
        type: "GET",
        data: data,
        dataType: "json",
        success: validTopicName,
        error: OnError
    });
}
/*
 * @author Chirag & Sakshi
 */
function validTopicName(data) {
    if (data > 0) {
        document.getElementById("Button").disabled = false;
        document.getElementById("link_div1").innerHTML = "";
        document.getElementById("link_div1").style.color = "green";
        document.getElementById("Button1").disabled = false;
    } else {
        document.getElementById("Button").disabled = true;
        document.getElementById("link_div1").innerHTML = "";
        document.getElementById("link_div1").innerHTML = "Try another topic name";
        document.getElementById("link_div1").style.color = "red";
        document.getElementById("Button1").disabled = true;
    }
}
/*
 * @author Chirag & Sakshi
 */
function OnError() {

    alert("Try Again");
}
