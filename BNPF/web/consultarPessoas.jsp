<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BNPF - Base Nacional Pessoa Física</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    
    <script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
    <script>
        $(document).ready(function(){
            $( "#target" ).click(function() {
                $('#texto').hide();
                $('#card').hide();
                $('#tabela').show();
            });
        });
    </script>
    
  
    <body>
        <nav class="navbar navbar-dark bg-primary" style="padding: 0px;">
            <a class="navbar-brand" href="#">
                    <img src="./LogoBNPF.png" width="80" height="80" alt="" style="margin-left: 20px;">
            </a>
            <ul class="navbar-nav flex-row ml-md-auto d-none d-md-flex">
                <li class="nav-item" ><a class="nav-link p-2" href="#">Home</a></li>
                <li class="nav-item"><a class="btn btn-outline-light" href="consultarEstados.jsp" style="margin-right: 10px;">Consultar Estados</a>
                <li class="nav-item"><button type="button" class="btn btn-outline-light" style="margin-right: 20px;">Consultar Pessoas</button>
            </ul>
        </nav>
        
        <section>
            <div class="col-md-6 offset-md-3" id="texto">
                <h2><strong>Consultar Pessoas</strong></h2>
                <p>
                    Para fins de pesquisa dos cidadãos, essa consulta recupera os dados de diversas pessoas físicas (CPF, nome, data de nascimento e estado civil), e também número de dívidas e número de ações judiciais que essa pessoa possui em seu nome, dado um intervalo tempo em anos e um trecho do nome da pessoa.
                </p>
            </div>
            
            <article class="card-body" id="card">
                <div >
                    <h3>Realizar a consulta</h3> 
                    <p style="margin-bottom: 20px;">Informe o intervalo de tempo nos campos abaixo!</p>
                    <form id="signup" autocomplete="on" action="/action_page.php" ">
                        <p><label> Ano inicial: </label> <input class="form-control" type="number" name="quantity" min="1920" max="2019" value="1920" ></p>
                        <p><label style="margin-top: 10px;"> Ano final:</label> <input class="form-control" type="number" name="quantity" min="1920" max="2019" value="2019"></p>
                        <button id="target" type="button" class="btn btn-primary">Consultar</button>
                    </form>
                </div>
            </article>
            
            <div id="tabela" class="table-responsive">
                <table class="table">
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
