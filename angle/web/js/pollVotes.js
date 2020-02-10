/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

google.charts.load('current', {packages: ['corechart','bar']});
var map = {};
var map1 = {};
var length = 0;
function drawChart() {
    var data = new google.visualization.DataTable();

    data.addColumn("string", "Poll");
    data.addColumn("number", "Voter Count");
    data.addColumn("number", "Non Voter Count");
    data.addRows(length);
    cnt = 0;
    for (x in map) {
        var y = map[x];
        var y1 = map1[x];
        var z = x.toString();
        data.setCell(cnt, 0, z);
        data.setCell(cnt, 1, y);
        data.setCell(cnt, 2, y1);
        cnt++;
    }
    var options = {
        chart: {
            title: 'Poll vs Votes',
            subtitle: 'Total number of voters and non-voters for each poll',
        },

        hAxis: {title: 'Poll Question', titleTextStyle: {color: 'black'}},
        colors: ['green', 'red'],
        is3D: true,
        
        vAxis: {title: 'Total number of voters/non-voters', titleTextStyle: {color: 'black'}},
        colors: ['green', 'red'],
        is3D: true
    };
    var chart = new google.charts.Bar(document.getElementById('barchart_material'));

    chart.draw(data, google.charts.Bar.convertOptions(options));
}