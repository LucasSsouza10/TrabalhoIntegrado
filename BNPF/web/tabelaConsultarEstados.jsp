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

    <script>
        $(document).ready(function () {
            //Funcao para trocar de tela quando clica no botao id=consultaP1
            $("#consultaP1").click(function () {
                window.location.href = "consultarPessoas.jsp";
            });

            //Funcao para trocar de tela quando clica no botao id=consultaE1
            $("#consultaE1").click(function () {
                window.location.href = "consultarEstados.jsp";
            });



            //Configurar formato da tabela que contem os resultados
            $('#myTable').DataTable({
                "pagingType": "simple_numbers",
                "searching": false,
                "bLengthChange": false,
                "order": [[0, "asc"]],
                "paging": false
            });
            $('.dataTables_length').addClass('bs-select');

            $("#consultar").on('click', function () {
                if ($(dataF).val() < $(dataI).val()) { //Intervalo de tempo invalido
                    alert('Coloque um intervalo de tempo válido!');
                } else { //Intervalo de tempo valido
                    document.getElementById("form").submit();
                }
            });

        });
    </script>

    <body style=" position: relative;">
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

        <section class="row justify-content-center" style="width: 100%;">
            <article class="form-container" id="art1" >
                <h3 id="titulo1">Realizar a consulta</h3> 
                <p id="texto1">Informe o intervalo de tempo nos campos abaixo!</p>
                <form id="form" class="form-inline" method="POST" action="consulta1">
                    <div class="form form-group">
                        <label> Data inicial</label>
                        <input name="dtInicial" type="date" class="form-control" id="dataInicial" value="1938-01-01">  
                    </div>
                    <div class="form form-group">
                        <label> Data final</label>
                        <input name="dtFinal" type="date" class="form-control" id="dataFinal" value="2019-01-01" > 
                    </div>

                    <p id="pBotao1" style="text-align: center;"><button id="consultar" type="button" class="btn btn-primary">Consultar</button></p>

                    <p style="text-align: center;"><span class="right" id="err-message" style="color: darkred;"></span></p>
                </form>
            </article>
        </section>

        <section id="section1" class="row justify-content-center container-fluid" style="padding-bottom: 80px;">
            <div class="filtros col-3">
                <h4 style="margin-bottom: 0px">Filtros dos valores</h4>
                <h5 style="margin: 5px 0px;">Valor de dívidas:</h5>
                <div class="row justify-content-center">
                    <label>De:</label>
                    <input type="number" class="col-4 form-control" placeholder="5" id="anoFinal" name="quantity" min="0">
                    <label>Até:</label>
                    <input type="number" class="col-4 form-control" placeholder="2000" id="anoFinal" name="quantity" min="0">
                </div>

                <br>
                <label style="margin: 5px 0px;">Quantidade de devedores:</label>
                <div class="row justify-content-center">
                    <label>De:</label>
                    <input type="number" class="col-4 form-control" placeholder="5" id="anoFinal" name="quantity" min="0">
                    <label>Até:</label>
                    <input type="number" class="col-4 form-control" placeholder="2000" id="anoFinal" name="quantity" min="0">
                </div>

                <br>
                <label style="margin: 5px 0px;">Quantidade de dívidas</label>
                <div class="row justify-content-center">
                    <label>De:</label>
                    <input type="number" class="col-4 form-control" placeholder="5" id="anoFinal" name="quantity" min="0">
                    <label>Até:</label>
                    <input type="number" class="col-4 form-control" placeholder="2000" id="anoFinal" name="quantity" min="0">
                </div>

                <br>
                <label style="margin: 5px 0px;">Valor de ações judiciais:</label>
                <div class="row justify-content-center">
                    <label>De:</label>
                    <input type="number" class="col-4 form-control" placeholder="8" id="anoFinal" name="quantity" min="0">
                    <label>Até:</label>
                    <input type="number" class="col-4 form-control" placeholder="500" id="anoFinal" name="quantity" min="0">
                </div>

                <br>

                <label style="margin: 5px 0px;">Quantidade de ações judiciais:</label>
                <div class="row justify-content-center">
                    <label>De:</label>
                    <input type="number" class="col-4 form-control" placeholder="8" id="anoFinal" name="quantity" min="0">
                    <label>Até:</label>
                    <input type="number" class="col-4 form-control" placeholder="500" id="anoFinal" name="quantity" min="0">
                </div>

                <br>
                <p id="pBotao1" style="text-align: center;"><button id="filtrar" type="button" class="btn btn-primary" onclick="filtrarValores()">Filtrar</button></p>
            </div>
            <div class="table-responsive col-8">
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

                        <%
                            ArrayList<Estado> arrayEstados = (ArrayList<Estado>) request.getAttribute("ArrayEstados");
                            for (int i = 0; i < arrayEstados.size(); i++) {

                        %>
                        <tr>
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
        </section>

        <footer class="page-footer font-small pt-4">

            <div class="container-fluid text-center text-md-left" style="background-color: rgb(33,150,243); padding: 24px 24px 0px;">
                <div class="row">
                    <div class="col-md-6 mt-md-0 mt-3" style="color:white;">
                        <h5 class="text-uppercase">BNPF</h5>
                        <p style="margin-left: 10px;">Monitorando pessoas por você.</p>

                    </div>
                    <hr class="clearfix w-100 d-md-none pb-3">
                </div>
                <div>

                    <!-- Facebook -->
                    <a class="fb-ic">
                        <i class="fab fa-facebook-f fa-lg white-text mr-4"> </i>
                    </a>
                    <!-- Twitter -->
                    <a class="tw-ic">
                        <i class="fab fa-twitter fa-lg white-text mr-4"> </i>
                    </a>
                    <!-- Google +-->
                    <a class="gplus-ic">
                        <i class="fab fa-google-plus-g fa-lg white-text mr-4"> </i>
                    </a>
                    <!--Linkedin -->
                    <a class="li-ic">
                        <i class="fab fa-linkedin-in fa-lg white-text mr-4"> </i>
                    </a>
                    <!--Instagram-->
                    <a class="ins-ic">
                        <i class="fab fa-instagram fa-lg white-text mr-4"> </i>
                    </a>
                    <!--Pinterest-->
                    <a class="pin-ic">
                        <i class="fab fa-pinterest fa-lg white-text"> </i>
                    </a>

                </div>

            </div>
            <div class="footer-copyright text-center py-3" style="background-color: rgb(26,120,194);">
                ©Copyright 2019 BNPF - All Rights Reserved
            </div>

        </footer>
        <!-- Footer -->
    </body>
</html>
