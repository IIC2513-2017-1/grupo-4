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

    var barchar = new Chart(cntx, {
        type: 'bar',
        data: {
            datasets: [{
                label: "Numero de Copetes Vendidos",
                data: [cntx.data('a'),cntx.data('b'),cntx.data('c'),cntx.data('d'),cntx.data('e'),cntx.data('f'),cntx.data('g'),cntx.data('h'),cntx.data('i'),
                       cntx.data('j'),cntx.data('k'),cntx.data('l'),cntx.data('m'),cntx.data('n'),cntx.data('o'),cntx.data('p')],

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
            labels: [
                'Alto del Carmen',
                'Mistral',
                'Absolute',
                'Smirnoff',
                'Ron Flor de Caña',
                'Bacardi Gold',
                'Olmeca Blanco',
                'Tequila Sierra',
                'Santa Helena',
                'Concha y Toro',
                'Heineken',
                'Cristal',
                'Johnnie Walker',
                'Jack Daniels',
                'Fireball',
                'Stolichnaya'
            ]
        }
    });




})    



