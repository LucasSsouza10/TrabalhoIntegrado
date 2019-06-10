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

            gerarInformacoes();

            $('#tabela').on('click', 'tbody tr', function () {
                var UF = $(this).find('.UF').text();
                $('#UF').html('Sigla da Unidade Federativa: ' + UF);
                for (var i = 0; i < 27; i++) {
                    if (UF === colunaValorDivida[i].estado) {
                        $('#rankValorDividas').html(i + 1 + 'ª Unidade Federativa com maior valor de dívidas');
                    }
                    if (UF === colunaQntDevedores[i].estado) {
                        $('#rankQntDevedores').html(i + 1 + 'ª Unidade Federativa com maior quantidade de devedores');
                    }
                    if (UF === colunaQntDivida[i].estado) {
                        $('#rankQntDividas').html(i + 1 + 'ª Unidade Federativa com maior quantidade de dívidas');
                    }
                    if (UF === colunaValorAcoes[i].estado) {
                        $('#rankValorAcoes').html(i + 1 + 'ª Unidade Federativa com maior valor de acções ju');
                    }
                    if (UF === colunaQntAcoes[i].estado) {
                        $('#rankQntAcoes').html(i + 1 + 'ª Unidade Federativa com maior quantidade de devedores');
                    }
                }
            });



            function gerarInformacoes() {

                var table = $('#tabela').DataTable();
                var estado, valor1, valor2, valor3, valor4, valor5;
                var totalNorte = 0, totalNordeste = 0, totalSudeste = 0, totalCentroOeste = 0, totalSul = 0;
                colunaValorDivida = [], colunaQntDevedores = [], colunaQntDivida = [], colunaValorAcoes = [], colunaQntAcoes = [];
                for (var i = 0; i < 27; i++) {
                    estado = table.cell(i, 0).data();
                    valor1 = parseFloat(table.cell(i, 1).data());
                    valor2 = parseInt(table.cell(i, 2).data());
                    valor3 = parseInt(table.cell(i, 3).data());
                    valor4 = parseFloat(table.cell(i, 4).data());
                    valor5 = parseInt(table.cell(i, 5).data());

                    colunaValorDivida[i] = {valor: valor1, estado: estado};
                    colunaQntDevedores[i] = {valor: valor2, estado: estado};
                    colunaQntDivida[i] = {valor: valor3, estado: estado};
                    colunaValorAcoes[i] = {valor: valor4, estado: estado};
                    colunaQntAcoes[i] = {valor: valor5, estado: estado};

                    //Regiao norte, 7 estados
                    if (estado === "AM" || estado === "RR" || estado === "AP" || estado === "PA" || estado === "TO" || estado === "RO" || estado === "AC") {
                        totalNorte = totalNorte + valor2;
                    } //Regiao centro oeste, 4 estados
                    else if (estado === "DF" || estado === "MT" || estado === "MS" || estado === "GO") {
                        totalCentroOeste = totalCentroOeste + valor2;
                    } //Regiao sudeste, 4 estados
                    else if (estado === "SP" || estado === "RJ" || estado === "ES" || estado === "MG") {
                        totalSudeste = totalSudeste + valor2;
                    }//Regiao Sul, 3 estados
                    else if (estado === "PR" || estado === "RS" || estado === "SC") {
                        totalSul = totalSul + valor2;
                    } //Regiao Nordeste, 9 estados
                    else if (estado === "MA" || estado === "PI" || estado === "CE" || estado === "RN" || estado === "PE" || estado === "PB" || estado === "SE" || estado === "AL" || estado === "BA") {
                        totalNordeste = totalNordeste + valor2;
                    }

                }

                function compare(a, b) {
                    if (a.valor > b.valor)
                        return -1;
                    if (a.valor < b.valor)
                        return 1;
                    return 0;
                }
                colunaValorDivida.sort(compare);
                colunaQntDevedores.sort(compare);
                colunaQntDivida.sort(compare);
                colunaValorAcoes.sort(compare);
                colunaQntAcoes.sort(compare);
                $('#NomeNorte').html('Norte');
                $('#ValorNorte').html(totalNorte);
                $('#NomeNordeste').html('Nordeste');
                $('#ValorNordeste').html(totalNordeste);
                $('#NomeCentroOeste').html('Centro-Oeste');
                $('#ValorCentroOeste').html(totalCentroOeste);
                $('#NomeSudeste').html('Sudeste');
                $('#ValorSudeste').html(totalSudeste);
                $('#NomeSul').html('Sul');
                $('#ValorSul').html(totalSul);


                var canvas = document.getElementById('canvas');

                var data = [], colors = [], total = 0;

                data[0] = totalNorte;
                data[1] = totalNordeste;
                data[2] = totalCentroOeste;
                data[3] = totalSudeste;
                data[4] = totalSul;
                total = totalNorte + totalNordeste + totalCentroOeste + totalSudeste + totalSul;
                colors[0] = 'rgb(132,194,37)';
                colors[1] = 'rgb(231,120,23)';
                colors[2] = 'rgb(203,0,151)';
                colors[3] = 'rgb(1,141,220)';
                colors[4] = 'rgb(205,153,139)';

                var ctx = canvas.getContext('2d');
                var canvas_size = [canvas.width, canvas.height];
                var radius = Math.min(canvas_size[0], canvas_size[1]) / 2;
                var center = [canvas_size[0] / 2, canvas_size[1] / 2];
                var sofar = 0; // monitora o andamento do script   
                // loop por data[]   
                for (var piece in data) {
                    var thisvalue = data[piece] / total;
                    ctx.beginPath();
                    ctx.moveTo(center[0], center[1]);
                    // centro do gráfico       
                    ctx.arc(// desenha próximo arco           
                            center[0],
                            center[1],
                            radius,
                            Math.PI * (-0.5 + 2 * sofar), // -0.5 define o início no topo           
                            Math.PI * (-0.5 + 2 * (sofar + thisvalue)), false);
                    ctx.lineTo(center[0], center[1]); // linha de retorno ao centro      
                    ctx.closePath();
                    ctx.fillStyle = colors[piece];    // cor       
                    ctx.fill();
                    sofar += thisvalue; // incrementa o andamento do script   
                }
            }

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

            var trs = '';

            $('#filtrar').click(function () {
                $('#corpoTable').append(trs);
                trs = '';

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

                var ValorMinValDiv = 0.0, ValorMaxValDiv = parseFloat($(maxValDividas).text().replace(',', '.'));
                var ValorMinQntDev = 0, ValorMaxQntDev = parseInt($(maxQntDevedores).text());
                var ValorMinQntDiv = 0, ValorMaxQntDiv = parseInt($(maxQntDividas).text());
                var ValorMinValAcs = 0.0, ValorMaxValAcs = parseFloat($(maxValAcoes).text().replace(',', '.'));
                var ValorMinQntAcs = 0, ValorMaxQntAcs = parseInt($(maxQntAcoes).text());


                if ($(deValDividas).val().length > 0) {
                    ValorMinValDiv = parseFloat($(deValDividas).val());
                }
                if ($(ateValDividas).val().length > 0) {
                    ValorMaxValDiv = parseFloat($(ateValDividas).val());
                }
                //----------------------------------

                if ($(deQntDevedores).val().length > 0) {
                    ValorMinQntDev = parseInt($(deQntDevedores).val());
                }
                if ($(ateQntDevedores).val().length > 0) {
                    ValorMaxQntDev = parseInt($(ateQntDevedores).val());
                }
                //----------------------------------

                if ($(deQntDividas).val().length > 0) {
                    ValorMinQntDiv = parseInt($(deQntDividas).val());
                }
                if ($(ateQntDividas).val().length > 0) {
                    ValorMaxQntDiv = parseInt($(ateQntDividas).val());
                }
                //----------------------------------

                if ($(deValAcs).val().length > 0) {
                    ValorMinValAcs = parseFloat($(deValAcs).val());
                }
                if ($(ateValAcs).val().length > 0) {
                    ValorMaxValAcs = parseFloat($(ateValAcs).val());
                }
                //----------------------------------

                if ($(deQntAcs).val().length > 0) {
                    ValorMinQntAcs = parseInt($(deQntAcs).val());
                }
                if ($(ateQntAcs).val().length > 0) {
                    ValorMaxQntAcs = parseInt($(ateQntAcs).val());
                }

                $('#tabela').find('tr').each(function (j) {
                    var flag = true;
                    $(this).find('td').each(function (i) {
                        if (i === 1 && flag) //valor das dividas
                            if (parseFloat($(this).html()) < ValorMinValDiv || parseFloat($(this).html()) > ValorMaxValDiv) {
                                trs += '<tr data-toggle="modal" data-target="#exampleModal">' + $(this).parent().html() + '</tr>';
                                $(this).parent().remove();
                                flag = false;
                            }
                        if (i === 2 && flag) //quantidade devedores
                            if (parseFloat($(this).html()) < ValorMinQntDev || parseFloat($(this).html()) > ValorMaxQntDev) {
                                trs += '<tr data-toggle="modal" data-target="#exampleModal">' + $(this).parent().html() + '</tr>';
                                $(this).parent().remove();
                                flag = false;
                            }
                        if (i === 3 && flag) //quantidade dividas
                            if (parseFloat($(this).html()) < ValorMinQntDiv || parseFloat($(this).html()) > ValorMaxQntDiv) {
                                trs += '<tr data-toggle="modal" data-target="#exampleModal">' + $(this).parent().html() + '</tr>';
                                $(this).parent().remove();
                                flag = false;
                            }
                        if (i === 4 && flag) //valor açoes 
                            if (parseFloat($(this).html()) < ValorMinValAcs || parseFloat($(this).html()) > ValorMaxValAcs) {
                                trs += '<tr data-toggle="modal" data-target="#exampleModal">' + $(this).parent().html() + '</tr>';
                                $(this).parent().remove();
                                flag = false;
                            }
                        if (i === 5 && flag) //quantidade açoes
                            if (parseFloat($(this).html()) < ValorMinQntAcs || parseFloat($(this).html()) > ValorMaxQntAcs) {
                                trs += '<tr data-toggle="modal" data-target="#exampleModal">' + $(this).parent().html() + '</tr>';
                                $(this).parent().remove();
                                flag = false;
                            }
                    });
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
            <div class="col-3">
                <div class="container">
                    <article class="form-container" id="art1" >
                        <h3 id="titulo1">Realizar nova consulta</h3> 
                        <p id="texto1">Informe o intervalo de tempo nos campos abaixo!</p>
                        <form id="form" class="form" method="POST" action="consulta1">
                            <%
                                String dataI = (String) request.getAttribute("dtInicial");
                                String dataF = (String) request.getAttribute("dtFinal");
                            %>
                            <div class="form form-group">
                                <label> Data inicial</label>
                                <input name="dtInicial" type="date" class="form-control" id="dataInicial" value= <%= dataI%> >  
                            </div>
                            <div class="form form-group">
                                <label> Data final</label>
                                <input name="dtFinal" type="date" class="form-control" id="dataFinal" value= <%=  dataF%> > 
                            </div>
                            <p style="text-align: center;"><span class="right" id="err-message" style="color: darkred;"></span></p>
                            <p id="pBotao1" style="text-align: center;"><button id="consultar" type="button" class="btn btn-primary col-12">Consultar</button></p>
                        </form>

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
                    <h5 style="margin-bottom: 8px;">Tabela com os resultados da consulta de estados.</h5>
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
                                double maxValDividas = 0, maxQntDevedores = 0, maxQntDividas = 0, maxValAcoes = 0, maxQntAcoes = 0;
                                for (int i = 0; i < arrayEstados.size(); i++) {
                                    if (arrayEstados.get(i).getValorDividas() > maxValDividas) {
                                        maxValDividas = arrayEstados.get(i).getValorDividas();
                                    }
                                    if (arrayEstados.get(i).getQuantDevedores() > maxQntDevedores) {
                                        maxQntDevedores = arrayEstados.get(i).getQuantDevedores();
                                    }
                                    if (arrayEstados.get(i).getQuantDividas() > maxQntDividas) {
                                        maxQntDividas = arrayEstados.get(i).getQuantDividas();
                                    }
                                    if (arrayEstados.get(i).getValorAcoes() > maxValAcoes) {
                                        maxValAcoes = arrayEstados.get(i).getValorAcoes();
                                    }
                                    if (arrayEstados.get(i).getQuantAcoes() > maxQntAcoes) {
                                        maxQntAcoes = arrayEstados.get(i).getQuantAcoes();
                                    }
                            %>
                            <tr  data-toggle="modal" data-target="#exampleModal">
                                <td class="UF"><%= arrayEstados.get(i).getUf()%></td>
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
                    <div class="esconder">
                        <label id="maxValDividas"><%= maxValDividas%></label>
                        <label id="maxQntDevedores"><%= maxQntDevedores%></label>
                        <label id="maxQntDividas"><%= maxQntDividas%></label>
                        <label id="maxValAcoes"><%= maxValAcoes%></label>
                        <label id="maxQntAcoes"><%= maxQntAcoes%></label>
                    </div>
                </div>
            </div>
        </section>

        <!-- Modal para exibir dados da consulta mais profunda -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Mais informações</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div>
                            <h5><b>Dados da Unidade Federativa</b></h5>
                            <p id="UF"></p>
                            <p id="rankValorDividas"></p>
                            <p id="rankQntDevedores"></p>
                            <p id="rankQntDividas"></p>
                            <p id="rankValorAcoes"></p>
                            <p id="rankQntAcoes"></p>
                        </div>
                        <br>
                        <div id='regioes'> 
                            <h5><b>Devedores por Regiao do Brasil</b></h5>
                            <table class="table table-bordered table-sm">
                                <thead>
                                    <tr style="background-color: rgb(52,58,64);">
                                        <th class='th-sm' style="color: white;">Cor</th>
                                        <th class='th-sm' style="color: white;">Regiao</th>
                                        <th class='th-sm' style="color: white;">Quantidade de devedores</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td style="background-color: rgb(132,194,37);"></td>
                                        <td id="NomeNorte"></td>
                                        <td id="ValorNorte"></td>
                                    </tr>
                                    <tr>
                                        <td style="background-color: rgb(231,120,23);"></td>
                                        <td id="NomeNordeste"></td>
                                        <td id="ValorNordeste"></td>
                                    </tr>
                                    <tr>
                                        <td style="background-color: rgb(203,0,151);"></td>
                                        <td id="NomeCentroOeste"></td>
                                        <td id="ValorCentroOeste"></td>
                                    </tr>
                                    <tr>
                                        <td style="background-color: rgb(1,141,220);"></td>
                                        <td id="NomeSudeste"></td>
                                        <td id="ValorSudeste"></td>
                                    </tr>
                                    <tr>
                                        <td style="background-color: rgb(205,153,139);"></td>
                                        <td id="NomeSul"></td>
                                        <td id="ValorSul"></td>
                                    </tr>
                                </tbody>
                            </table>
                            <br>
                            <div style="text-align: center;">
                                <canvas id="canvas" width="300" height="300"></canvas> 
                                <h6>Gráfico circular, representando o número de devedores em cada região do Brasil de acordo com a tabela acima</h6>
                            </div>
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
