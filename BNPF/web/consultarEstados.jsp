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

                $('')
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
                <li class="nav-item" ><a class="nav-link p-2" href="index.jsp" style="color: white; margin-right: 10px;">Home</a></li>
                <li class="nav-item"><button type="button" id="consultaE1" class="btn btn-outline-light active" style="margin-right: 20px;">Consultar Estados</button>
                <li class="nav-item"><button type="button" id="consultaP1" class="btn btn-outline-light" style="margin-right: 20px;">Consultar Pessoas</button>
            </ul>
        </nav>
        
        <section name="secao" style="margin-top: 10px; padding-bottom: 70px;" id="secao" ajax="true">
           
            <div class="col-md-6 offset-md-3">
                <h2><strong>Consultar Estados</strong></h2>
                <p>Esta consulta foi criada com o foco estatístico. Para realizar a consulta, deve-se fornecer um determinado intervalo de tempo e o sistema irá buscar por todas as dividas e ações judiciais que ocorreram neste período. Por fim, o resultado da consulta tráz diversos dados quantitativos para cada UF como: a soma do valor das dívidas, número de devedores, número de dívidas, soma dos valores em ações judiciais e também o número de ações judiciais
                </p>
            </div>
            
            <section class="row justify-content-center" style="width: 100%;">
                <article class="col-12 col-sm-6 col-md-3">
                        <h3>Realizar a consulta</h3> 
                        <p>Informe o intervalo de tempo nos campos abaixo!</p>
                        <form class="form-container" autocomplete="on" onsubmit="return validateForm()">
                            <div class="form-group">
                                    <label> Data inicial</label>
                                    <input type="date" class="form-control" id="dataInicial" value="1938-01-01">  
                            </div>
                            <div class="form-group">
                                    <label> Data final</label>
                                    <input type="date" class="form-control" id="dataFinal" value="2019-01-01" > 
                            </div>
                            <p style="text-align: center;">

                                <span class="right" id="err-message" style="color: darkred;"></span>
                            </p>
                            <p style="text-align: center;"><button id="consultar" type="button" class="btn btn-primary">Consultar</button></p>
                        </form>
                </article>
            </section>
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
