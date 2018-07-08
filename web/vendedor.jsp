<%-- 
    Document   : vendedor
    Created on : 09/06/2018, 01:41:03
    Author     : Servidor
--%>

<%@page import="br.com.crudPadaria2018.model.Vendedor"%>
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
                                <h2>Vendedores</h2>
                            </div>
                        </div>  
                        <div class="col col-xs-6 text-right">
                            <div class="input-group d-block mx-auto">
                                <a href="vendedorCadastrar.jsp" class="btn btn-primary m-2"><i class=" fa fa-user-plus"></i> Adicionar</a>                                                
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
                                    List<Vendedor> vendedores = (List<Vendedor>) request.getAttribute("vendedores");
                                    for (Vendedor vendedor : vendedores) {
                                %> 
                                <tr>
                                    <td class="text-center"><%= vendedor.getIdVendedor()%></td>                    
                                    <td class="text-center"><%= vendedor.getNomeVendedor()%></td>                                                           
                                    <td class="text-center">
                                        <a class="btn btn-default" href="CarregarVendedor?idVendedor=<%=vendedor.getIdVendedor()%>"><em class="fa fa-pencil"></em></a>
                                        <a class="btn btn-danger"   href="ExcluirVendedor?idVendedor=<%=vendedor.getIdVendedor()%>"><em class="fa fa-trash"></em></a>
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
