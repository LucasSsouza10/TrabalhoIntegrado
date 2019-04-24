<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BNPF - Consultar Estados</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    
    <script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
    <script src="http://tablesorter.com/__jquery.tablesorter.min.js" type="text/javascript"></script> 


    <script>
        $(document).ready(function() {
           
            
            var dataF = document.getElementById('dataFinal'),
                dataI = document.getElementById('dataInicial'),
                err_message = document.getElementById('err-message');

            //Funcao para trocar de tela quando clica no botao id=consultaP1
            $("#consultaP1" ).click(function() {
                window.location.href = "consultarPessoas.jsp"
            });
            
            $(dataF).focusout(function() {
                if($(dataF).val() < $(dataI).val()){
                    $(err_message).fadeIn('slow', function(){
                        $(this).html('Data Inicial é maior que a data final, coloque um intervalo válido!');
                    });
                }
                else{
                    $(err_message).fadeIn('slow', function(){
                        $(this).html('');
                    });
                }
            });

            $(dataI).focusout(function() {
                if($(dataF).val() < $(dataI).val()){
                    $(err_message).fadeIn('slow', function(){
                        $(this).html('Data Inicial é maior que a data final, coloque um intervalo válido!');
                    });
                }
                else{
                    $(err_message).fadeIn('slow', function(){
                        $(this).html('');
                    });
                }
            });
            
            $("#consultar").on('click', function(){
                if($(dataF).val() < $(dataI).val()){
                    alert('Coloque um intervalo de tempo válido!')
                }
                else{
                    $('#texto').hide();
                    $('div').removeClass('form-group');
                    $('#form').removeClass('form-container');
                    $('#art1').removeClass('col-md-3');
                    $('#art1').addClass('offset-md-3');
                    $('#art1').css("text-align", "center");
                    $('#form').addClass('form-inline');
                    $('input').css('margin-right', '10px');
                    $('#target').css("margin-top", "10px");
                    $('#pBotao1').css("margin-top", "7%");
                    $('#pBotao1').css("margin-left", "10%");
                    $('#titulo1').css("margin-bottom", "0");
                    $('#secao').css("padding-bottom", "0");
                    $('#form').css("width", "90%");
                    $('#form').css("margin-left", "5%");
                    $('#art1').css("margin-left", "3%");
                    $('#texto1').css("margin-bottom", "15px");
                   
                    $('#section1').show();
                    $('#section1').css("padding-bottom", "70px");
                    $.ajax({
                        type: "GET", 
                        url: "consulta1", 
                        dataType: "html", 
                        data: { op: 1, dI: $('#anoInicial').val(), dF: $('#anoFinal').val() },
                        success: function(data) {
                          $("#corpoTable").html(data);
                        }
                    });
                }
            });

            
            
        });

        function validateForm() {
            var dataF = document.getElementById('dataFinal'),
                dataI = document.getElementById('dataInicial'),
                err_message = document.getElementById('err-message');
            if($(dataF).val() < $(dataI).val()){
                $(err_message).fadeIn('slow', function(){
                    $(this).html('Data Inicial é maior que a data final, coloque um intervalo válido!');
                });
                alert('Coloque um intervalo de tempo válido!');
                return false;
            }

        }
        
        function sortTableNumero(operacao, ind) {
                
            var table, rows, switching, i, x, y, shouldSwitch;
            table = document.getElementById("myTable");
            switching = true;

            while (switching) {
              switching = false;
              rows = table.rows;
              for (i = 1; i < (rows.length - 1); i++) {
                shouldSwitch = false;
                x = rows[i].getElementsByTagName("TD")[ind];
                y = rows[i + 1].getElementsByTagName("TD")[ind];
                
                if(operacao === 1){
                    if (Number(x.innerHTML) > Number(y.innerHTML)) {
                        shouldSwitch = true;
                        break;
                    }
                }
                else if(operacao === 2){
                    if (Number(x.innerHTML) < Number(y.innerHTML)) {
                        shouldSwitch = true;
                        break;
                    }
                }
                
              }
              if (shouldSwitch) {
                rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                switching = true;
              }
            }
        }

        function sortTableLetra(operacao, ind) {
            var table, rows, switching, i, x, y, shouldSwitch;
            table = document.getElementById("myTable");
            switching = true;

            while (switching) {

              switching = false;
              rows = table.rows;

              for (i = 1; i < (rows.length - 1); i++) {

                shouldSwitch = false;

                x = rows[i].getElementsByTagName("TD")[ind];
                y = rows[i + 1].getElementsByTagName("TD")[ind];
                
                if(operacao === 1){
                    if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                      shouldSwitch = true;
                      break;
                    }
                }
                else if(operacao === 2){
                    if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                      shouldSwitch = true;
                      break;
                    }
                }
                
              }
              if (shouldSwitch) {
                rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                switching = true;
              }
            }
        }
            
    </script>
    
    <body>
        <nav class="navbar navbar-dark bg-primary" style="padding: 0px;">
            <a class="navbar-brand" href="#">
                    <img src="./LogoBNPF.png" width="80" height="80" alt="" style="margin-left: 20px;">
            </a>
            <ul class="navbar-nav flex-row ml-md-auto d-none d-md-flex">
                <li class="nav-item" ><a class="nav-link p-2" href="index.jsp" style="color: white; margin-right: 10px;">Home</a></li>
                <li class="nav-item"><button type="button" id="consultaE1" class="btn btn-outline-light active" style="margin-right: 20px;">Consultar Estados</button>
                <li class="nav-item"><button type="button" id="consultaP1" class="btn btn-outline-light" style="margin-right: 20px;">Consultar Pessoas</button>
            </ul>
        </nav>
        
        <section name="secao" style="margin-top: 10px; padding-bottom: 70px;" id="secao" ajax="true">
           
            <div class="col-md-6 offset-md-3" id="texto">
                <h2><strong>Consultar Estados</strong></h2>
                <p>Esta consulta foi criada com o foco estatístico. Para realizar a consulta, deve-se fornecer um determinado intervalo de tempo e o sistema irá buscar por todas as dividas e ações judiciais que ocorreram neste período. Por fim, o resultado da consulta tráz diversos dados quantitativos para cada UF como: a soma do valor das dívidas, número de devedores, número de dívidas, soma dos valores em ações judiciais e também o número de ações judiciais
                </p>
            </div>
            
            <section class="row justify-content-center" style="width: 100%;">
                <article class="col-12 col-sm-6 col-md-3" id="art1">
                        <h3 id="titulo1">Realizar a consulta</h3> 
                        <p id="texto1">Informe o intervalo de tempo nos campos abaixo!</p>
                        <form id="form" class="form-container" autocomplete="on" onsubmit="return validateForm()">
                            <div class="form-group">
                                    <label> Data inicial</label>
                                    <input type="date" class="form-control" id="dataInicial" value="1938-01-01">  
                            </div>
                            <div class="form-group">
                                    <label> Data final</label>
                                    <input type="date" class="form-control" id="dataFinal" value="2019-01-01" > 
                            </div>
                            
                            <p id="pBotao1" style="text-align: center;"><button id="consultar" type="button" class="btn btn-primary">Consultar</button></p>
                            <p style="text-align: center;">

                                <span class="right" id="err-message" style="color: darkred;"></span>
                            </p>
                        </form>
                </article>
            </section>
        </section>
        
        <section id="section1" class="table-responsive">
            <div class="row" style="width: 100%; margin-top: 30px;" id="resul">
                <div class="col-md-3 rounded" style=" margin-left: 40px; margin-right: 30px; border:solid 1px #999; height: 800px;">
                    <h5 style="margin-bottom: 0">Ordenação das colunas na tabela:</h5>
                    <p style="margin-bottom: 5px; font-size: 12px;">Quant. significa Quantidade e judi. significa judiciais</p>
                    <form class="form-containe" style="margin-left: 5px;">
                        
                        <div class="radio">
                          <label><input type="radio" name="optradio" checked onclick="sortTableLetra(1,0)">Unidade Federativa em ordem crescente</label>
                        </div>
                        <div class="radio">
                          <label><input type="radio" name="optradio" onclick="sortTableLetra(2,0)">Unidade Federativa em ordem decrescente</label>
                        </div>
                        <div class="radio">
                            <label><input type="radio" name="optradio" onclick="sortTableNumero(1,1)">Valor das dívidas em ordem crescente</label>
                        </div>
                        <div class="radio">
                            <label><input type="radio" name="optradio" onclick="sortTableNumero(2,1)">Valor das dívidas em ordem decrescente</label>
                        </div>
                        <div class="radio disabled">
                          <label><input type="radio" name="optradio" onclick="sortTableNumero(1,2)">Quant. devedores em ordem crescente</label>
                        </div>
                        <div class="radio disabled">
                          <label><input type="radio" name="optradio" onclick="sortTableNumero(2,2)">Quant. devedores em ordem decrescente</label>
                        </div>
                        <div class="radio disabled">
                          <label><input type="radio" name="optradio" onclick="sortTableNumero(1,3)">Quant. de dívidas em ordem crescente</label>
                        </div>
                        <div class="radio disabled">
                          <label><input type="radio" name="optradio" onclick="sortTableNumero(2,3)">Quant. de dívidas em ordem decrescente</label>
                        </div>
                        <div class="radio disabled">
                          <label><input type="radio" name="optradio" onclick="sortTableNumero(1,4)">Valor das ações judi. em ordem crescente</label>
                        </div>
                        <div class="radio disabled">
                          <label><input type="radio" name="optradio" onclick="sortTableNumero(2,4)">Valor das ações judi. em ordem decrescente</label>
                        </div>
                        <div class="radio disabled">
                          <label><input type="radio" name="optradio" onclick="sortTableNumero(1,5)">Quant. de ações judi. em ordem crescente</label>
                        </div>
                        <div class="radio disabled">
                          <label><input type="radio" name="optradio" onclick="sortTableNumero(2,5)">Quant. de ações judi. em ordem decrescente</label>
                        </div>
                    </form>
                </div>
                <div style="width:  60%;">
                    <table class="table table-striped" style="border: solid 1px #999; width: 100%;" id="myTable">
                        <thead class="thead-dark table table-striped">
                            <tr>
                                <th id="co1">Unidade Federativa</th> 
                                <th>Valor das dívidas</th>
                                <th>Quantidade de devedores</th>
                                <th>Quantidade de dívidas</th>
                                <th>Valor das ações judiciais</th>
                                <th>Quantidade de ações judiciais</th>
                            </tr>
                        </thead>
                        <tbody id="corpoTable">
                        
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
        
        <br>
        <footer>
            <ul style="text-align: center;">
                <li style="display: inline-block; margin-left:170px; padding-top: 5px">©Copyright 2019 BNPF - All Rights Reserved</li>
                <li style="display: inline-block; float: right; padding: 5px 10px;"><a href="#">Termos de uso</a></li>
                <li style="display: inline-block; float: right; padding: 5px 10px;"><a href="#">Privacidade</a></li>
            </ul>
        </footer>
        
       
    </body>
</html>
