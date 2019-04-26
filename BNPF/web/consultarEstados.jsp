<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BNPF - Consultar Estados</title>
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
        $(document).ready(function() {
            var dataF = document.getElementById('dataFinal'),
                dataI = document.getElementById('dataInicial'),
                err_message = document.getElementById('err-message');

            //Funcao para trocar de tela quando clica no botao id=consultaP1
            $("#consultaP1" ).click(function() {
                window.location.href = "consultarPessoas.jsp"
            });
            
            //Funcao para verificar o intervalo de data quando sai do campo de data final
            $(dataF).focusout(function() {
                if($(dataF).val() < $(dataI).val()){
                    $(err_message).fadeIn('slow', function(){
                        $(this).html('Data inicial é maior que a data final, coloque um intervalo válido!');
                    });
                }
                else{
                    $(err_message).fadeIn('slow', function(){
                        $(this).html('');
                    });
                }
            });

            //Funcao para verificar o intervalo de data quando sai do campo de data inicial
            $(dataI).focusout(function() {
                if($(dataF).val() < $(dataI).val()){
                    $(err_message).fadeIn('slow', function(){
                        $(this).html('Data inicial é maior que a data final, coloque um intervalo válido!');
                    });
                }
                else{
                    $(err_message).fadeIn('slow', function(){
                        $(this).html('');
                    });
                }
            });
            
            //Funcao para tartar o click no botao de consultar
            $("#consultar").on('click', function(){
                if($(dataF).val() < $(dataI).val()){ //Intervalo de tempo invalido
                    alert('Coloque um intervalo de tempo válido!')
                }
                else{ //Intervalo de tempo valido
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
                }
            });
            
            //Configurar formato da tabela que contem os resultados
            $('#myTable').DataTable({
               "searching": false,
               "bLengthChange" : false,
               "paging": false,
               "bInfo": false
            });
            $('.dataTables_length').addClass('bs-select'); 
        });
        
        //Filtrar os valores da tabela
        function filtrarValores() {
            var table = document.getElementById("myTable");
            var rows = table.rows;
            rows[1].style.display="none";
        }
    </script>
    
    <body>
        
        <header>
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
        </header>
        <br>	
        <section class="container-fluid S" style="margin-bottom: 50px;">
            <div class="col-md-6 offset-md-3" id="texto">
                <h2><strong>Consultar Estados</strong></h2>
                <p>Esta consulta foi criada com o foco estatístico. Para realizar a consulta, deve-se fornecer um determinado intervalo de tempo e o sistema irá buscar por todas as dividas e ações judiciais que ocorreram neste período. Por fim, o resultado da consulta tráz diversos dados quantitativos para cada UF como: a soma do valor das dívidas, número de devedores, número de dívidas, soma dos valores em ações judiciais e também o número de ações judiciais
                </p>
            </div>
            
            <section class="row justify-content-center" style="width: 100%;">
                <article class="col-12 col-sm-6 col-md-3" id="art1" >
                    <h3 id="titulo1">Realizar a consulta</h3> 
                    <p id="texto1">Informe o intervalo de tempo nos campos abaixo!</p>
                    <form id="form" class="form-container">
                        <div class="form-group">
                                <label> Data inicial</label>
                                <input type="date" class="form-control" id="dataInicial" value="1938-01-01">  
                        </div>
                        <div class="form-group">
                                <label> Data final</label>
                                <input type="date" class="form-control" id="dataFinal" value="2019-01-01" > 
                        </div>

                        <p id="pBotao1" style="text-align: center;"><button id="consultar" type="button" class="btn btn-primary">Consultar</button></p>
                        
                        <p style="text-align: center;"><span class="right" id="err-message" style="color: darkred;"></span></p>
                    </form>
                </article>
            </section>
        </section>
        
        <section id="section1" class="table-responsive">
            <div class="row" style="width: 100%; margin-top: 30px;" id="resul">
                <div class="form-container col-md-3" style=" margin-left: 40px; margin-right: 30px; height: 920px;">
                        <h4 style="margin-bottom: 0px">Filtros dos valores</h4>
                        <label style="margin: 5px 0px 0px 0px">Valor mínimo das dívidas:</label>
                        <input type="number" class="form-control" placeholder="Exemplo: 300" id="anoFinal" name="quantity" min="0" style="width: 60%;">
                        
                        <label style="margin: 5px 0px 0px 0px">Valor máximo das dívidas:</label>
                        <input type="number" class="form-control" placeholder="Exemplo: 400000" id="anoFinal" name="quantity" min="0" style="width: 60%;">
                        <br>
                        
                        <label style="margin: 5px 0px 0px 0px">Quantidade mínima de devedores:</label>
                        <input type="number" class="form-control" placeholder="Exemplo: 0" id="anoFinal" name="quantity" min="0" style="width: 60%;">
                        
                        <label style="margin: 5px 0px 0px 0px">Quantidade máxima de devedores:</label>
                        <input type="number" class="form-control" placeholder="Exemplo: 10000" id="anoFinal" name="quantity" min="0" style="width: 60%;">
                        <br>
                        
                        <label style="margin: 5px 0px 0px 0px">Quantidade mínima de dívidas:</label>
                        <input type="number" class="form-control" placeholder="Exemplo: 5" id="anoFinal" name="quantity" min="0" style="width: 60%;">
                        
                        <label style="margin: 5px 0px 0px 0px">Quantidade máxima de dívidas:</label>
                        <input type="number" class="form-control" placeholder="Exemplo: 2000" id="anoFinal" name="quantity" min="0" style="width: 60%;">
                        <br>
                        
                        <label style="margin: 5px 0px 0px 0px">Valor mínimo das ações judiciais:</label>
                        <input type="number" class="form-control" placeholder="Exemplo: 300" id="anoFinal" name="quantity" min="0" style="width: 60%;">
                        
                        <label style="margin: 5px 0px 0px 0px">Valor máxima das ações judiciais:</label>
                        <input type="number" class="form-control" placeholder="Exemplo: 20000" id="anoFinal" name="quantity" min="0" style="width: 60%;">
                        <br>
                        
                        <label style="margin: 5px 0px 0px 0px">Quantidade mínima de ações judiciais:</label>
                        <input type="number" class="form-control" placeholder="Exemplo: 8" id="anoFinal" name="quantity" min="0" style="width: 60%;">
                        
                        <label style="margin: 5px 0px 0px 0px">Quantidade máxima de ações judiciais:</label>
                        <input type="number" class="form-control" placeholder="Exemplo: 500" id="anoFinal" name="quantity" min="0" style="width: 60%;">
                        <br>
                        <p id="pBotao1" style="text-align: center;"><button id="filtrar" type="button" class="btn btn-primary" onclick="filtrarValores()">Filtrar</button></p>
                </div>
                <div style="width:  60%;">
                    <table id="myTable" class="table table-striped table-bordered table-sm" style="border: solid 1px #999;">
                        <thead class="thead-dark table table-striped">
                            <tr>
                                <th class="th-sm" id="co1">Unidade Federativa</th> 
                                <th class="th-sm">Valor das dívidas</th>
                                <th class="th-sm">Quantidade de devedores</th>
                                <th class="th-sm">Quantidade de dívidas</th>
                                <th class="th-sm">Valor das ações judiciais</th>
                                <th class="th-sm">Quantidade de ações judiciais</th>
                            </tr>
                        </thead>
                        <tbody id="corpoTable">
                            <tr><td>AC</td><td>2012</td><td>5</td><td>5</td><td>1032</td><td>3</td></tr>
                            <tr><td>AL</td><td>1040</td><td>3</td><td>4</td><td>1032</td><td>3</td></tr>
                            <tr><td>AP</td><td>357</td><td>4</td><td>5</td><td>1032</td><td>3</td></tr>
                            <tr><td>AM</td><td>5877</td><td>3</td><td>5</td><td>1032</td><td>3</td></tr>
                            <tr><td>BA</td><td>2450</td><td>2</td><td>6</td><td>1032</td><td>3</td></tr>
                            <tr><td>CE</td><td>2354</td><td>3</td><td>5</td><td>1032</td><td>3</td></tr>
                            <tr><td>DF</td><td>1050</td><td>3</td><td>7</td><td>1032</td><td>3</td></tr>
                            <tr><td>ES</td><td>987</td><td>2</td><td>5</td><td>1032</td><td>3</td></tr>
                            <tr><td>GO</td><td>112</td><td>1</td><td>8</td><td>1032</td><td>3</td></tr>
                            <tr><td>MA</td><td>3217</td><td>5</td><td>5</td><td>1032</td><td>3</td></tr>
                            <tr><td>MT</td><td>8563</td><td>10</td><td>9</td><td>1032</td><td>3</td></tr>
                            <tr><td>MS</td><td>1241</td><td>2</td><td>5</td><td>1032</td><td>3</td></tr>
                            <tr><td>MG</td><td>1548</td><td>1</td><td>5</td><td>1032</td><td>3</td></tr>
                            <tr><td>PA</td><td>2675</td><td>2</td><td>4</td><td>1032</td><td>3</td></tr>
                            <tr><td>PB</td><td>1572</td><td>1</td><td>2</td><td>1032</td><td>3</td></tr>
                            <tr><td>PR</td><td>1246</td><td>1</td><td>1</td><td>1032</td><td>3</td></tr>
                            <tr><td>PE</td><td>3652</td><td>1</td><td>2</td><td>1032</td><td>3</td></tr>
                            <tr><td>PI</td><td>1524</td><td>2</td><td>2</td><td>1032</td><td>3</td></tr>
                            <tr><td>RJ</td><td>1513</td><td>3</td><td>2</td><td>1032</td><td>3</td></tr>
                            <tr><td>RN</td><td>2463</td><td>3</td><td>2</td><td>1032</td><td>3</td></tr>
                            <tr><td>RS</td><td>1254</td><td>1</td><td>2</td><td>1032</td><td>3</td></tr>
                            <tr><td>RO</td><td>2012</td><td>1</td><td>3</td><td>1032</td><td>3</td></tr>
                            <tr><td>RR</td><td>6852</td><td>6</td><td>6</td><td>1032</td><td>3</td></tr>
                            <tr><td>SC</td><td>3562</td><td>7</td><td>8</td><td>1032</td><td>3</td></tr>
                            <tr><td>SP</td><td>6854</td><td>5</td><td>6</td><td>1032</td><td>3</td></tr>
                            <tr><td>SE</td><td>7654</td><td>3</td><td>5</td><td>1032</td><td>3</td></tr>
                            <tr><td>TO</td><td>9585</td><td>6</td><td>5</td><td>1032</td><td>3</td></tr>
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
