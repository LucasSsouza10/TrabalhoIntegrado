<%-- 
    Document   : consultarEstados
    Created on : 19/04/2019, 13:31:00
    Author     : leona
--%>

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
        <section>
            <article>
                <div class="container" style="width: 400px; padding: 20px 0px;">
                    <h2>Horizontal form</h2>
                    <form id="signup" autocomplete="on" action="/action_page.php" style="text-align: center;">
                        <p class="row">
                            <label class="col-6" for="dataI" style="width: 100px;">Data inicial</label>
                            <input type="date" class="form-control" id="dataInicial" value="aaaa-mm-dd" style="width: 47%">
                        </p>
                        <p class="row">
                            <label class="col-6" for="dataF">Data final</label>
                            <input type="date" class="form-control" id="dataFinal" value="aaaa-mm-dd" style="width: 47%">
                        </p>
                       <button type="submit" class="btn btn-success">Consultar</button>

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
