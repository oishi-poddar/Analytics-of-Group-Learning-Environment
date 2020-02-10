/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/*
 * author rohit
 */
google.charts.load('current', {'packages': ['bar']});
//google.charts.setOnLoadCallback(drawChart);
var map = {};
var length = 0;

/**/
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
    data.addColumn("string", "Topic");
    data.addColumn("number", "Time Devoted");
    data.addColumn("number","No Of Conferences");
    for (x in map) {
        var y = map[x].toString().split(":");
        var time = parseInt(y[0]);
        var no = parseInt(y[1]);
        
        var z = x.toString();
        //alert(y);
        //alert(z);
        data.addRow([z, time,no]);
    }
    //data.addRow(["hhhh",1]);
    //data.addRow(["ghad",2]);
//        var options = {
//                    chart: {
//                        title: 'Topic vs Time Devoted',
//                        subtitle: 'Time devoted for each Topic during a course',
//                    },
//                    bars: 'horizontal' // Required for Material Bar Charts.
//                };
    var options = {
        chart: {
            title: 'Topic vs Time(minutes) vs No of Conferences',
            subtitle: 'total time given on each topic during a course and Total no of Conferences done on each topic',
        },

        hAxis: {title: 'Topic', titleTextStyle: {color: 'black'}},
        colors: ['blue', 'green'],
        is3D: true
    };
    var chart = new google.charts.Bar(document.getElementById('barchart_material'));

    chart.draw(data, google.charts.Bar.convertOptions(options));
}

