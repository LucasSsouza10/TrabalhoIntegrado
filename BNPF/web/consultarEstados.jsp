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
    </head>
    <body>
        <section>
            <article>
              <h1>Sign Up</h1>
              <form id="signup" autocomplete="on">
                <p class="row"> <!-- Username field -->
                    <label for="username">Username</label>
                    <input class="right" type="text" id="username">
                </p>
              </form>
        </article>
      </section>
        <section>
            <article>
                <h3>Informações para a consulta</h3>
                <form id="consulta1" autocomplete="on">
                    <p class="row"> <!-- Username field -->
                        <label for="username">Username</label>
                        <input class="right" type="text" id="username">
                    </p>
                    <p class="row"> <!-- Date of Birth field -->
                        <label for="dob">Data inicial</label>
                        <input class="right" type="date" value="1930-01-01" id="dataInicial">
                    </p>
                    <p class="row"> <!-- Date of Birth field -->
                        <label for="dob">Data final</label>
                        <input class="" type="date" value="2010-12-31" id="dataFinal">
                    </p>



                  <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </article>
        </section>
        
        
    </body>
</html>
