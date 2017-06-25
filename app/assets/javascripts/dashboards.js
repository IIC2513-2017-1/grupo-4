// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(document).on("turbolinks:load", function() {
    var ctx = $("#mypieChart");
    var cntx = $("#mybarChart");
    console.log(ctx);

    var myChart = new Chart(ctx, {
        type: 'pie',
        data: {
            datasets: [{
                data: [ctx.data('not'),ctx.data('dis')],
                backgroundColor: ['#2980b9', '#16a085']
            }],

            // These labels appear in the legend and in the tooltips when hovering different arcs
            labels: [
                'No Despachadas',
                'Despachadas'
            ]
        }
    });

    array_nombres = [];
    array_datos = [];

    for (i = 0; i < cntx.data('a').length; i++) { 
        array_nombres.push(cntx.data('a')[i][0]);
        array_datos.push(cntx.data('a')[i][1]);
    }
    console.log(array_nombres);

    var barchar = new Chart(cntx, {
        type: 'bar',
        data: {
            datasets: [{
                label: "Numero de Copetes Vendidos",
                data: array_datos,
                backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)',
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)',
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)'
                ]
            }],


            // These labels appear in the legend and in the tooltips when hovering different arcs
            labels: array_nombres
        },

        options: {
            scales: {
                xAxes: [{
                    stacked: false,
                    beginAtZero: true,
                    scaleLabel: {
                        labelString: 'Month'
                    },
                    ticks: {
                        stepSize: 1,
                        min: 0,
                        autoSkip: false
                    }
                }]
            }
        }

    });



})    



