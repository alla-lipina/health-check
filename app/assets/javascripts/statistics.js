window.draw_graph = function(data, type, element_id) {
  data = JSON.parse(data)
  var ctx = document.getElementById(element_id);
  var myChart = new Chart(ctx, {
      type: type,
      data: data,
      options: {
          scales: {
              yAxes: [{
                  ticks: {
                      beginAtZero:true
                  }
              }]
          }
      }
  });
};
