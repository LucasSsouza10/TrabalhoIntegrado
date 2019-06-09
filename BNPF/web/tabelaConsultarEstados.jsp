<%@page import="java.util.ArrayList"%>
<%@page import="model.Estado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BNPF - Base Nacional Pessoa Física</title>
        <link href="/your-path-to-fontawesome/css/all.css" rel="stylesheet"> <!--load all styles -->
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

    <script src = " https://unpkg.com/sweetalert/dist/sweetalert.min.js "></script> 

    <script>
        $(document).ready(function () {
            $('#myModal').modal('hide');
            var dataF = document.getElementById('dataFinal'),
                    dataI = document.getElementById('dataInicial'),
                    err_message = document.getElementById('err-message');

            //Funcao para trocar de tela quando clica no botao id=consultaP1
            $("#consultaP1").click(function () {
                window.location.href = "consultarPessoas.jsp";
            });

            //Funcao para trocar de tela quando clica no botao id=consultaE1
            $("#consultaE1").click(function () {
                window.location.href = "consultarEstados.jsp";
            });

            //Funcao para verificar o intervalo de data quando sai do campo de data final
            $(dataF).focusout(function () {
                if ($(dataF).val() < $(dataI).val()) {
                    $(err_message).fadeIn('slow', function () {
                        $(this).html('Data inicial é maior que a data final, coloque um intervalo válido!');
                    });
                } else {
                    $(err_message).fadeIn('slow', function () {
                        $(this).html('');
                    });
                }
            });

            //Funcao para verificar o intervalo de data quando sai do campo de data inicial
            $(dataI).focusout(function () {
                if ($(dataF).val() < $(dataI).val()) {
                    $(err_message).fadeIn('slow', function () {
                        $(this).html('Data inicial é maior que a data final, coloque um intervalo válido!');
                    });
                } else {
                    $(err_message).fadeIn('slow', function () {
                        $(this).html('');
                    });
                }
            });

            //Configurar formato da tabela que contem os resultados
            $('#tabela').DataTable({
                "pagingType": "simple_numbers",
                "searching": false,
                "bLengthChange": false,
                "order": [[0, "asc"]],
                "paging": false
            });
            
            $('.dataTables_length').addClass('bs-select');

            $("#consultar").on('click', function () {
                if ($(dataF).val() < $(dataI).val()) { //Intervalo de tempo invalido
                    swal({
                        title: "Problema encontrado",
                        text: "Há algum erro no preenchimento dos dados, você deve corrigir isso para poder realizar a consulta",
                        icon: "error",
                        button: "Entendido",
                    })
                } else { //Intervalo de tempo valido
                    $('#myModal').modal('show');
                    document.getElementById("form").submit();
                }
            });

            $('#tabela').on('click', 'tbody tr', function () {
                //Codigo para abrir o modal com profundidade da pessoa;
                $(this).trigger('focus');
            });

            $('#tabela').on('mouseover', 'tbody tr', function () {
                $(this).css('background', 'gray');
            });

            $('#tabela').on('mouseout', 'tbody tr', function () {
                $(this).css('background', '');
            });
            
        });
        //Filtrar os valores da tabela
        function filtrarValores() {
            var maxValDividas = document.getElementById('maxValDividas'),
                maxQntDevedores = document.getElementById('maxQntDevedores'),
                maxQntDividas = document.getElementById('maxQntDividas'),
                maxValAcoes = document.getElementById('maxValAcoes'),
                maxQntAcoes = document.getElementById('maxQntAcoes');
                
                
            var deValDividas = document.getElementById('deValDividas'), ateValDividas = document.getElementById('ateValDividas'),
                deQntDevedores = document.getElementById('deQntDevedores'), ateQntDevedores = document.getElementById('ateQntDevedores'),
                deQntDividas = document.getElementById('deQntDividas'), ateQntDividas = document.getElementById('ateQntDividas'),
                deValAcs = document.getElementById('deValAcs'), ateValAcs = document.getElementById('ateValAcs'),
                deQntAcs = document.getElementById('deQntAcs'), ateQntAcs = document.getElementById('ateQntAcs');
                
            var ValorMinValDiv = 0.0, ValorMaxValDiv = parseFloat($(maxValDividas).text().replace(',','.'));
            var ValorMinQntDev = 0, ValorMaxQntDev = parseInt($(maxQntDevedores).text());
            var ValorMinQntDiv = 0, ValorMaxQntDiv = parseInt($(maxQntDividas).text());
            var ValorMinValAcs = 0.0, ValorMaxValAcs = parseFloat($(maxValAcoes).text().replace(',','.'));
            var ValorMinQntAcs = 0, ValorMaxQntAcs = parseInt($(maxQntAcoes).text());
            

            if($(deValDividas).val().length > 0 ){
                ValorMinValDiv = parseFloat($(deValDividas).val());
            }
            if($(ateValDividas).val().length > 0 ){
                ValorMaxValDiv = parseFloat($(ateValDividas).val());
            }
            //----------------------------------
            
            if($(deQntDevedores).val().length > 0 ){
                ValorMinQntDev = parseInt($(deQntDevedores).val());
            }
            if($(ateQntDevedores).val().length > 0 ){
                ValorMaxQntDev = parseInt($(ateQntDevedores).val());
            }
            //----------------------------------
            
            if($(deQntDividas).val().length > 0 ){
                ValorMinQntDiv = parseInt($(deQntDividas).val());
            }
            if($(ateQntDividas).val().length > 0 ){
                ValorMaxQntDiv = parseInt($(ateQntDividas).val());
            }
            //----------------------------------
            
            if($(deValAcs).val().length > 0 ){
                ValorMinValAcs = parseFloat($(deValAcs).val());
            }
            if($(ateValAcs).val().length > 0 ){
                ValorMaxValAcs = parseFloat($(ateValAcs).val());
            }
            //----------------------------------
            
            if($(deQntAcs).val().length > 0 ){
                ValorMinQntAcs = parseInt($(deQntAcs).val());
            }
            if($(ateQntAcs).val().length > 0 ){
                ValorMaxQntAcs = parseInt($(ateQntAcs).val());
            }
            
            
            var table = $('#tabela').DataTable();
            var table1 = $('#tabelaResultado').DataTable();
            var row, valorValDividas, valorQntDevedores, valorQntDividas, valorValAcoes, valorQntAcoes;

            table.clear().draw();
            
           

            
            for(var i = 0; i < table1.data().length; i++){
                row = table1.row(i).data();
                valorValDividas = parseFloat(table1.cell(i, 1).data().replace(',','.'));
                valorQntDevedores = parseInt(table1.cell(i, 2).data());
                valorQntDividas = parseInt(table1.cell(i, 3).data());
                valorValAcoes = parseFloat(table1.cell(i, 4).data().replace(',','.'));
                valorQntAcoes = parseInt(table1.cell(i, 5).data());

                if(valorValDividas >= ValorMinValDiv && valorValDividas <= ValorMaxValDiv && valorQntDevedores >= ValorMinQntDev && valorQntDevedores <= ValorMaxQntDev){
                    if(valorQntDividas >= ValorMinQntDiv && valorQntDividas <= ValorMaxQntDiv && valorValAcoes >= ValorMinValAcs && valorValAcoes <= ValorMaxValAcs){
                        if(valorQntAcoes >= ValorMinQntAcs && valorQntAcoes <= ValorMaxQntAcs){
                            table.row.add( row );
                        }
                    }
                }
            }
            table.draw();
            swal({
                title: "Sucesso",
                text: "A filtragem foi realizada, consulte os resultados",
                icon: "success",
                button: "Entendido",
            })
        }
    </script>


    <body class="fundoConsulta">
        <header>
            <nav class="navbar navbar-dark bg-primary" style="padding: 0px;">
                <a class="navbar-brand" href="#">
                    <img src="./LogoBNPF.png" width="80" height="80" alt="" style="margin-left: 20px;">
                </a>
                <ul class="navbar-nav flex-row ml-md-auto d-md-flex">
                    <li class="nav-item" ><a href="index.jsp" class="nav-link p-2" href="index.jsp" style="color: white; margin-right: 10px;">Home</a></li>
                    <li class="nav-item"><button type="button" id="consultaE1" class="btn btn-outline-light" style="margin-right: 20px;">Consultar Estados</button>
                    <li class="nav-item"><button type="button" id="consultaP1" class="btn btn-outline-light" style="margin-right: 20px;">Consultar Pessoas</button>
                </ul>
            </nav>
        </header>

        <section class="row mt-5 mx-auto">
            <div class="col-3">
                <div class="container">
                    <article class="form-container" id="art1" >
                        <h3 id="titulo1">Realizar nova consulta</h3> 
                        <p id="texto1">Informe o intervalo de tempo nos campos abaixo!</p>
                        <form id="form" class="form" method="POST" action="consulta1">
                            <div class="form form-group">
                                <label> Data inicial</label>
                                <input name="dtInicial" type="date" class="form-control" id="dataInicial" value="1938-01-01">  
                            </div>
                            <div class="form form-group">
                                <label> Data final</label>
                                <input name="dtFinal" type="date" class="form-control" id="dataFinal" value="2019-01-01" > 
                            </div>

                            <p id="pBotao1" style="text-align: center;"><button id="consultar" type="button" class="btn btn-primary col-12">Consultar</button></p>
                        </form>
                        <p style="text-align: center;"><span class="right" id="err-message" style="color: darkred;"></span></p>
                    </article>
                </div>

                <div class="container mt-5">
                    <div class="form-container">
                        <h4 style="margin-bottom: 0px">Filtrar valores</h4>
                        <br>
                        <div class="fil">
                            <label style="margin: 5px 0px;">Valor de dívidas</label>
                            <div class="row justify-content-center">
                                <label>De:</label>
                                <input type="number" class="col-4 form-control" placeholder="Ex: 1000" id="deValDividas" name="quantity" min="0">
                                <label>Até:</label>
                                <input type="number" class="col-4 form-control" placeholder="Ex: 5000" id="ateValDividas" name="quantity" min="0">
                            </div>
                        </div>


                        <br>
                        <div class="fil">
                            <label style="margin: 5px 0px;">Quantidade de devedores:</label>
                            <div class="row justify-content-center">
                                <label>De:</label>
                                <input type="number" class="col-4 form-control" placeholder="Ex: 40" id="deQntDevedores" name="quantity" min="0">
                                <label>Até:</label>
                                <input type="number" class="col-4 form-control" placeholder="Ex: 500" id="ateQntDevedores" name="quantity" min="0">
                            </div>

                        </div>

                        <br>
                        <div class="fil">
                            <label style="margin: 5px 0px;">Quantidade de dívidas</label>
                            <div class="row justify-content-center">
                                <label>De:</label>
                                <input type="number" class="col-4 form-control" placeholder="Ex: 60" id="deQntDividas" name="quantity" min="0">
                                <label>Até:</label>
                                <input type="number" class="col-4 form-control" placeholder="Ex: 850" id="ateQntDividas" name="quantity" min="0">
                            </div>

                        </div>

                        <br>
                        <div class="fil">
                            <label style="margin: 5px 0px;">Valor de ações judiciais:</label>
                            <div class="row justify-content-center">
                                <label>De:</label>
                                <input type="number" class="col-4 form-control" placeholder="Ex: 2000" id="deValAcs" name="quantity" min="0">
                                <label>Até:</label>
                                <input type="number" class="col-4 form-control" placeholder="Ex: 9000" id="ateValAcs" name="quantity" min="0">
                            </div>
                        </div>


                        <br>

                        <div class="fil">
                            <label style="margin: 5px 0px;">Quantidade de ações judiciais:</label>
                            <div class="row justify-content-center">
                                <label>De:</label>
                                <input type="number" class="col-4 form-control" placeholder="Ex: 30" id="deQntAcs" name="quantity" min="0">
                                <label>Até:</label>
                                <input type="number" class="col-4 form-control" placeholder="Ex: 300" id="ateQntAcs" name="quantity" min="0">
                            </div>
                        </div>


                        <br>
                        <p id="pBotao1" style="text-align: center;"><button id="filtrar" type="button" class="btn btn-primary col-12" onclick="filtrarValores()">Filtrar</button></p>
                    </div>
                </div>
            </div>

            <div class="col-9">
                <div class="table-responsive">
                    <table id="tabela" class="table table-striped table-bordered table-sm">
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

                            <%
                                ArrayList<Estado> arrayEstados = (ArrayList<Estado>) request.getAttribute("ArrayEstados");
                                for (int i = 0; i < arrayEstados.size(); i++) {

                            %>
                            <tr  data-toggle="modal" data-target="#exampleModal">
                                <td><%= arrayEstados.get(i).getUf()%></td>
                                <td><%= String.format("%.2f", arrayEstados.get(i).getValorDividas())%></td>
                                <td><%= arrayEstados.get(i).getQuantDevedores()%></td>
                                <td><%= arrayEstados.get(i).getQuantDividas()%></td>
                                <td><%= String.format("%.2f", arrayEstados.get(i).getValorAcoes())%></td>
                                <td><%= arrayEstados.get(i).getQuantAcoes()%></td>
                            </tr>
                            <%
                                }
                            %>

                        </tbody>
                    </table>
                </div>
            </div>
        </section>
                            
        <div style = "display: none;">
            <table id="tabelaResultado" class="table table-striped table-bordered table-sm">
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

                    <%
                        double maxValDividas = 0, maxQntDevedores = 0, maxQntDividas = 0, maxValAcoes = 0, maxQntAcoes = 0;
                        for (int i = 0; i < arrayEstados.size(); i++) {
                            if(arrayEstados.get(i).getValorDividas() > maxValDividas ){
                                maxValDividas = arrayEstados.get(i).getValorDividas();
                            }
                            if(arrayEstados.get(i).getQuantDevedores() > maxQntDevedores){
                                maxQntDevedores = arrayEstados.get(i).getQuantDevedores();
                            }
                            if(arrayEstados.get(i).getQuantDividas() > maxQntDividas){
                                maxQntDividas = arrayEstados.get(i).getQuantDividas();
                            }
                            if(arrayEstados.get(i).getValorAcoes() > maxValAcoes){
                                maxValAcoes = arrayEstados.get(i).getValorAcoes();
                            }
                            if(arrayEstados.get(i).getQuantAcoes() > maxQntAcoes){
                                maxQntAcoes = arrayEstados.get(i).getQuantAcoes();
                            }

                    %>
                    <tr  data-toggle="modal" data-target="#exampleModal">
                        <td><%= arrayEstados.get(i).getUf()%></td>
                        <td><%= String.format("%.2f", arrayEstados.get(i).getValorDividas())%></td>
                        <td><%= arrayEstados.get(i).getQuantDevedores()%></td>
                        <td><%= arrayEstados.get(i).getQuantDividas()%></td>
                        <td><%= String.format("%.2f", arrayEstados.get(i).getValorAcoes())%></td>
                        <td><%= arrayEstados.get(i).getQuantAcoes()%></td>
                    </tr>
                    <%
                        }
                    %>

                </tbody>
            </table>
            <label id="maxValDividas"><%= maxValDividas %></label>
            <label id="maxQntDevedores"><%= maxQntDevedores %></label>
            <label id="maxQntDividas"><%= maxQntDividas %></label>
            <label id="maxValAcoes"><%= maxValAcoes %></label>
            <label id="maxQntAcoes"><%= maxQntAcoes %></label>
        </div>  

        <!-- Modal para exibir dados da consulta mais profunda -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        ...
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal para avisar que que esta carregando a consulta -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" data-backdrop="static">
            <div class="modal-dialog modal-dialog-centered" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLongTitle">Consultando</h5>
                </div>
                <div class="modal-body">
                  <div class="d-flex justify-content-center">
                    <div class="spinner-border" style="width: 3rem; height: 3rem;" role="status">
                      <span class="sr-only">Loading...</span>
                    </div>
                  </div>
                    <br>
                    <div class="d-flex justify-content-center">
                    <p>Realizando a consulta dos dados, aguarde um instante</p>
                    </div>
                </div>
                
              </div>
            </div>
        </div>
        
        <footer class="page-footer font-small pt-5">
            <div class="container-fluid text-center text-md-left bg-foo">
                <div class="row">
                    <div class="col-md-6 mt-md-0 mt-3">
                        <h5 style="margin-top: 10px; margin-bottom: 0px; margin-left: 10px;">BNPF</h5>
                        <p style="margin-left: 25px;">Monitorando pessoas por você.</p>

                    </div>
                    <hr class="clearfix w-100 d-md-none pb-3">
                </div>
            </div>
            <div class="footer-copyright text-center py-3 bg-white">
                ©Copyright 2019 BNPF - All Rights Reserved
            </div>
        </footer>
    </body>
</html>
