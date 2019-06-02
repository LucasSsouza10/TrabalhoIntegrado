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
        $(document).ready(function() {
            var anoF = document.getElementById('anoFinal'),
                    anoI = document.getElementById('anoInicial'),
                    err_message = document.getElementById('err-message'),
                    err_message1 = document.getElementById('err-message1'),
                    err_message2 = document.getElementById('err-message2'),
                    nome = document.getElementById('nome');
            //Funcao para trocar de tela quando clica no botao id=consultaP1
            $("#consultaP1" ).click(function() {
                window.location.href = "consultarPessoas.jsp";
            });
            
            //Funcao para trocar de tela quando clica no botao id=consultaE1
            $("#consultaE1" ).click(function() {
                window.location.href = "consultarEstados.jsp";
            });
            
            
            //Configurar formato da tabela que contem os resultados
            $('#tabela').DataTable({
                "pagingType": "simple_numbers",
                "searching": false,
                "bLengthChange" : false,
                "order": [[ 1, "asc" ]],
                "columns": [
                    { "orderable": false },
                    null,
                    { "orderable": false },
                    { "orderable": false }, 
                    null,
                    null
                 ]
            });
            $('.dataTables_length').addClass('bs-select');
            
            $( "#consultar" ).click(function() {
                var letter_only = /^[A-Za-záàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]/;
                var element = $(nome);
                
                if(($(anoFinal).val() > $(anoInicial).val()) && ($(nome).val().length >= 3) && (letter_only.test(element.val()))){
                    document.getElementById("form").submit();
                }
                else{
                    swal({
                        title:"Problema encontrado",
                        text: "Há algum erro no preenchimento dos dados, você deve corrigir isso para poder realizar a consulta",
                        icon: "error",
                        button: "Entendido",
                    })
                }
            });
            
            
        });
    </script>
    
    <body style=" position: relative;">
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
       
        <section class="row justify-content-center">
            <article class="form-container">
               <h3 id="titulo1">Realizar a consulta</h3> 
               <p id="texto1">Informe o intervalo de tempo nos campos abaixo!</p>
               <form id="form" class="form-inline" method="POST" action="consulta2">
                   <div class="form form-group">
                       <label for="usr">Nome:</label>
                       <input name="nome" id="nome" type="text" class="form-control" id="usr" placeholder="Nome">
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
       </section>
        
        
        <section id="section1" class="row justify-content-center container-fluid" style="padding-bottom: 80px; ">
            <div class="filtros col-3">
                    <h4 style="margin-bottom: 0px">Filtros dos valores</h4>
                    <label style="margin: 5px 0px 0px 0px">Quantidade de dívidas:</label>
                    <div class="row justify-content-center">
                        <label>De:</label>
                        <input type="number" class="col-4 form-control" placeholder="5" id="anoFinal" name="quantity" min="0">
                        <label>Até:</label>
                        <input type="number" class="col-4 form-control" placeholder="2000" id="anoFinal" name="quantity" min="0">
                    </div>
                    
                    <br>
                        <label style="margin: 5px 0px 0px 0px">Quantidade de ações judiciais:</label>
                    <div class="row justify-content-center">
                        <label>De:</label>
                        <input type="number" class="col-4 form-control" placeholder="8" id="anoFinal" name="quantity" min="0">
                        <label>Até:</label>
                        <input type="number" class="col-4 form-control" placeholder="500" id="anoFinal" name="quantity" min="0">
                    </div>
                        
                    <br>
                    <p id="pBotao1" style="text-align: center;"><button id="filtrar" type="button" class="btn btn-primary" onclick="filtrarValores()">Filtrar</button></p>
            </div>
            
            <div class="table-responsive col-8">
                <p style="margin-bottom: 5px;">Resultados da consulta na tabela a seguir, observação: Quant. significa Quantidade</p>
                <table id="tabela" class="table table-striped table-bordered table-sm" style="border: solid 1px #999;">
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
                        <tr>
                            <td><%= arrayPessoas.get(i).getCpf() %></td>
                            <td><%= arrayPessoas.get(i).getNome() %></td>
                            <td><%= s.format(arrayPessoas.get(i).getDtNascimento().getTime()) %></td>
                            <td><%= arrayPessoas.get(i).getEstadoCivil() %></td>
                            <td><%= arrayPessoas.get(i).getQuantDividas() %></td>
                            <td><%= arrayPessoas.get(i).getQuantAcoes() %></td>
                        </tr>
                        
                        <% } %>
                    </tbody>
                </table>
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
