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
            $('#myModal').modal('hide');
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
                    $('#myModal').modal('show');
                    document.getElementById("form").submit();
                } else {
                    swal({
                        title: "Problema encontrado",
                        text: "Há algum erro no preenchimento dos dados, você deve corrigir isso para poder realizar a consulta",
                        icon: "error",
                        button: "Entendido"
                    });
                    if ($(nome).val().length < 3) {
                        $(nome).css('border', '1px solid red');
                        $(err_message1).fadeIn('slow', function () {
                            $(this).html('Digite no mínimo três letras no trecho de nome.');
                        });
                    }
                }
            });

            //Funcao para verificar quando sair do campo ano final
            $(anoF).focusout(function () {
                verificar();
            });

            //Funcao para verificar quando sair do campo ano inicial
            $(anoI).focusout(function () {
                verificar();
            });

            //Funcao para verificar quando sair do campo nivel
            $(nome).focusout(function () {
                verificar();
            });

            $('#tabela').on('click', 'tbody tr', function () {
                $('#pnome').html($(this).find('.nome').text());
                $('#pcpf').html($(this).find('.cpf').text());
                $('#pdtNascimento').html($(this).find('.dtNascimento').text());
                $('#pestadoCivil').html($(this).find('.estadoCivil').text());
                $.ajax({
                    type: 'post',
                    url: 'ConsultarDetalhes',
                    data: {cpf: $(this).find('.cpf').text(), anoI: $('#anoI').text(), anoF: $('#anoF').text()},
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

            //Funcao para verificar todos os campos
            function verificar() {
                var letter_only = /^[A-Za-záàâãéèêíïóôõöúçÁÀÂÃÉÈÍÏÓÔÕÖÚÇ]/;
                var element = $(nome);
                var flag = 0;

                if (!(letter_only.test(element.val()))) {
                    $(nome).css('border', '1px solid red');
                    flag = 1;
                    $(err_message).fadeIn('slow', function () {
                        $(this).html('Nome invalido, permitido somente letras.');
                    });
                } else {
                    $(nome).css('border', '1px solid #ced4da');
                    $(err_message).fadeIn('slow', function () {
                        $(this).html('');
                    });
                }

                if ($(nome).val().length < 3) {
                    $(nome).css('border', '1px solid red');
                    $(err_message1).fadeIn('slow', function () {
                        $(this).html('Digite no mínimo três letras no trecho de nome.');
                    });
                } else {
                    if (flag === 0) {
                        $(nome).css('border', '1px solid #ced4da');
                    }
                    $(err_message1).fadeIn('slow', function () {
                        $(this).html('');
                    });
                }
                if ($(anoF).val() < $(anoI).val()) {
                    $(anoI).css('border', '1px solid red');
                    $(anoF).css('border', '1px solid red');
                    $(err_message2).fadeIn('slow', function () {
                        $(this).html('Ano inicial é maior que o ano final, coloque um intervalo válido!');
                    });
                } else {
                    $(anoF).css('border', '1px solid #ced4da');
                    $(anoI).css('border', '1px solid #ced4da');
                    $(err_message2).fadeIn('slow', function () {
                        $(this).html('');
                    });
                }
            }

            var trs = '';

            $('#filtrar').on('click', function () {
                table.destroy();
                $('#corpoTable').append(trs);
                trs = '';

                var maxQntDividas = 8,
                        maxQntAcoes = 8,
                        deQntDividas = document.getElementById('deQntDividas'),
                        ateQntDividas = document.getElementById('ateQntDividas'),
                        deQntAcoes = document.getElementById('deQntAcoes'),
                        ateQntAcoes = document.getElementById('ateQntAcoes');

                var minDiv = 0, maxDiv = 0, minAcs = 0, maxAcs = 0;

                if ($(deQntDividas).val().length > 0) {
                    minDiv = parseInt($(deQntDividas).val());
                }

                if ($(ateQntDividas).val().length > 0) {
                    maxDiv = parseInt($(ateQntDividas).val());
                } else {
                    maxDiv = maxQntDividas;
                }

                if ($(deQntAcoes).val().length > 0) {
                    minAcs = parseInt($(deQntAcoes).val());
                }
                if ($(ateQntAcoes).val().length > 0) {
                    maxAcs = parseInt($(ateQntAcoes).val());
                } else {
                    maxAcs = maxQntAcoes;
                }

                $('#tabela').find('tr').each(function (i) {
                    var flag = true;
                    $(this).find('td').each(function (i) {
                        if (i === 4) //quantidade dividas
                            if (parseInt($(this).html()) < minDiv || parseInt($(this).html()) > maxDiv) {
                                trs += '<tr data-toggle="modal" data-target="#modalPessoa">' + $(this).parent().html() + '</tr>';
                                $(this).parent().remove();
                                flag = false;
                            }


                        if (i === 5 && flag) //quantidade açoes
                            if (parseInt($(this).html()) < minAcs || parseInt($(this).html()) > maxAcs) {
                                trs += '<tr data-toggle="modal" data-target="#modalPessoa">' + $(this).parent().html() + '</tr>';
                                $(this).parent().remove();
                            }

                    });

                });
                table = $('#tabela').DataTable({
                    "pagingType": "simple_numbers",
                    "searching": false,
                    "pageLength": 50,
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
                swal({
                    title: "Sucesso",
                    text: "A filtragem foi realizada, consulte os resultados",
                    icon: "success",
                    button: "Entendido"
                });
            });


        });




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
            <div class="comp">
                <div class="container">
                    <article class="form-container">
                        <h3 id="titulo1">Realizar nova consulta</h3> 
                        <p id="texto1">Informe o intervalo de tempo nos campos abaixo!</p>
                        <form id="form" class="form" method="POST" action="consulta2">
                            <div class="form form-group">
                                <label for="usr">Trecho do nome:</label>
                                <input name="nome" id="nome" type="text" class="form-control" placeholder="Digite pelo menos três letras">
                            </div>
                            <div class="form form-group">
                                <label>Ano Inicial:</label>
                                <input name="anoInicial" type="number" class="form-control" id="anoInicial" name="quantity" min="1938" max="2019" value="1938">
                            </div>
                            <div class="form form-group">
                                <label>Ano Final:</label>
                                <input name="anoFinal" type="number" class="form-control" id="anoFinal" name="quantity" min="1938" max="2019" value="2019">
                            </div>

                            <p style="text-align: center; width: 100%;">
                                <span  id="err-message" style="color: darkred;"></span>
                                <br><span  id="err-message1" style="color: darkred;"></span>
                                <br><span  id="err-message2" style="color: darkred;"></span>
                            </p>


                            <p style="text-align: center;"><button id="consultar" type="button" class="btn btn-primary col-12">Consultar</button></p>

                        </form>
                    </article>
                </div>


                <div class="container mt-5">
                    <div class="form-container">
                        <h4 style="margin-bottom: 0px">Filtrar valores</h4>

                        <br>
                        <div class="fil">
                            <label style="margin: 5px 0px 0px 0px">Quantidade de dívidas:</label>
                            <div class="row justify-content-center">
                                <label>De:</label>
                                <input type="number" class="col-4 form-control" placeholder="Ex: 5" id="deQntDividas" name="quantity" min="0">
                                <label>Até:</label>
                                <input type="number" class="col-4 form-control" placeholder="Ex: 10" id="ateQntDividas" name="quantity" min="0">
                            </div>
                        </div>


                        <br>

                        <div class="fil">
                            <label style="margin: 5px 0px 0px 0px">Quantidade de ações judiciais:</label>
                            <div class="row justify-content-center">
                                <label>De:</label>
                                <input type="number" class="col-4 form-control" placeholder="Ex: 8" id="deQntAcoes" name="quantity" min="0">
                                <label>Até:</label>
                                <input type="number" class="col-4 form-control" placeholder="Ex: 9" id="ateQntAcoes" name="quantity" min="0">
                            </div>
                        </div>


                        <br>
                        <p id="pBotao1" style="text-align: center;"><button id="filtrar" type="button" class="btn btn-primary col-12">Filtrar</button></p>
                    </div>
                </div>
            </div>


            <div class="tab">
                <div class="table-responsive">
                    <%
                        String nome = (String) request.getAttribute("nome");
                        int anoInicial = (int) request.getAttribute("anoInicial");
                        int anoFinal = (int) request.getAttribute("anoFinal");
                    %>

                    <h5 style="margin-bottom: 8px;">Tabela com os resultados da consulta de pessoas. Quant. significa Quantidade.</h5>
                    <div class="mb-3">
                        <span><strong>Nome:</strong><%= ' ' + nome.toUpperCase() %></span>
                        <span class="ml-2"><strong>Ano Inical: </strong><p id='anoI'><%= anoInicial%></p> </span>
                        <span class="ml-2"><strong>Ano Final:</strong><p id="anoF"><%= anoFinal%></p></span>
                    </div>
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

        <!-- Modal para a busca avançada -->
        <div class="modal fade" id="modalPessoa" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h2 class="modal-title" id="exampleModalLabel">Mais informações</h2>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div id="modal-body" class="modal-body">
                        <div class="col-7 mx-auto">
                            <div class="perfil-titulo text-center">
                                <h3 id="pnome" ></h3>
                            </div> 
                            <ul class="perfil-lista">
                                <li class="clearfix"><strong class="titulo">Cpf:</strong><span id="pcpf" class="cont"></span></li>
                                <li class="clearfix"><strong class="titulo">Data de Nascimento:</strong><span id="pdtNascimento" class="cont"></span></li>
                                <li class="clearfix"><strong class="titulo">Estado Civil:</strong><span id="pestadoCivil" class="cont"></span></li>       
                            </ul>
                        </div>
                        <br>
                        <div id='dividas'>
                            <h5><b>Dividas</b></h5>
                            <table class="table table-striped table-bordered table-sm">
                                <thead>
                                    <tr class="header">
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
                        <br>
                        <div id='acoes'> 
                            <h5><b>Acoes</b></h5>
                            <table class="table table-striped table-bordered table-sm">
                                <thead>
                                    <tr class="header">
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
