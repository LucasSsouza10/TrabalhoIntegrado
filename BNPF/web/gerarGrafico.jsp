<%-- 
    Document   : gerarGrafico
    Created on : 02/06/2019, 00:20:16
    Author     : leona
--%>
<script>
    function Grafico() {
                var data_table = document.getElementById('tabela'); 
                var canvas = document.getElementById('canvas'); 
                var td_index = 4; 
                
                var tds, data = [], color, colors = [], value = 0, total = 0; 
                var trs = data_table.getElementsByTagName('tr');
                for (var i = 1; i < 5; i++) {     
                    tds = trs[i].getElementsByTagName('td');
                    if (tds.length === 0) continue;
                    
                    value  = parseFloat(tds[td_index].innerHTML);     
                    data[data.length] = value;     
                    total += value;
                    color = getColor();     
                    colors[colors.length] = color;
                }
                var ctx = canvas.getContext('2d'); 
                var canvas_size = [canvas.width, canvas.height]; 
                var radius = Math.min(canvas_size[0], canvas_size[1]) / 2; 
                var center = [canvas_size[0]/2, canvas_size[1]/2];
                var sofar = 0; // monitora o andamento do script   
                // loop por data[]   
                for (var piece in data) {        
                    var thisvalue = data[piece] / total;        
                    ctx.beginPath();      
                    ctx.moveTo(center[0], center[1]); 
                    // centro do gráfico       
                    ctx.arc(  // desenha próximo arco           
                    center[0],          
                    center[1],          
                    radius,         
                    Math.PI * (- 0.5 + 2 * sofar), // -0.5 define o início no topo           
                    Math.PI * (- 0.5 + 2 * (sofar + thisvalue)),          false      );        
                    ctx.lineTo(center[0], center[1]); // linha de retorno ao centro      
                    ctx.closePath();      
                    ctx.fillStyle = colors[piece];    // cor       
                    ctx.fill();        
                    sofar += thisvalue; // incrementa o andamento do script   
                }
            }
            
            function getColor() {          
                var rgb = [];          
                for (var i = 0; i < 3; i++) {              
                rgb[i] = Math.round(100 * Math.random() + 155) ; // [155-255] = lighter colors           
                }          
                return 'rgb(' + rgb.join(',') + ')';      
            }
</script>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <p id="gerarGraf" style="text-align: center;"><button id="graf" type="button" class="btn btn-primary" onclick="Grafico()">Filtrar</button></p>
	<canvas id="canvas" width="300" height="300"></canvas> 
        <h1>Hello World!</h1>
    </body>
</html>
