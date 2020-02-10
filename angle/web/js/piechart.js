/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/* *
 * author rohit
 * 
 * 
 */
google.charts.load('current', {'packages': ['corechart']});

// Set a callback to run when the Google Visualization API is loaded.

var attendance, topic,totalMem;


// Callback that creates and populates a data table,
// instantiates the pie chart, passes in the data and
// draws it.
function drawChart2() {
    
      
      var x = parseInt(Math.round(attendance*(totalMem-1))/100);
      
     
    // Create the data table.
    var data = new google.visualization.DataTable();
    data.addColumn('string', 'status');
    data.addColumn('number', 'Count');
    data.addRows([
        ['Present', x],
        ['Absent', (totalMem-x-1)],
    ]);

    // Set chart options
    var options = {'title': 'Attendance Report ' + "\nTopic : " + topic  + "\nTotal Members :" + totalMem,
        'width': 400,
        'height': 300};

    // Instantiate and draw our chart, passing in some options.
    var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
    chart.draw(data, options);
}