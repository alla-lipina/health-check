window.draw_graph = function(data) {
  data = JSON.parse(data)
  var ctx = document.getElementById("graph");
  var myChart = new Chart(ctx, {
      type: 'bar',
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
