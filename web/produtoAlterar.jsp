<%-- 
    Document   : produtoAlterar
    Created on : 13/06/2018, 08:31:17
    Author     : LAB
--%>

<%@page import="br.com.crudPadaria2018.model.Produto"%>
<%@page import="br.com.crudPadaria2018.dao.FornecedorDAO"%>
<%@page import="br.com.crudPadaria2018.model.Fornecedor"%>
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
                            <h3>Alterações dos Produtos</h3>
                            <hr>
                            <p class="p-geral">
                                Alteração realizadas nos produtos devem ser cautelosas,
                                pois uma modificação brusca poderá afetar diretamente a
                                rotina de vendas do sistema.
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
                                    <form  name="alterarproduto" action="AlterarProduto" 
                                           method="POST">
                                        <div class="form-group">
                                            <div class="form-line">
                                                <input type="text" name="idproduto" id="idproduto" class="form-control" value="${produto.idProduto}" readonly="readonly"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-line">
                                                <input type="text" name="nomeproduto" id="nomeproduto" class="form-control" value="${produto.nomeProduto}" size="50" maxlength="50"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-line">
                                                <input type="text" name="quantidade" id="quantidade" class="form-control" value="${produto.quantidade}" size="10"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-line">
                                                <input type="text" name="preco_uni" id="preco_uni"  class="form-control" value="${produto.preco_uni}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-line">
                                                <select name="idfornecedor" class="custom-select">
                                                    <%
                                                        List<Fornecedor> fornecedores = (List<Fornecedor>) request.getAttribute("fornecedores");
                                                        for (Fornecedor fornecedor : fornecedores) {
                                                    %>               
                                                    <option value="<%= fornecedor.getIdFornecedor()%>" <%= (((Produto) request.getAttribute("produto")).getFornecedor().getIdFornecedor()) == fornecedor.getIdFornecedor() ? "selected" : ""%>><%= fornecedor.getNomeFornecedor()%></option>                    
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
