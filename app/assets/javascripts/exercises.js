$(document).ready(function(){

  var graph_activity = function(exercise_data){
    console.log(exercise_data);
    $('#activity_metrics').html("");
    Morris.Line({
      element: 'activity_metrics',
      data: exercise_data,
      xkey: 'completed',
      ykeys: ['value'],
      labels: ['value']
    });
  }; // graph_activity

  var requestChart = function() {
    var activity = $('#activities').val();
    $.ajax({
      dataType: "json",
      type: "get",
      url: "/exercises/chart/" + activity
    }).done(graph_activity);
  }; // requestChart

  $('.activity_button').on('click', requestChart);
}); // doc.ready