<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BNPF - Consultar Pessoas</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    
    <script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
    <script>
        $(document).ready(function(){
            //Funcao para trocar de tela quando clica no botao id=consultaE1
            $("#consultaE1" ).click(function() {
                window.location.href = "consultarEstados.jsp"
            });
            
            $( "#target" ).click(function() {
                $('#texto').hide();
                $('#card').hide();  
                $('div').removeClass('form-group');
                $('#form').removeClass('form-container');
                $('#form').addClass('form-inline');
                $('input').css('margin-right', '10px');
                $('#target').css("margin-top", "10px");
                $('#pBotao1').css("margin-top", "8%");
                $('#titulo1').css("margin-bottom", "0");
                $('#titulo1').css("margin-top", "5%");
                $('#texto1').css("margin-bottom", "0");
                $('#section1').show();
                $('#section1').css("padding-bottom", "70px");
                
                
                
            });
        });
    </script>
    
  
    <body>
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
        
        <section class="container-fluid S">
            <div class="col-md-6 offset-md-3" id="texto">
                <h2><strong>Consultar Pessoas</strong></h2>
                <p>
                    Para fins de pesquisa dos cidadãos, essa consulta recupera os dados de diversas pessoas físicas (CPF, nome, data de nascimento e estado civil), e também número de dívidas e número de ações judiciais que essa pessoa possui em seu nome, dado um intervalo tempo em anos e um trecho do nome da pessoa.
                </p>
            </div>
            
            <section class="row justify-content-center">
                <article class="col-12 col-sm-6 col-md-3" id="art1">
                    <h3 id="titulo1">Realizar a consulta</h3> 
                    <p id="texto1">Informe o intervalo de tempo nos campos abaixo!</p>
                    <form id="form" class="form-container">
                        <div class="form-group">
                            <label>Ano Inicial:</label>
                            <input type="number" class="form-control" name="quantity" min="1920" max="2019" value="1920">
                        </div>
                        <div class="form-group">
                            <label>Ano Final:</label>
                            <input type="number" class="form-control" name="quantity" min="1920" max="2019" value="2019">
                        </div>

                        
                        <p id="pBotao1" style="text-align: center;"><button id="target" type="button" class="btn btn-primary">Consultar</button></p>
                    </form>
                </article>
            </section>
        </section>
        
        <section id="section1" class="table-responsive">
            <div class="row" style="width: 100%; margin-top: 30px;" id="resul">;
                <div class="col-md-2 rounded" style="margin-left: 5%; margin-right: 5%; border:solid 1px #999; height: 400px;">.col-md-3 .col-md-offset-3</div>
                <div class="col-md-8">
                    <table class="table table-striped" style="border: solid 1px #999;">
                        <thead class="thead-dark table table-striped">
                        <tr>
                            <th>#</th>
                            <th>Firstname</th>
                            <th>Lastname</th>
                            <th>Age</th>
                            <th>City</th>
                            <th>Country</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td>1</td>
                            <td>Anna</td>
                            <td>Pitt</td>
                            <td>35</td>
                            <td>New York</td>
                            <td>USA</td>
                          </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
        
        <footer>
            <ul style="text-align: center;">
                <li style="display: inline-block; margin-left:170px; padding-top: 5px">©Copyright 2019 BNPF - All Rights Reserved</li>
                <li style="display: inline-block; float: right; padding: 5px 10px;"><a href="#">Termos de uso</a></li>
                <li style="display: inline-block; float: right; padding: 5px 10px;"><a href="#">Privacidade</a></li>
            </ul>
        </footer>
    </body>
</html>
