<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BNPF - Consultar</title>
        <link rel="stylesheet" type="text/css" href="styleConsultarEstados.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-dark bg-primary" style="padding: 0px;">
                <a class="navbar-brand" href="#">
                        <img src="./LogoBNPF.png" width="80" height="80" alt="" style="margin-left: 20px;">
                </a>
                <ul class="navbar-nav flex-row ml-md-auto d-none d-md-flex">
                        <li class="nav-item" ><a class="nav-link p-2" href="index.jsp">Home</a></li>
                        <li class="nav-item"><button type="button" class="btn btn-outline-light active" href="#" style="margin-right: 10px;">Consultar Estados</button>
                        <li class="nav-item"><button type="button" class="btn btn-outline-light" style="margin-right: 20px;">Consultar Pessoas</button>
                  </ul>
        </nav>
        
        <section style="margin-top: 20px;">
            <div class="col-md-6 offset-md-3">
                <h2><strong>Consultar Estados</strong></h2>
                <p>Esta consulta foi criada com o foco estatístico. Para realizar a consulta, deve-se fornecer um determinado intervalo de tempo e o sistema irá buscar por todas as dividas e ações judiciais que ocorreram neste período. Por fim, o resultado da consulta tráz diversos dados quantitativos para cada UF como: a soma do valor das dívidas, número de devedores, número de dívidas, soma dos valores em ações judiciais e também o número de ações judiciais
                </p>
            </div>
            
            <article style="width: 500px; margin-top: 0px;">
                <div class="container" style="width: 400px;">
                    <h3>Realizar a consulta</h3> 
                    <p style="margin-bottom: 20px;">Informe o intervalo de tempo nos campos abaixo!</p>
                    <form id="signup" autocomplete="on" action="/action_page.php" ">
                        <div class="form-group">
                            <div class="col-md-6 offset-md-3">
                                <label> Data inicial</label>
                                <input type="date" class="form-control" id="dataInicial" value="aaaa-mm-dd" style="width: 140%; margin-left: -20%;">  
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-6 offset-md-3">
                                <label style="margin-top: 10px;"> Data final</label>
                                <input type="date" class="form-control" id="dataFinal" value="aaaa-mm-dd" style="width: 140%; margin-left: -20%;"> 
                            </div>
                        </div>
                        <div class="d-flex justify-content-end">
                            <button type="button" class="btn btn-primary">Consultar</button>
                        </div>
                    </form>
                </div>
            </article>
        </section>
        
        
        <footer style="position: absolute; bottom: 0px;  width: 100%; background-color: rgb(220,220,220);" >
            <ul style="text-align: center;">
                <li style="display: inline-block; margin-left:170px; padding-top: 5px">©Copyright 2019 BNPF - All Rights Reserved</li>
                <li style="display: inline-block; float: right; padding: 5px 10px;"><a href="#">Termos de uso</a></li>
                <li style="display: inline-block; float: right; padding: 5px 10px;"><a href="#">Privacidade</a></li>
            </ul>
        </footer>
        
        
    </body>
</html>
