<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BNPF - Consultar Pessoas</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>

    <script>
        $(document).ready(function(){
            //Variaveis que serão utilizadas no decorrer do <script>
            var anoFinal = document.getElementById('anoFinal'),
                anoInicial = document.getElementById('anoInicial'),
                err_message = document.getElementById('err-message');
           
            //Funcao para trocar de tela quando clica no botao id=consultaE1
            $("#consultaE1" ).click(function() {
                window.location.href = "consultarEstados.jsp";
            });
           
            
            //Funcao para verificar o periodo de ano quando sai do campo de ano inicial
            $(document.body).on('focusout', '#anoInicial', function(){
                if($(anoFinal).val() < $(anoInicial).val()){
                    $(err_message).fadeIn('slow', function(){
                        $(this).html('Ano inicial é maior que o ano final, coloque um intervalo válido!');
                    });
                }
                else{
                    $(err_message).fadeOut(1000, function(){
                        $(this).html('');
                    });
                }
            });
            
            //Funcao para verificar o periodo de ano quando sai do campo de ano final
            $(document.body).on('focusout', '#anoFinal', function(){
                if($(anoFinal).val() < $(anoInicial).val()){
                    $(err_message).fadeIn('slow', function(){
                        $(this).html('Ano inicial é maior que o ano final, coloque um intervalo válido!');
                    });
                }
                else{
                    $(err_message).fadeOut(1000, function(){
                        $(this).html('');
                    });
                }
            });
            
            //Funcao para verificar se o nome inserido tem apenas letras
            $(document.body).on('focusout', '#nome', function(){
                nome = document.getElementById('nome');
           
                var letter_only = /^[A-Za-záàâãéèêíïóôõöúçÁÀÂÃÉÈÍÏÓÔÕÖÚÇ]/;
                var element = $(nome);
                
                if(!(letter_only.test(element.val()))){
                    $(err_message).fadeIn('slow', function(){
                        $(this).html('Nome invalido, permitido somente letras');
                    });
                }
                else{
                    $(err_message).fadeOut(1000, function(){
                        $(this).html('');
                    });
                }
            });
            
            
            //Funcao para tartar o click no botao de consultar
            $( "#target" ).click(function() {
                var anoFinal = document.getElementById('anoFinal'),
                anoInicial = document.getElementById('anoInicial'),
                err_message = document.getElementById('err-message'),
                nome = document.getElementById('nome');
           
                var letter_only = /^[A-Za-záàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]/;
                var element = $(nome);
                
                if(($(anoFinal).val() > $(anoInicial).val()) && (letter_only.test(element.val()))){
                    document.getElementById("form").submit();
                }
                else{
                    alert('Campos de busca inválidos, verifique e tente novamente')
                }
            });
        });
    </script>
    
  
    <body>
        <header>
            <nav class="navbar navbar-dark bg-primary" style="padding: 0px;">
                <a class="navbar-brand" href="#">
                        <img src="./LogoBNPF.png" width="80" height="80" alt="" style="margin-left: 20px;">
                </a>
                <ul class="navbar-nav flex-row ml-md-auto d-none d-md-flex">
                    <li class="nav-item" ><a class="nav-link p-2" href="index.jsp" style="color: white; margin-right: 10px;">Home</a></li>
                    <li class="nav-item"><button type="button" id="consultaE1" class="btn btn-outline-light" style="margin-right: 20px;">Consultar Estados</button>
                    <li class="nav-item"><button type="button" id="consultaP1" class="btn btn-outline-light active" style="margin-right: 20px;">Consultar Pessoas</button>
                </ul>
            </nav>
        </header>
        <br>	
        <section class="container-fluid S" style="margin-bottom: 50px;">
            <div class="col-md-6 offset-md-3" id="texto">
                <h2><strong>Consultar Pessoas</strong></h2>
                <p>Para fins de pesquisa dos cidadãos, essa consulta recupera os dados de diversas pessoas físicas (CPF, nome, data de nascimento e estado civil), e também número de dívidas e número de ações judiciais que essa pessoa possui em seu nome, dado um intervalo tempo em anos e um trecho do nome da pessoa.
                </p>
            </div>
            
            <section class="row justify-content-center" style="width: 100%;">
                <article id="art1" class="col-12 col-sm-6 col-md-3">
                    <h3 id="titulo1">Realizar a consulta</h3> 
                    <p id="texto1">Informe o intervalo de tempo nos campos abaixo!</p>
                    <form id="form" class="form-container" method="POST" action="consulta2">
                        <div class="form-group">
                            <label for="usr">Nome:</label>
                            <input name="nome" id="nome" type="text" class="form-control" placeholder="Nome">
                          </div>
                        <div class="form-group">
                            <label>Ano Inicial:</label>
                            <input name="anoInicial" type="number" class="form-control" id="anoInicial" name="quantity" min="1920" max="2019" value="1920">
                        </div>
                        <div class="form-group">
                            <label>Ano Final:</label>
                            <input name="anoFinal" type="number" class="form-control" id="anoFinal" name="quantity" min="1920" max="2019" value="2019">
                        </div>
                        
                        <p id="pBotao1" style="text-align: center;"><button id="target" type="button" class="btn btn-primary">Consultar</button></p>
                        
                        <p style="text-align: center;"><span class="right" id="err-message" style="color: darkred;"></span></p>
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
