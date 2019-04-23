/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author leona
 */
public class consulta1 extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet consulta1</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet consulta1 at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op = request.getParameter("op");
        String dataI = request.getParameter("dI");     
        String dataF = request.getParameter("dF");  
        String resultado = "";
        if(op.equals("1")){
            resultado += "<article style=\"width: 50%\">" +
                         "<div class=\"container\" style=\" margin-top: -10px\">" +
                         "<h3 style=\"margin-bottom: 0px;\">Realizar a consulta de Estados</h3>" + 
                         "<p style=\"margin-bottom: 10px; margin-top: -5px;\">Informe o intervalo de tempo nos campos abaixo!</p>" +
                         "<form class=\"form-inline\" id=\"consultaInicial\" autocomplete=\"on\">" +
                                "<label class=\"mr-sm-2\"> Data inicial</label>" +
                                "<input type=\"date\" class=\"form-control mb-2 mr-sm-2\" id=\"dataInicial1\" value=\"" + dataI +"\">" + 
                                "<label class=\"mr-sm-2\" style=\"margin-left: 10px;\"> Data final</label>" +
                                "<input type=\"date\" class=\"form-control mb-2 mr-sm-2\" id=\"dataFinal1\" value=\"" + dataF + "\">" + 
                                "<input type=\"button\" id=\"consultar1\" class=\"btn btn-primary mb-2\" value=\"Consultar\" style=\"margin-left: 10px;\">" +
                        "</form>" +
                        "<p style=\"text-align: left; margin-bottom: 0px;\">" +
                            "<span class=\"right\" id=\"err-message1\" style=\"color: darkred;\"></span>" +
                        "</p>" +
                    "</div>" +
                "</article>" +
                "<div class=\"row\" style=\"width: 85%; margin-top: 30px; \" id=\"resul\">";
        }
        if(op.equals("2")){
            resultado += "<div class=\"row\" style=\"width: 100%; margin-left: 0%; \" id=\"resul\">";
        }
        if(op.equals("1") || op.equals("2")){
            resultado += 
                "<div class=\"col-md-2 rounded\" style=\"margin-left: 5%; margin-right: 5%; border:solid 1px #999; height: 400px;\">.col-md-3 .col-md-offset-3</div>" +
                "<div class=\"col-md-8\" style=\"padding: 0%; margin-left: 1%;\">" +
                    "<table class=\"table table-striped\" style=\"border: solid 1px #999;\">" +
                      "<thead class=\"thead-dark table table-striped\">" +
                        "<tr>" + 
                          "<th>Unidade Federativa</th>" + 
                          "<th>Valor das dívidas</th>" +
                          "<th>Quantidade de devedores</th>" +
                          "<th>Quantidade de dívidas</th>" +
                          "<th>Valor das ações judiciais</th>" +
                          "<th>Quantidade de ações judiciais</th>" +
                        "</tr>" +
                      "</thead>" +
                      "<tbody>";
                      String con = "";
                for(int i = 0; i< 27; i++){
                    con += "<tr><td>AC</td><td>" + i + "</td><td>" + dataF + "</td><td>2</td><td>2</td><td>2</td></tr>";
                }
                        
                resultado += con +
                      "</tbody>" +
                    "</table>" +
                  "</div>" +
                "</div>";
        }
        else if(op.equals("3")){
            resultado += "<tr><td>40510036805</td><td>Leonardo Seiji Nozaki</td><td>02/02/1998</td><td>Solteiro</td><td>2</td><td>2</td></tr>";
        }
        response.setCharacterEncoding("UTF-8"); 
        PrintWriter writer = response.getWriter();
        writer.print(resultado);
        writer.close();
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
