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
            String ufs[] = {"AC", "AL", "AP", "AM", "BA", "CE", "DF", "ES", "GO", "MA", "MT", "MS", "MG", "PA", "PB", "PR", "PE", "PI", "RJ", "RN", "RS", "RO", "RR","SC", "SP", "SE", "TO"};
            Integer qnt1 = 11, qnt2 = 21, qnt3 = 543, valor1 = 5000, valor2 = 91543;
            for(Integer i = 0; i < 27; i++){
                resultado += "<tr><td>" + ufs[i] + "</td><td>" + valor1.toString() + "</td><td>" + qnt1.toString() + "</td><td>" + qnt2.toString() + "</td><td>" + valor2.toString() + "</td><td>" + qnt3.toString() + "</td></tr>";
                qnt1 += 7;
                qnt2 += 9;
                qnt3 -= 11;
                valor1 += 751;
                valor2 -= 1734;
            
            }
        }
        else if(op.equals("2")){
            resultado += "<tr><td>40510036808</td><td>Leonardo Seiji Nozaki</td><td>02/02/1998</td><td>Solteiro</td><td>2</td><td>2</td></tr>";
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
