
Chart.defaults.font.family = 'apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.font.color = '#292b2c';


var ctx = document.getElementById("myAreaChart");
var myLineChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: ["Mar 1", "Mar 2", "Mar 3", "Mar 4", "Mar 5", "Mar 6", "Mar 7", "Mar 8", "Mar 9", "Mar 10", "Mar 11", "Mar 12", "Mar 13"],
    datasets: [{
      label: "Sessions",
      tension: 0.3, // Đổi từ lineTension sang tension
      backgroundColor: "rgba(2,117,216,0.2)",
      borderColor: "rgba(2,117,216,1)",
      pointRadius: 5,
      pointBackgroundColor: "rgba(2,117,216,1)",
      pointBorderColor: "rgba(255,255,255,0.8)",
      pointHoverRadius: 5,
      pointHoverBackgroundColor: "rgba(2,117,216,1)",
      pointHitRadius: 50,
      pointBorderWidth: 2,
      data: [10000, 30162, 26263, 18394, 18287, 28682, 31274, 33259, 25849, 24159, 32651, 31984, 38451],
    }],
  },
  options: {
    responsive: true,
    scales: {
      x: { // Sửa từ xAxes sang scales.x
        grid: {
          display: false
        },
        ticks: {
          maxTicksLimit: 7
        }
      },
      y: { // Sửa từ yAxes sang scales.y
        min: 0,
        max: 40000,
        ticks: {
          maxTicksLimit: 5
        },
        grid: {
          color: "rgba(0, 0, 0, .125)"
        }
      }
    },
    plugins: {
      legend: {
        display: false
      }
    }
  }
});
