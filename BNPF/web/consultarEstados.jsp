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

    <script src = " https://unpkg.com/sweetalert/dist/sweetalert.min.js "></script> 
    
    <script>
        $(document).ready(function () {
            $('#myModal').modal('hide');
            var dataF = document.getElementById('dataFinal'),
                    dataI = document.getElementById('dataInicial'),
                    err_message = document.getElementById('err-message');
                    

            //Funcao para trocar de tela quando clica no botao consultar pessoas
            $("#consultaP1").click(function () {
                window.location.href = "consultarPessoas.jsp";
            });

            //Funcao para verificar o intervalo de data quando sai do campo de data final
            $(dataF).focusout(function () {
                if ($(dataF).val() < $(dataI).val()) {
                    $(dataI).css('border', '1px solid red');
                    $(dataF).css('border', '1px solid red');
                    $(err_message).fadeIn('slow', function () {
                        $(this).html('Data inicial é maior que a data final, coloque um intervalo válido!');
                    });
                } else {
                    $(dataF).css('border', '1px solid #ced4da');
                    $(dataI).css('border', '1px solid #ced4da');
                    $(err_message).fadeIn('slow', function () {
                        $(this).html('');
                    });
                }
            });

            //Funcao para verificar o intervalo de data quando sai do campo de data inicial
            $(dataI).focusout(function () {
                if ($(dataF).val() < $(dataI).val()) {
                    $(dataI).css('border', '1px solid red');
                    $(dataF).css('border', '1px solid red');
                    $(err_message).fadeIn('slow', function () {
                        $(this).html('Data inicial é maior que a data final, coloque um intervalo válido!');
                    });  
                } else {
                    $(dataF).css('border', '1px solid #ced4da');
                    $(dataI).css('border', '1px solid #ced4da');
                    $(err_message).fadeIn('slow', function () {
                        $(this).html('');
                    });
                    
                    
                }
            });

            //Funcao para tartar o click no botao de consultar
            $("#consultar").on('click', function () {
                if ($(dataF).val() < $(dataI).val()) { //Intervalo de tempo invalido
                    swal({
                        title:"Problema encontrado",
                        text: "Há algum erro no preenchimento dos dados, você deve corrigir isso para poder realizar a consulta",
                        icon: "error",
                        button: "Entendido",
                    })
                } else { //Intervalo de tempo valido
                    $('#myModal').modal('show');
                    document.getElementById("form").submit();
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
                <ul class="navbar-nav flex-row ml-md-auto d-md-flex">
                    <li class="nav-item" ><a href="index.jsp" class="nav-link p-2" href="index.jsp" style="color: white; margin-right: 10px;">Home</a></li>
                    <li class="nav-item"><button type="button" id="consultaE1" class="btn btn-outline-light active" style="margin-right: 20px;">Consultar Estados</button>
                    <li class="nav-item"><button type="button" id="consultaP1" class="btn btn-outline-light" style="margin-right: 20px;">Consultar Pessoas</button>
                </ul>
            </nav>
        </header>
        <section id="containerConsulta1" class="row flex-row container-fluid h-100" >;   

            <div class="row align-items-center  col-6">
                <div class="card bg-transparent">
                    <div  id="texto" class="card-body" style="color: white;">
                        <h2 class="card-title"><strong>Consultar Estados</strong></h2>
                        <p class="card-text">Esta consulta foi criada com o foco estatístico. Para realizar a consulta, deve-se fornecer um determinado intervalo de tempo e o sistema irá buscar por todas as dividas e ações judiciais que ocorreram neste período. Por fim, o resultado da consulta tráz diversos dados quantitativos para cada UF como: a soma do valor das dívidas, número de devedores, número de dívidas, soma dos valores em ações judiciais e também o número de ações judiciais
                        </p>
                    </div> 
                </div>
            </div>

            <div class="row justify-content-center align-items-center col-6"> 
                <form id="form" class="form-container " method="POST" action="consulta1">
                    <h3 id="titulo1">Realizar a consulta</h3> 
                    <p id="texto1">Informe o intervalo de tempo nos campos abaixo!</p>
                    <div class="form-group mx-auto">
                        <label> Data inicial</label>
                        <input name="dtInicial" type="date" class="form-control" id="dataInicial" value="1938-01-01">  
                    </div>
                    <div class="form-group  mx-auto">
                        <label> Data final</label>
                        <input name="dtFinal" type="date" class="form-control" id="dataFinal" value="2019-01-01" > 
                    </div>

                    <p style="text-align: center; width: 350px;"><span class="right" id="err-message" style="color: darkred;"></span></p>
                    
                    <p id="pBotao1" style="text-align: center;"><button id="consultar" type="button" class="btn btn-primary col-12">Consultar</button></p>     
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
