/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/* *
 * author chirag
 * 
 * 
 */


google.charts.load('current', {'packages': ['bar']});
//google.charts.setOnLoadCallback(drawChart);
var map = {};
var length = 0;

/*
 * it draws google bar graph with given data
 * 
 * @returns {undefined}
 */
function drawChart() {
    var data = new google.visualization.DataTable();
    /*
     ['Year', 'Sales', 'Expenses', 'Profit','help'],
     ['2014', 1000, 400, 200,100],
     ['2015', 1170, 460, 250,200],
     ['2016', 660, 1120, 300,500],
     ['2017', 1030, 540, 350,600]
     ]);
     */

    data.addColumn("string", "Query");
    data.addColumn("number", "Replies");
    data.addColumn("number", "No. of Users Participated");

    for (x in map) {
        var y = map[x].toString().split(":");
        var y0 = parseInt(y[0]);
        var y1 = parseInt(y[1]);
        var z = x.toString();
        //alert(y);
        //alert(z);
        data.addRow([z, y0,y1]);
    }
    // data.addRow(["hhhh",1]);
    //data.addRow(["ghad",2]);
//        var options = {
//                    chart: {
//                        title: ,
//                        subtitle: 'total chats done on each topic during a course',
//                    },
//                    bars: 'horizontal' // Required for Material Bar Charts.
//                    color: 
//                };


    var options = {
        chart: {
            title: 'Query vs Users Participated/Replies',
            subtitle: 'Total number of replies posted and user participated in a Query',
        },

        hAxis: {title: 'Query', titleTextStyle: {color: 'black'}},
        colors: ['blue', 'green'],
        is3D: true
    };
    var chart = new google.charts.Bar(document.getElementById('barchart_material'));

    chart.draw(data, google.charts.Bar.convertOptions(options));
}