/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.PessoaFisica;
import persistence.DAOException;
import persistence.PessoaFisicaDAO;

/**
 *
 * @author lucca
 */
@WebServlet(name = "consulta2", urlPatterns = {"/consulta2"})
public class consulta2 extends HttpServlet {

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
            out.println("<title>Servlet consulta2</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet consulta2 at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        String nome = request.getParameter("nome");
        int anoInicial = Integer.parseInt(request.getParameter("anoInicial"));
        int anoFinal = Integer.parseInt(request.getParameter("anoFinal"));
        
        try {
            PessoaFisicaDAO pdao = new PessoaFisicaDAO();
            ArrayList<PessoaFisica> arrayPessoas = pdao.consultar(anoInicial, anoFinal, nome);
            
            request.setAttribute("ArrayPessoas", arrayPessoas);
            request.setAttribute("nome", nome);
            request.setAttribute("anoInicial", anoInicial);
            request.setAttribute("anoFinal", anoFinal);
            RequestDispatcher dispatcher = null;
            dispatcher = request.getRequestDispatcher("./tabelaConsultarPessoa.jsp");
            dispatcher.forward(request, response);
            
        } catch (DAOException | SQLException ex) {
            System.out.println(ex.getMessage());
        }
        
        
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
