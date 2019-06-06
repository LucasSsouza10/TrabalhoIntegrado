<%@page import="model.Divida"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.PessoaFisica"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BNPF - Base Nacional Pessoa Física</title>
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
            var anoF = document.getElementById('anoFinal'),
                    anoI = document.getElementById('anoInicial'),
                    err_message = document.getElementById('err-message'),
                    err_message1 = document.getElementById('err-message1'),
                    err_message2 = document.getElementById('err-message2'),
                    nome = document.getElementById('nome');
            //Funcao para trocar de tela quando clica no botao id=consultaP1
            $("#consultaP1").click(function () {
                window.location.href = "consultarPessoas.jsp";
            });
            //Funcao para trocar de tela quando clica no botao id=consultaE1
            $("#consultaE1").click(function () {
                window.location.href = "consultarEstados.jsp";
            });
            //Configurar formato da tabela que contem os resultados
            var table = $('#tabela').DataTable({
                "pagingType": "simple_numbers",
                "searching": false,
                "pageLength": 20,
                "bLengthChange": false,
                "order": [[1, "asc"]],
                "columns": [
                    {"orderable": false},
                    null,
                    {"orderable": false},
                    {"orderable": false},
                    null,
                    null
                ]
            });
            $('.dataTables_length').addClass('bs-select');
            $('#tabela').on('mouseover', 'tbody tr', function () {
                $(this).css('background', 'gray');
            });
            $('#tabela').on('mouseout', 'tbody tr', function () {
                $(this).css('background', '');
            });
            $("#consultar").click(function () {
                var letter_only = /^[A-Za-záàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]/;
                var element = $(nome);
                if (($(anoFinal).val() > $(anoInicial).val()) && ($(nome).val().length >= 3) && (letter_only.test(element.val()))) {
                    document.getElementById("form").submit();
                } else {
                    swal({
                        title: "Problema encontrado",
                        text: "Há algum erro no preenchimento dos dados, você deve corrigir isso para poder realizar a consulta",
                        icon: "error",
                        button: "Entendido"
                    });
                }
            });
            $('#tabela').on('click', 'tbody tr', function () {
                $('#pnome').html($(this).find('.nome').text());
                $('#pcpf').html($(this).find('.cpf').text());
                $('#pdtNascimento').html($(this).find('.dtNascimento').text());
                $('#pestadoCivil').html($(this).find('.estadoCivil').text());
                $.ajax({
                    type: 'post',
                    url: 'ConsultarDetalhes',
                    data: {cpf: $(this).find('.cpf').text()},
                    dataType: 'JSON',
                    success: function (dados) {
                        $('#dadosDividas').html('');
                        $('#dadosAcoes').html('');
                        $.each(dados[0], function (i) {
                            $('#dadosDividas').append('<tr>');
                            $('#dadosDividas').append('<td>' + dados[0][i].contrato + '</td>');
                            $('#dadosDividas').append('<td>' + dados[0][i].cnpj + '</td>');
                            $('#dadosDividas').append('<td>' + dados[0][i].data.dayOfMonth + '/' + dados[0][i].data.month + '/' + dados[0][i].data.year + '</td>');
                            $('#dadosDividas').append('<td>' + dados[0][i].valor + '</td>');
                            $('#dadosDividas').append('</tr>');
                        });
                        $.each(dados[1], function (i) {
                            $('#dadosAcoes').append('<tr>');
                            $('#dadosAcoes').append('<td>' + dados[1][i].numProcesso + '</td>');
                            $('#dadosAcoes').append('<td>' + dados[1][i].identAutor + '</td>');
                            $('#dadosAcoes').append('<td>' + dados[1][i].situacao + '</td>');
                            $('#dadosAcoes').append('<td>' + dados[1][i].data.dayOfMonth + '/' + dados[1][i].data.month + '/' + dados[1][i].data.year + '</td>');
                            $('#dadosAcoes').append('<td>' + dados[1][i].valor + '</td>');
                            $('#dadosAcoes').append('</tr>');
                        });
                    }
                });
            });
        }
        );
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
                    <article class="form-container">
                        <h3 id="titulo1">Realizar nova consulta</h3> 
                        <p id="texto1">Informe o intervalo de tempo nos campos abaixo!</p>
                        <form id="form" class="form" method="POST" action="consulta2">
                            <div class="form form-group">
                                <label for="usr">Trecho do nome:</label>
                                <input name="nome" id="nome" type="text" class="form-control" id="usr" placeholder="Digite pelo menos três letras">
                            </div>
                            <div class="form form-group">
                                <label>Ano Inicial:</label>
                                <input name="anoInicial" type="number" class="form-control" id="anoInicial" name="quantity" min="1920" max="2019" value="1920">
                            </div>
                            <div class="form form-group">
                                <label>Ano Final:</label>
                                <input name="anoFinal" type="number" class="form-control" id="anoFinal" name="quantity" min="1920" max="2019" value="2019">
                            </div>

                            <div class="form form-group" style="height: 38px;">
                                <p style="text-align: center;"><button id="consultar" type="button" class="btn btn-primary" >Consultar</button></p>
                            </div>


                            <p style="text-align: center;"><span class="right" id="err-message" style="color: darkred;"></span></p>
                        </form>
                    </article>
                </div>


                <div class="container form-container mt-5">
                    <!--<div class="form-container">-->
                    <h4 style="margin-bottom: 0px">Filtrar valores</h4>

                    <br>
                    <div class="fil">
                        <label style="margin: 5px 0px 0px 0px">Quantidade de dívidas:</label>
                        <div class="row justify-content-center">
                            <label>De:</label>
                            <input type="number" class="col-4 form-control" placeholder="5" id="anoFinal" name="quantity" min="0">
                            <label>Até:</label>
                            <input type="number" class="col-4 form-control" placeholder="2000" id="anoFinal" name="quantity" min="0">
                        </div>
                    </div>


                    <br>

                    <div class="fil">
                        <label style="margin: 5px 0px 0px 0px">Quantidade de ações judiciais:</label>
                        <div class="row justify-content-center">
                            <label>De:</label>
                            <input type="number" class="col-4 form-control" placeholder="8" id="anoFinal" name="quantity" min="0">
                            <label>Até:</label>
                            <input type="number" class="col-4 form-control" placeholder="500" id="anoFinal" name="quantity" min="0">
                        </div>
                    </div>


                    <br>
                    <p id="pBotao1" style="text-align: center;"><button id="filtrar" type="button" class="btn btn-primary col-12" onclick="filtrarValores()">Filtrar</button></p>
                </div>
            </div>
        </div>

        <div class="col-9">
            <div class="table-responsive">
                <p style="margin-bottom: 5px;">Resultados da consulta na tabela a seguir, observação: Quant. significa Quantidade</p>
                <table id="tabela" class="table table-striped table-bordered table-sm">
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
                        <%
                            ArrayList<PessoaFisica> arrayPessoas = (ArrayList<PessoaFisica>) request.getAttribute("ArrayPessoas");
                            SimpleDateFormat s = new SimpleDateFormat("dd/MM/yyyy");
                            for (int i = 0; i < arrayPessoas.size(); i++) {
                        %>
                        <tr data-toggle="modal" data-target="#modalPessoa">
                            <td class="cpf"><%= arrayPessoas.get(i).getCpf()%></td>
                            <td class="nome"><%= arrayPessoas.get(i).getNome()%></td>
                            <td class="dtNascimento"><%= s.format(arrayPessoas.get(i).getDtNascimento().getTime())%></td>
                            <td class="estadoCivil"><%= arrayPessoas.get(i).getEstadoCivil()%></td>
                            <td ><%= arrayPessoas.get(i).getQuantDividas()%></td>
                            <td><%= arrayPessoas.get(i).getQuantAcoes()%></td>
                        </tr>

                        <% }%>
                    </tbody>
                </table>
            </div>
        </div>

    </section>


    <!-- Modal -->
    <div class="modal fade" id="modalPessoa" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title" id="exampleModalLabel">Detalhes pessoas</h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div id="modal-body" class="modal-body">
                    <div>
                        <h5>Dados Pessoais</h5>
                        <label>Nome:</label><p id="pnome"></p>
                        <label>CPF:</label><p id="pcpf"></p>
                        <label>Data de Nascimento:</label><p id="pdtNascimento"></p>
                        <label>Estado civil</label><p id="pestadoCivil"></p>
                    </div>
                    <div id='dividas'>
                        <h5>Dividas</h5>
                        <table class="table table-striped table-bordered table-sm">
                            <thead>
                                <tr>
                                    <th class='th-sm'>Contrato</th>
                                    <th class='th-sm'>CNPJ</th>
                                    <th class='th-sm'>Data</th>
                                    <th class='th-sm'>Valor</th>
                                </tr>
                            </thead>
                            <tbody id="dadosDividas">

                            </tbody>
                        </table>
                    </div>

                    <div id='acoes'> 
                        <h5>Acoes</h5>
                        <table class="table table-striped table-bordered table-sm">
                            <thead>
                                <tr>
                                    <th class='th-sm'>Numero do processo</th>
                                    <th class='th-sm'>Autor</th>
                                    <th class='th-sm'>Situação</th>
                                    <th class='th-sm'>Data</th>
                                    <th class='th-sm'>Valor</th>
                                </tr>
                            </thead>
                            <tbody id="dadosAcoes">

                            </tbody>
                        </table>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                </div>
            </div>
        </div>
    </div>


    <footer>
        <ul style="text-align: center;">
            <li style="display: inline-block; margin-left:170px; padding-top: 5px">©Copyright 2019 BNPF - All Rights Reserved</li>
            <li style="display: inline-block; float: right; padding: 5px 10px;"><a href="#">Termos de uso</a></li>
            <li style="display: inline-block; float: right; padding: 5px 10px;"><a href="#">Privacidade</a></li>
        </ul>
    </footer>
</body>
</html>
