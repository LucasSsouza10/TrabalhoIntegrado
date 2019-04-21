<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BNPF - Consultar Estados</title>
        <link rel="stylesheet" type="text/css" href="styleConsultarEstados.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>--%>
        <script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
        
        <script>
            $(document).ready(function() {
             
                var dataF = document.getElementById('dataFinal'),
                    dataI = document.getElementById('dataInicial'),
                    err_message = document.getElementById('err-message');

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
                        $.ajax({
                            type: "GET", 
                            url: "consulta1", 
                            dataType: "html", 
                            data: { op: 1, dI: $('#dataInicial').val(), dF: $('#dataFinal').val() },
                            success: function(data) {
                              $("#secao").html(data);
                            }
                        });
                    }
                });
                
                $(document.body).on('click', '#consultar1', function(){
                    var dataF1 = document.getElementById('dataFinal1'),
                    dataI1 = document.getElementById('dataInicial1');
                    if($(dataF1).val() < $(dataI1).val()){
                        alert('Coloque um intervalo de tempo válido!')
                    }
                    else{
                        $.ajax({
                            type: "GET", 
                            url: "consulta1", 
                            dataType: "html", 
                            data: { op: 2, dI: $('#dataInicial1').val(), dF: $('#dataFinal1').val() },
                            success: function(data) {
                              $("#resul").html(data);
                            }
                        });
                    }
                });
                $(document.body).on('focusout', '#dataInicial1', function(){
                    var dataF1 = document.getElementById('dataFinal1'),
                    dataI1 = document.getElementById('dataInicial1'),
                    err_message1 = document.getElementById('err-message1');
                   
                    if($(dataF1).val() < $(dataI1).val()){
                        $(err_message1).fadeIn('slow', function(){
                            $(this).html('Data Inicial é maior que a data final, coloque um intervalo válido!');
                        });
                    }
                    else{
                        $(err_message1).fadeIn('slow', function(){
                            $(this).html('');
                        });
                    }
                });
                
                $(document.body).on('focusout', '#dataFinal1', function(){
                    var dataF1 = document.getElementById('dataFinal1'),
                    dataI1 = document.getElementById('dataInicial1'),
                    err_message1 = document.getElementById('err-message1');
                   
                    if($(dataF1).val() < $(dataI1).val()){
                        $(err_message1).fadeIn('slow', function(){
                            $(this).html('Data Inicial é maior que a data final, coloque um intervalo válido!');
                        });
                    }
                    else{
                        $(err_message1).fadeIn('slow', function(){
                            $(this).html('');
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
        </script>
    
    <body>
        <nav class="navbar navbar-dark bg-primary" style="padding: 0px;">
                <a class="navbar-brand" href="#">
                        <img src="./LogoBNPF.png" width="80" height="80" alt="" style="margin-left: 20px;">
                </a>
                <ul class="navbar-nav flex-row ml-md-auto d-none d-md-flex">
                        <li class="nav-item" ><a class="nav-link p-2" href="index.jsp">Home</a></li>
                        <li class="nav-item"><a class="btn btn-outline-light active" href="consultarEstados.jsp" style="margin-right: 10px;">Consultar Estados</a>
                        <li class="nav-item"><button type="button" class="btn btn-outline-light" style="margin-right: 20px;">Consultar Pessoas</button>
                  </ul>
        </nav>
        
        <section name="secao" style="margin-top: 10px; padding-bottom: 70px;" id="secao" ajax="true">
           
            <div class="col-md-6 offset-md-3">
                <h2><strong>Consultar Estados</strong></h2>
                <p>Esta consulta foi criada com o foco estatístico. Para realizar a consulta, deve-se fornecer um determinado intervalo de tempo e o sistema irá buscar por todas as dividas e ações judiciais que ocorreram neste período. Por fim, o resultado da consulta tráz diversos dados quantitativos para cada UF como: a soma do valor das dívidas, número de devedores, número de dívidas, soma dos valores em ações judiciais e também o número de ações judiciais
                </p>
            </div>
            
            <article style="width: 500px; margin-top: -10px;">
                <div class="container" style="width: 400px; margin-top: -10px">
                    <h3 style="margin-bottom: 0px;">Realizar a consulta</h3> 
                    <p style="margin-bottom: 5px; margin-top: -5px;">Informe o intervalo de tempo nos campos abaixo!</p>
                    <form id="consultaInicial" autocomplete="on" onsubmit="return validateForm()">
                    
                        <div class="form-group">
                            <div class="col-md-6 offset-md-3">
                                <label style="margin-left: 20%;"> Data inicial</label>
                                <input type="date" class="form-control" id="dataInicial" value="1938-01-01" style="width: 140%; margin-left: -20%;">  
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-6 offset-md-3">
                                <label style="margin-top: 5px; margin-left: 20%;"> Data final</label>
                                <input type="date" class="form-control" id="dataFinal" value="2019-01-01" style="width: 140%; margin-left: -20%;"> 
                            </div>
                        </div>
                        <p style="text-align: center;">
                           
                            <span class="right" id="err-message" style="color: darkred;"></span>
                        </p>
                        <p style="text-align: center;"><input type="button" id="consultar" class="btn btn-primary" value="Consultar"></p>
                        
                    </form>
                </div>
            </article>
        </section>
        
        
        <footer style="position: absolute; bottom: 0px;  width: 100%; background-color: rgb(220,220,220);" >
            <ul style="text-align: center;">
                <li style="display: inline-block; margin-left:170px; padding-top: 5px">©Copyright 2019 BNPF - All Rights Reserved</li>
                <li style="display: inline-block; float: right; padding: 5px 10px;"><a href="#">Termos de uso</a></li>
                <li style="display: inline-block; float: right; padding: 5px 10px;"><a href="#">Privacidade</a></li>
            </ul>
        </footer>
        
        
    </body>

