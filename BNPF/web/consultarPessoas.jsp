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

    <script src = " https://unpkg.com/sweetalert/dist/sweetalert.min.js "></script> 

    <script>
        
        $(document).ready(function () {
            $('#myModal').modal('hide');
            
            //Variaveis que serão utilizadas no decorrer do <script>
            var anoF = document.getElementById('anoFinal'),
                    anoI = document.getElementById('anoInicial'),
                    err_message = document.getElementById('err-message'),
                    err_message1 = document.getElementById('err-message1'),
                    err_message2 = document.getElementById('err-message2'),
                    nome = document.getElementById('nome');

            //Funcao para trocar de tela quando clica no botao id=consultaE1
            $("#consultaE1").click(function () {
                window.location.href = "consultarEstados.jsp";
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

            //Funcao para tratar o click no botao de consultar
            $("#target").click(function () {
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
        });

    </script>


    <body>
        <header>
            <nav class="navbar navbar-dark bg-primary" style="padding: 0px;">
                <a class="navbar-brand" href="#">
                    <img src="./LogoBNPF.png" width="80" height="80" alt="" style="margin-left: 20px;">
                </a>
                <ul class="navbar-nav flex-row ml-md-auto d-md-flex">
                    <li class="nav-item" ><a href="index.jsp" class="nav-link p-2" href="index.jsp" style="color: white; margin-right: 10px;">Home</a></li>
                    <li class="nav-item"><button type="button" id="consultaE1" class="btn btn-outline-light" style="margin-right: 20px;">Consultar Estados</button>
                    <li class="nav-item"><button type="button" id="consultaP1" class="btn btn-outline-light active" style="margin-right: 20px;">Consultar Pessoas</button>
                </ul>
            </nav>
        </header>

        <section id="containerConsulta2" class="row flex-row-reverse container-fluid h-100">

            <div class="row align-items-center  col-6">
                <div class="card bg-transparent">
                    <div  id="texto" class="card-body" style="color: white;">
                        <h2 class="card-title"><strong>Consultar Pessoas</strong></h2>
                        <p class="card-text">Para fins de pesquisa dos cidadãos, essa consulta recupera os dados de diversas pessoas físicas (CPF, nome, data de nascimento e estado civil), e também número de dívidas e número de ações judiciais que essa pessoa possui em seu nome, dado um intervalo tempo em anos e um trecho do nome da pessoa.
                        </p>
                    </div> 
                </div>
            </div>


            <div class="row justify-content-center align-items-center col-6">

                <form id="form" class="form-container" method="POST" action="consulta2">
                    <h3 id="titulo1">Realizar a consulta</h3> 
                    <p id="texto1">Informe o intervalo de tempo nos campos abaixo!</p>
                    <div class="form-group">
                        <label for="usr">Trecho do nome:</label>
                        <input name="nome" id="nome" type="text" class="form-control" placeholder="Digite no mínimo três letras">
                    </div>
                    <div class="form-group">
                        <label>Ano Inicial:</label>
                        <input name="anoInicial" type="number" class="form-control" id="anoInicial" name="quantity" min="1920" max="2019" value="1920">
                    </div>
                    <div class="form-group">
                        <label>Ano Final:</label>
                        <input name="anoFinal" type="number" class="form-control" id="anoFinal" name="quantity" min="1920" max="2019" value="2019">
                    </div>

                    <p style="text-align: center; width: 336px;"><span class="right" id="err-message" style="color: darkred;"></span>
                        <br><span class="right" id="err-message1" style="color: darkred;"></span>
                        <br><span class="right" id="err-message2" style="color: darkred;"></span>
                    </p>

                    <p id="pBotao1" style="text-align: center;"><button id="target" type="button" class="btn btn-primary col-12">Consultar</button></p>
                </form>
            </div>
        </section>
        
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

        <footer class="page-footer font-small">
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
