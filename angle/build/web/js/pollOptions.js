/*  
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

google.charts.load('current', {'packages': ['corechart']});
var quesMap = {};
var optionsMap = {};
var voteMap = {};
var length = 0;
var selectedPoll = -1;
function drawChart() {
    var data = new google.visualization.DataTable();

    data.addColumn('string', 'Option');
    data.addColumn('number', 'Votes');
    length = optionsMap[selectedPoll].length;
    data.addRows(length);

    var cnt=0;
    for(var x in optionsMap[selectedPoll])
    {
       // alert(x);
        //alert(optionsMap[selectedPoll][x]);
        //alert(voteMap[selectedPoll][x]);
//        data.setCell(cnt, 0, x);
        data.setCell(cnt, 0, optionsMap[selectedPoll][x]);
        data.setCell(cnt, 1, voteMap[selectedPoll][x]);
        cnt++;
    }

    var options = {
        chart: {
            title: 'Poll Vs Options',
            subtitle: 'Options distribution for each poll',
        },
    //
    //        hAxis: {title: 'Name of The User', titleTextStyle: {color: 'black'}},
    //        colors: ['blue', 'green'],
    //        is3D: true
    };
    var chart = new google.visualization.PieChart(document.getElementById('barchart_material'));

    chart.draw(data, options);
}