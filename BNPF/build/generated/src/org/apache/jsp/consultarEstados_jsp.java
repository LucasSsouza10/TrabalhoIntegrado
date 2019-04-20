package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class consultarEstados_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>BNPF - Consultar</title>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"styleConsultarEstados.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\">\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>\n");
      out.write("        <script src=\"http://code.jquery.com/jquery-2.1.3.min.js\"></script>\n");
      out.write("        <script>\n");
      out.write("            $(document).ready(function() {\n");
      out.write("             \n");
      out.write("                var dataF = document.getElementById('dataFinal'),\n");
      out.write("                    dataI = document.getElementById('dataInicial'),\n");
      out.write("                    err_message = document.getElementById('err-message');\n");
      out.write("\n");
      out.write("                $(dataF).focusout(function() {\n");
      out.write("                    if($(dataF).val() < $(dataI).val()){\n");
      out.write("                        $(err_message).fadeIn('slow', function(){\n");
      out.write("                            $(this).html('Data Inicial é maior que a data final, coloque um intervalo válido!');\n");
      out.write("                        });\n");
      out.write("                    }\n");
      out.write("                    else{\n");
      out.write("                        $(err_message).fadeIn('slow', function(){\n");
      out.write("                            $(this).html('');\n");
      out.write("                        });\n");
      out.write("                    }\n");
      out.write("                });\n");
      out.write("\n");
      out.write("                $(dataI).focusout(function() {\n");
      out.write("                    if($(dataF).val() < $(dataI).val()){\n");
      out.write("                        $(err_message).fadeIn('slow', function(){\n");
      out.write("                            $(this).html('Data Inicial é maior que a data final, coloque um intervalo válido!');\n");
      out.write("                        });\n");
      out.write("                    }\n");
      out.write("                    else{\n");
      out.write("                        $(err_message).fadeIn('slow', function(){\n");
      out.write("                            $(this).html('');\n");
      out.write("                        });\n");
      out.write("                    }\n");
      out.write("                });\n");
      out.write("                \n");
      out.write("                $('form').submit(function(){\n");
      out.write("                    if($(dataF).val() < $(dataI).val()){\n");
      out.write("                        return;\n");
      out.write("                    }\n");
      out.write("                    else{\n");
      out.write("                        $.ajax({\n");
      out.write("                            \n");
      out.write("                            type: \"GET\", \n");
      out.write("                            url: \"consulta1\", \n");
      out.write("                            dataType: \"html\", \n");
      out.write("                            data: { dI: $('#dataInicial').val(), dF: $('#dataFinal').val() },\n");
      out.write("                            success: function(data, textStatus, jqXHR) {\n");
      out.write("                              $('#secao').html(data);\n");
      out.write("                            }\n");
      out.write("                        });  \n");
      out.write("                    }\n");
      out.write("                });\n");
      out.write("                \n");
      out.write("            });\n");
      out.write("            \n");
      out.write("            function validateForm() {\n");
      out.write("                var dataF = document.getElementById('dataFinal'),\n");
      out.write("                    dataI = document.getElementById('dataInicial'),\n");
      out.write("                    err_message = document.getElementById('err-message');\n");
      out.write("                if($(dataF).val() < $(dataI).val()){\n");
      out.write("                    $(err_message).fadeIn('slow', function(){\n");
      out.write("                        $(this).html('Data Inicial é maior que a data final, coloque um intervalo válido!');\n");
      out.write("                    });\n");
      out.write("                    alert('Coloque um intervalo de tempo válido!');\n");
      out.write("                    return false;\n");
      out.write("                }\n");
      out.write("                \n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <nav class=\"navbar navbar-dark bg-primary\" style=\"padding: 0px;\">\n");
      out.write("                <a class=\"navbar-brand\" href=\"#\">\n");
      out.write("                        <img src=\"./LogoBNPF.png\" width=\"80\" height=\"80\" alt=\"\" style=\"margin-left: 20px;\">\n");
      out.write("                </a>\n");
      out.write("                <ul class=\"navbar-nav flex-row ml-md-auto d-none d-md-flex\">\n");
      out.write("                        <li class=\"nav-item\" ><a class=\"nav-link p-2\" href=\"index.jsp\">Home</a></li>\n");
      out.write("                        <li class=\"nav-item\"><button type=\"button\" class=\"btn btn-outline-light active\" href=\"#\" style=\"margin-right: 10px;\">Consultar Estados</button>\n");
      out.write("                        <li class=\"nav-item\"><button type=\"button\" class=\"btn btn-outline-light\" style=\"margin-right: 20px;\">Consultar Pessoas</button>\n");
      out.write("                  </ul>\n");
      out.write("        </nav>\n");
      out.write("        \n");
      out.write("        <section style=\"margin-top: 10px;\" id=\"secao\">\n");
      out.write("            <div class=\"col-md-6 offset-md-3\">\n");
      out.write("                <h2><strong>Consultar Estados</strong></h2>\n");
      out.write("                <p>Esta consulta foi criada com o foco estatístico. Para realizar a consulta, deve-se fornecer um determinado intervalo de tempo e o sistema irá buscar por todas as dividas e ações judiciais que ocorreram neste período. Por fim, o resultado da consulta tráz diversos dados quantitativos para cada UF como: a soma do valor das dívidas, número de devedores, número de dívidas, soma dos valores em ações judiciais e também o número de ações judiciais\n");
      out.write("                </p>\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            <article style=\"width: 500px; margin-top: -10px;\">\n");
      out.write("                <div class=\"container\" style=\"width: 400px; margin-top: -10px\">\n");
      out.write("                    <h3 style=\"margin-bottom: 0px;\">Realizar a consulta</h3> \n");
      out.write("                    <p style=\"margin-bottom: 5px; margin-top: -5px;\">Informe o intervalo de tempo nos campos abaixo!</p>\n");
      out.write("                    <form id=\"consultaInicial\" autocomplete=\"on\" onsubmit=\"return validateForm()\">\n");
      out.write("                    \n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <div class=\"col-md-6 offset-md-3\">\n");
      out.write("                                <label style=\"margin-left: 20%;\"> Data inicial</label>\n");
      out.write("                                <input type=\"date\" class=\"form-control\" id=\"dataInicial\" value=\"1938-01-01\" style=\"width: 140%; margin-left: -20%;\">  \n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <div class=\"col-md-6 offset-md-3\">\n");
      out.write("                                <label style=\"margin-top: 5px; margin-left: 20%;\"> Data final</label>\n");
      out.write("                                <input type=\"date\" class=\"form-control\" id=\"dataFinal\" value=\"2019-01-01\" style=\"width: 140%; margin-left: -20%;\"> \n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <p style=\"text-align: center;\">\n");
      out.write("                           \n");
      out.write("                            <span class=\"right\" id=\"err-message\" style=\"color: darkred;\"></span>\n");
      out.write("                        </p>\n");
      out.write("                        <p style=\"text-align: center;\"><input type=\"submit\" class=\"btn btn-primary\" value=\"Consultar\"></p>\n");
      out.write("                        \n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("            </article>\n");
      out.write("        </section>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        <footer style=\"position: absolute; bottom: 0px;  width: 100%; background-color: rgb(220,220,220);\" >\n");
      out.write("            <ul style=\"text-align: center;\">\n");
      out.write("                <li style=\"display: inline-block; margin-left:170px; padding-top: 5px\">©Copyright 2019 BNPF - All Rights Reserved</li>\n");
      out.write("                <li style=\"display: inline-block; float: right; padding: 5px 10px;\"><a href=\"#\">Termos de uso</a></li>\n");
      out.write("                <li style=\"display: inline-block; float: right; padding: 5px 10px;\"><a href=\"#\">Privacidade</a></li>\n");
      out.write("            </ul>\n");
      out.write("        </footer>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
