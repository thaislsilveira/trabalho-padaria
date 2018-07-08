<%-- 
    Document   : vendaAlterar
    Created on : 15/06/2018, 11:26:47
    Author     : LAB
--%>

<%@page import="br.com.crudPadaria2018.model.Produto"%>
<%@page import="br.com.crudPadaria2018.model.Usuario"%>
<%@page import="br.com.crudPadaria2018.model.Venda"%>
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
                            <h3>Alterações das Vendas</h3>
                            <hr>
                            <p class="p-geral">
                                As alterações das Vendas só são recomendáveis com a 
                                autorização do responsável pela companhia. Para que assim, 
                                não ocorra erros equivocados que podem afetar o o negócio.
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
                                    <form  name="alterarvenda" action="AlterarVenda" 
                                           method="POST">
                                        <div class="form-group">
                                            <div class="form-line">
                                                <input type="text" name="idvenda" id="idvenda" class="form-control" value="${venda.idVenda}" readonly="readonly"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-line">
                                                <select name="idvendedor" class="custom-select">
                                                    <%
                                                        List<Vendedor> vendedores = (List<Vendedor>) request.getAttribute("vendedores");
                                                        for (Vendedor vendedor : vendedores) {
                                                    %>               
                                                    <option value="<%= vendedor.getIdVendedor()%>" <%= (((Venda) request.getAttribute("venda")).getVendedor().getIdVendedor()) == vendedor.getIdVendedor() ? "selected" : ""%>><%= vendedor.getNomeVendedor()%></option>                    
                                                    <% }%>
                                                </select>  
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-line">
                                                <select name="idusuario" class="custom-select">
                                                    <%
                                                        List<Usuario> usuarios = (List<Usuario>) request.getAttribute("usuarios");
                                                        for (Usuario usuario : usuarios) {
                                                    %>               
                                                    <option value="<%= usuario.getIdUsuario()%>" <%= (((Venda) request.getAttribute("venda")).getUsuario().getIdUsuario()) == usuario.getIdUsuario() ? "selected" : ""%>><%= usuario.getNome()%></option>                    
                                                    <% }%>
                                                </select>  
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-line">
                                                <select name="idproduto" class="custom-select">
                                                    <%
                                                        List<Produto> produtos = (List<Produto>) request.getAttribute("produtos");
                                                        for (Produto produto : produtos) {
                                                    %>               
                                                    <option value="<%= produto.getIdProduto()%>" <%= (((Venda) request.getAttribute("venda")).getProduto().getIdProduto()) == produto.getIdProduto() ? "selected" : ""%>><%= produto.getNomeProduto()%></option>                    
                                                    <% }%>
                                                </select> 
                                            </div>
                                        </div>
                                        <div class="form-group">                                          
                                            <input type="submit" class="btn btn-primary"
                                                   name="Alterar" id="alterar" value="Alterar" />
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
