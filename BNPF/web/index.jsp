<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>BNPF - Base Nacional Pessoa Física</title>
            <link rel="stylesheet" type="text/css" href="style.css">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
        
    <script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
    <script>
        $(document).ready(function() {
            //Funcao para trocar de tela quando clica no botao id=consultaP1
            $("#consultaP1" ).click(function() {
                window.location.href = "consultarPessoas.jsp"
            });
            
            //Funcao para trocar de tela quando clica no botao id=consultaP2
            $("#consultaP2" ).click(function() {
                window.location.href = "consultarPessoas.jsp"
            });
            
            //Funcao para trocar de tela quando clica no botao id=consultaE1
            $("#consultaE1" ).click(function() {
                window.location.href = "consultarEstados.jsp"
            });
            
            //Funcao para trocar de tela quando clica no botao id=consultaE2
            $("#consultaE2" ).click(function() {
                window.location.href = "consultarEstados.jsp"
            });
        });
    </script>
    
    <body style=" position: relative;">
        <nav class="navbar navbar-dark bg-primary" style="padding: 0px;">
            <a class="navbar-brand" href="#">
                    <img src="./LogoBNPF.png" width="80" height="80" alt="" style="margin-left: 20px;">
            </a>
            <ul class="navbar-nav flex-row ml-md-auto d-none d-md-flex">
                <li class="nav-item" ><a class="nav-link p-2" href="#" style="color: white; margin-right: 10px;">Home</a></li>
                <li class="nav-item"><button type="button" id="consultaE1" class="btn btn-outline-light" style="margin-right: 20px;">Consultar Estados</button>
                <li class="nav-item"><button type="button" id="consultaP1" class="btn btn-outline-light" style="margin-right: 20px;">Consultar Pessoas</button>
            </ul>
        </nav>
	<br>		  
	
	<div class="container">
		 <div id="" class="col-12 col-xl-12 col-lg-12 col-md-12">

			<section style="padding-bottom: 70px;">
				<h2><strong>Base Nacional de Pessoas Físicas</strong></h2>
				<p>A BNPF é uma base de dados brasileira que possui a capacidade de armazenar e gerenciar uma grande quantidade de dados de forma eficiente. Nesta base de dados são armazenadas informações de pessoas físicas, de dívidas que possuem e de ações judiciais nas quais estão envolvidas. Você pode consultar informações de uma Unidade Federativa (UF) ou informações sobre uma pessoa física.
				</p>
				<br>

			<div class="row">
				<div id="" class="col-6 col-xl-6 col-lg-6 col-md-6">
					<div class="card h-100" style="border-color:green">
						<div class="card-body" style="background-color: #ecf9ec">
							<center><img src="brasil1.png" style="height: 300px"></center>
							<br>
							<h3>Consultar Estados</h3>
							<p>Para consultar informações sobre dívidas e ações judiciais dos Estados, você deve especificar um período de tempo referente à data em que elas ocorreram. </p>
							<div class="d-flex justify-content-end">
								<button type="button" id="consultaE2" class="btn btn-primary">Consultar</button>
							</div>
						</div>
					</div>
				</div>

				<div id="" class="col-6 col-xl-6 col-lg-6 col-md-6">
					<div class="card h-100" style="border-color: #cc3399">
						<div class="card-body" style="background-color: #faebf5">
							<center><img src="pessoas.png" style="height: 300px"></center>
							<br>
							<h3>Consultar Pessoas</h3>
							<p>Para consultar informações pessoais e sobre dívidas e ações judiciais de pessoas, você deve especificar um trecho de nome e intervalo de ano de nascimento da pessoa. </p>
							<div class="d-flex justify-content-end">
								<button type="button" id="consultaP2" class="btn btn-primary">Consultar</button>
							</div>
						</div>
					</div>
				</div>
			</div>

			  </section>
			</div>
	  </div>
		
	<br>
        
	  
        <footer>
            <ul style="text-align: center;">
                <li style="display: inline-block; margin-left:170px; padding-top: 5px">©Copyright 2019 BNPF - All Rights Reserved</li>
                <li style="display: inline-block; float: right; padding: 5px 10px;"><a href="#">Termos de uso</a></li>
                <li style="display: inline-block; float: right; padding: 5px 10px;"><a href="#">Privacidade</a></li>
            </ul>
        </footer>
    </body>
</html>
