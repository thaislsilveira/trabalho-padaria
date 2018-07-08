<%-- 
    Document   : produtoCadastrar
    Created on : 10/06/2018, 16:52:57
    Author     : Servidor
--%>

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
                            <h3>Cadastro dos Produtos</h3>
                            <hr>
                            <p class="p-geral">
                               O cadastro dos Produtos será realizado com a descrição
                               do nome do produto e sua quantidade deve ser especificada por exemplo: (kg, l , g ).
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
                                    <form  name="cadastrarproduto" action="CadastrarProduto" 
                                           method="POST">
                                        <div class="form-group">
                                            <div class="form-line">
                                                <input type="text" name="nomeProduto" id="nomeProduto" class="form-control" placeholder="Nome do Produto">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-line">
                                                <input type="text" name="quantidade" id="quantidade" class="form-control" placeholder="Quantidade">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-line">
                                                <input type="text" name="preco_uni" id="preco_uni"  class="form-control" placeholder="Preço Unitário">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-line">
                                                <select name="idFornecedor" class="custom-select">
                                                    <%
                                                        List<Fornecedor> fornecedores = (List<Fornecedor>) request.getAttribute("fornecedores");
                                                        for (Fornecedor fornecedor : fornecedores) {
                                                    %>               
                                                    <option value="<%= fornecedor.getIdFornecedor()%>"><%= fornecedor.getNomeFornecedor()%></option>                    
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
