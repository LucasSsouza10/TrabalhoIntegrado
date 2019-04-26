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
            
            //Configurar formato da tabela que contem os resultados
            $('#tabela').DataTable({
                "pagingType": "simple_numbers",
                "searching": false,
                "bLengthChange" : false,
                "order": [[ 1, "asc" ]],
                "columns": [
                    { "orderable": false },
                    null,
                    { "orderable": false },
                    { "orderable": false }, 
                    null,
                    null
                 ]
            });
            $('.dataTables_length').addClass('bs-select');
            
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
                    $('#texto').hide();
                    $('#card').hide();  
                    $('div').removeClass('form-group');
                    $('#form').removeClass('form-container');
                    $('#form').addClass('form-inline');
                    $('#form').css('margin-top', '10px');
                    $('#form').css('width', '90%');
                    $('#form').css('margin-left', '5%');
                    $('input').css('margin-right', '10px');
                    $('#pBotao1').css("margin-top", "37px");
                    $('#pBotao1').css("margin-left", "5%");
                    $('#titulo1').css("margin-bottom", "0");
                    $('#texto1').css("margin-bottom", "0");
                    $('#section1').show();
                    $('#section1').css("padding-bottom", "70px");
                    $('#art1').removeClass('col-md-3');
                    $('#art1').addClass('offset-md-1');
                    $('#art1').css("text-align", "center");
                    $('#art1').css("margin-left", "3%");
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
                    <form id="form" class="form-container">
                        <div class="form-group">
                            <label for="usr">Nome:</label>
                            <input id="nome" type="text" class="form-control" id="usr" placeholder="Nome">
                          </div>
                        <div class="form-group">
                            <label>Ano Inicial:</label>
                            <input type="number" class="form-control" id="anoInicial" name="quantity" min="1920" max="2019" value="1920">
                        </div>
                        <div class="form-group">
                            <label>Ano Final:</label>
                            <input type="number" class="form-control" id="anoFinal" name="quantity" min="1920" max="2019" value="2019">
                        </div>
                        
                        <p id="pBotao1" style="text-align: center;"><button id="target" type="button" class="btn btn-primary">Consultar</button></p>
                        
                        <p style="text-align: center;"><span class="right" id="err-message" style="color: darkred;"></span></p>
                    </form>
                </article>
            </section>
        </section>
        
        <section id="section1" class="table-responsive">
            <div class="row" style="width: 100%; margin-top: 30px;" id="resul">
                <div class="form-container col-md-3" style=" margin-left: 40px; margin-right: 30px; height: 450px;">
                        <h4 style="margin-bottom: 0px">Filtros dos valores</h4>
                        <label style="margin: 5px 0px 0px 0px">Quantidade mínima de dívidas:</label>
                        <input type="number" class="form-control" placeholder="Exemplo: 5" id="anoFinal" name="quantity" min="0" style="width: 60%;">
                        
                        <label style="margin: 5px 0px 0px 0px">Quantidade máxima de dívidas:</label>
                        <input type="number" class="form-control" placeholder="Exemplo: 2000" id="anoFinal" name="quantity" min="0" style="width: 60%;">
                        <br>
                        
                        <label style="margin: 5px 0px 0px 0px">Quantidade mínima de ações judiciais:</label>
                        <input type="number" class="form-control" placeholder="Exemplo: 8" id="anoFinal" name="quantity" min="0" style="width: 60%;">
                        
                        <label style="margin: 5px 0px 0px 0px">Quantidade máxima de ações judiciais:</label>
                        <input type="number" class="form-control" placeholder="Exemplo: 500" id="anoFinal" name="quantity" min="0" style="width: 60%;">
                        <br>
                        <p id="pBotao1" style="text-align: center;"><button id="filtrar" type="button" class="btn btn-primary" onclick="filtrarValores()">Filtrar</button></p>
                </div>
                <div style="width:  70%;">
                    <p style="margin-bottom: 5px;">Resultados da consulta na tabela a seguir, observação: Quant. significa Quantidade</p>
                    <table id="tabela" class="table table-striped table-bordered table-sm" style="border: solid 1px #999;">
                        <thead class="thead-dark table table-striped">
                        <tr>
                            <th class="th-sm">CPF</th>
                            <th class="th-sm">Nome</th>
                            <th class="th-sm">Data de nascimento</th>
                            <th class="th-sm">Estado Civil</th>
                            <th class="th-sm">Quant. de dívidas</th>
                            <th class="th-sm">Quant. de ações judiciais</th>
                          </tr>
                        </thead>
                        <tbody id="corpoTable">
                            <tr><td>88874330030</td><td>Leonardo Seiji Nozaki</td><td>02/02/1998</td><td>Divorciado</td><td>18</td><td>3</td></tr>
                            <tr><td>30618753010</td><td>Lucas Sampaio de Souza</td><td>22/03/1999</td><td>Solteiro</td><td>0</td><td>0</td></tr>
                            <tr><td>81566836093</td><td>Sofia de Almeida Machaddo da Silveira</td><td>18/08/1997</td><td>Solteiro</td><td>2</td><td>2</td></tr>
                            <tr><td>04723606041</td><td>Pessoa 1</td><td>18/08/1995</td><td>Solteiro</td><td>3</td><td>4</td></tr>
                            <tr><td>47129372036</td><td>Pessoa 2</td><td>19/10/1996</td><td>Solteiro</td><td>0</td><td>2</td></tr>
                            <tr><td>81922322040</td><td>Pessoa 3</td><td>20/11/1993</td><td>Casado</td><td>10</td><td>2</td></tr>
                            <tr><td>98123545061</td><td>Pessoa 4</td><td>21/12/1991</td><td>Solteiro</td><td>13</td><td>1</td></tr>
                            <tr><td>44865527095</td><td>Pessoa 5</td><td>22/04/1993</td><td>Casado</td><td>2</td><td>2</td></tr>
                            <tr><td>17804871007</td><td>Pessoa 6</td><td>23/07/1920</td><td>Solteiro</td><td>1</td><td>1</td></tr>
                            <tr><td>11959808508</td><td>Pessoa 7</td><td>24/07/1947</td><td>Casado</td><td>0</td><td>0</td></tr>
                            <tr><td>16721171007</td><td>Pessoa 8</td><td>25/03/1987</td><td>Divorciado</td><td>0</td><td>0</td></tr>
                            <tr><td>06752284091</td><td>Pessoa 9</td><td>26/01/1921</td><td>Casado</td><td>0</td><td>2</td></tr>
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
