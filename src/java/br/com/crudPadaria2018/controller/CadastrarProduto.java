/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.crudPadaria2018.controller;

import br.com.crudPadaria2018.dao.GenericDAO;
import br.com.crudPadaria2018.dao.ProdutoDAO;
import br.com.crudPadaria2018.model.Produto;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Servidor
 */
@WebServlet(name = "CadastrarProduto", urlPatterns = {"/CadastrarProduto"})
public class CadastrarProduto extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        String nomeProduto = request.getParameter("nomeProduto");
        String quantidade = request.getParameter("quantidade");
        int preco_Uni = Integer.parseInt(request.getParameter("preco_uni"));
        int idFornecedor = Integer.parseInt(request.getParameter("idFornecedor"));
        String mensagem = null;
        
        Produto oProduto = new Produto();
        oProduto.setNomeProduto(nomeProduto);
        oProduto.setQuantidade(quantidade);
        oProduto.setPreco_uni(preco_Uni);
        oProduto.getFornecedor().setIdFornecedor(idFornecedor);
        
        try
        {
            GenericDAO dao = new ProdutoDAO();
            if(dao.cadastrar(oProduto)){
                mensagem = "Produto cadastrado com sucesso!";
            }else{
                mensagem = "Problemas ao cadastrar Produto. Verifique os dados informados e tente"
                        + " novamente! ";
            }
            request.setAttribute("mensagem", mensagem);
            request.getRequestDispatcher("ListarProduto").forward(request, response);
        } catch (Exception ex){
            System.out.println("Problemas no Servlet ao cadastrar Produto! Erro: " + ex.getMessage());
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
