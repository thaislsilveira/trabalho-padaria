/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.crudPadaria2018.controller;

import br.com.crudPadaria2018.dao.GenericDAO;
import br.com.crudPadaria2018.dao.ProdutoDAO;
import br.com.crudPadaria2018.dao.UsuarioDAO;
import br.com.crudPadaria2018.dao.VendaDAO;
import br.com.crudPadaria2018.dao.VendedorDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author LAB
 */
@WebServlet(name = "CarregarVenda", urlPatterns = {"/CarregarVenda"})
public class CarregarVenda extends HttpServlet {

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
       int idVenda = Integer.parseInt(request.getParameter("idVenda"));
       try{
            GenericDAO dao = new VendaDAO();
            GenericDAO oVendedorDAO = new VendedorDAO();
            GenericDAO oProdutoDAO = new ProdutoDAO();
            GenericDAO oUsuarioDAO = new UsuarioDAO();
            
           request.setAttribute("vendedores", oVendedorDAO.Listar());           
           request.setAttribute("usuarios", oUsuarioDAO.Listar());
           request.setAttribute("produtos", oProdutoDAO.Listar());
           request.setAttribute("venda", dao.carregar(idVenda));
           
           request.getRequestDispatcher("vendaAlterar.jsp").forward(request, response);
       }catch(Exception ex){
           System.out.println("Problemas ao carregar dados da Venda! Erro : " + ex.getMessage());
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
