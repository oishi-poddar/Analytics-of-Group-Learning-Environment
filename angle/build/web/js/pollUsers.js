/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

google.charts.load('current', {'packages': ['bar']});
var map = {};
var map1 = {};
var length = 0;
var count=0;
function drawChart() {  
    var data = new google.visualization.DataTable();

    data.addColumn('string', 'Name');
    data.addColumn('number', 'Polls Voted');
    data.addRows(length);
    cnt = 0;
    for (x in map) {
        var y = map[x];
        var z = map1[x].toString();
        data.setCell(cnt, 0, z);
        data.setCell(cnt, 1, y);
        cnt++;
    }
    count=document.getElementById("pollCount").value;
    var options = {
        chart: {
            title: 'User vs Votes',
            subtitle: 'Total number of polls : '+count,
        },

        hAxis: {title: 'Name of The User', titleTextStyle: {color: 'black'}},
        colors: ['blue', 'green'],
        is3D: true,
        
        vAxis: {title: 'Total number of polls voted by each user', titleTextStyle: {color: 'black'}},
        colors: ['blue', 'green'],
        is3D: true
    };
    var chart = new google.charts.Bar(document.getElementById('barchart_material'));

    chart.draw(data, google.charts.Bar.convertOptions(options));
}