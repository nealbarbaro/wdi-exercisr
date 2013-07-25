$(document).ready(function(){

  var graph_activity = function(exercise_data){
    console.log("graph_activity");
    console.log(exercise_data);
  }; // graph_activity

  var requestChart = function() {
    var activity = $('#activities').val();
    console.log(activity);
    $.ajax({
      dataType: "json",
      type: "get",
      url: "/exercises/chart/" + activity
    }).done(graph_activity);
  }; // requestChart

  $('.activity_button').on('click', requestChart);
}); // doc.ready