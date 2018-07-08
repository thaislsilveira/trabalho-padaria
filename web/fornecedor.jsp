<%-- 
    Document   : fornecedor
    Created on : 08/06/2018, 23:57:32
    Author     : Servidor
--%>

<%@page import="br.com.crudPadaria2018.model.Fornecedor"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastros</title>
    </head>
    <body>
        <%@ include file="cabecalho.jsp" %>
        <div class="container-fluid">
            <div class="row">  
                <%@ include file="sidebar.jsp" %>
                <main role="main" class="col-md-12 ml-sm-auto col-lg-9 col-xl-10 pt-3 px-4">
                    <!-- Conteúdo -->
                    <div class="row">
                        <div class="col col-xs-6">
                            <div class="input-group d-block mx-auto  m-2">
                                <h2>Fornecedores</h2>
                            </div>
                        </div>  
                        <div class="col col-xs-6 text-right">
                            <div class="input-group d-block mx-auto">
                                <a href="fornecedorCadastrar.jsp" class="btn btn-primary m-2"><i class=" fa fa-user-plus"></i> Adicionar</a>                                                
                            </div>                                               
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped table-sm">
                            <thead>
                                <tr>
                                    <th class="text-center">#</th>
                                    <th class="text-center">Nome</th>
                                    <th class="text-center">Ações</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    List<Fornecedor> fornecedores = (List<Fornecedor>) request.getAttribute("fornecedores");
                                    for (Fornecedor fornecedor : fornecedores) {
                                %>  
                                <tr>
                                    <td class="text-center"><%= fornecedor.getIdFornecedor()%></td>                    
                                    <td class="text-center"><%= fornecedor.getNomeFornecedor()%></td>                    

                                    <td class="text-center">
                                        <a class="btn btn-default"  href="CarregarFornecedor?idFornecedor=<%=fornecedor.getIdFornecedor()%>"><em class="fa fa-pencil"></em></a>
                                        <a class="btn btn-danger" href="ExcluirFornecedor?idFornecedor=<%=fornecedor.getIdFornecedor()%>"><em class="fa fa-trash"></em></a>
                                    </td>                                             
                                </tr>                
                                <% }%>                                 
                            </tbody>
                        </table>
                    </div>                   
                    <!-- Fim do conteúdo -->
                </main>
                <%@ include file="rodape.jsp" %>
            </div>
        </div>       
    </body>
</html>
