<%-- 
    Document   : vendaCadastrar
    Created on : 15/06/2018, 10:18:25
    Author     : LAB
--%>

<%@page import="br.com.crudPadaria2018.model.Produto"%>
<%@page import="br.com.crudPadaria2018.model.Usuario"%>
<%@page import="br.com.crudPadaria2018.model.Vendedor"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastros Fatec</title>
    </head>
    <body>
        <%@ include file="cabecalho.jsp"%>   
        <div class="container-fluid">
            <div class="row">           
                <%@ include file="sidebar.jsp"%>             
                <main role="main" class="col-md-12 ml-sm-auto col-lg-9 col-xl-10 pt-3 px-4">
                    <!-- Conteúdo -->
                    <div class="row">
                        <div class="col-md-5">
                            <h3>Cadastro de Vendas</h3>
                            <hr>
                            <p class="p-geral">
                               O cadastros das vendas será realizado com o nome do vendedor, 
                               do cliente e o produto que o cliente deseja comprar. 
                               Essa informação é muito importante para que haja uma contabilidade do que existe no estoque
                               e o que foi vendido.
                            </p>
                        </div>
                        <div class="col-md-7">
                            <div class="card">
                                <div class="card-body b-b">
                                    <div class="row">
                                        <div class="col col-xs-6">
                                            <h4>Formulário</h4>
                                        </div>                                        
                                    </div>
                                    <form  name="cadastrarvenda" action="CadastrarVenda" 
                                           method="POST">
                                        <div class="form-group">
                                            <div class="form-line">
                                                <select name="idVendedor" class="custom-select">
                                                    <%
                                                        List<Vendedor> vendedores = (List<Vendedor>) request.getAttribute("vendedores");
                                                        for (Vendedor vendedor : vendedores) {
                                                    %>               
                                                    <option value="<%= vendedor.getIdVendedor()%>"><%= vendedor.getNomeVendedor()%></option>                    
                                                    <% }%>
                                                </select>   
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-line">
                                                <select name="idUsuario" class="custom-select">
                                                    <%
                                                        List<Usuario> usuarios = (List<Usuario>) request.getAttribute("usuarios");
                                                        for (Usuario usuario : usuarios) {
                                                    %>               
                                                    <option value="<%= usuario.getIdUsuario()%>"><%= usuario.getNome()%></option>                    
                                                    <% }%>
                                                </select>  
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-line">
                                                <select name="idProduto" class="custom-select">
                                                    <%
                                                        List<Produto> produtos = (List<Produto>) request.getAttribute("produtos");
                                                        for (Produto produto : produtos) {
                                                    %>               
                                                    <option value="<%= produto.getIdProduto()%>"><%= produto.getNomeProduto()%></option>                    
                                                    <% }%>
                                                </select>  
                                            </div>
                                        </div>
                                        <div class="form-group">                                          
                                            <input type="submit" class="btn btn-primary" name="cadastrar" 
                                                   id="cadastrar" value="Cadastrar" />
                                            <input type="reset" class="btn btn-secondary" name="limpar" 
                                                   id="limpar" value="Limpar" />                                           
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Fim do conteúdo -->
                </main>
            </div>
        </div>
        <%@ include file="rodape.jsp" %>
    </body>
</html>
