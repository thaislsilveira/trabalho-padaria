<%-- 
    Document   : venda
    Created on : 15/06/2018, 10:25:35
    Author     : LAB
--%>

<%@page import="br.com.crudPadaria2018.model.Venda"%>
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
                                <h2>Vendas</h2>
                            </div>
                        </div>  
                        <div class="col col-xs-6 text-right">
                            <div class="input-group d-block mx-auto">
                                <a href="VendaCadastrar" class="btn btn-primary m-2"><i class=" fa fa-user-plus"></i> Adicionar</a>                                                
                            </div>                                               
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped table-sm">
                            <thead>
                                <tr>
                                    <th class="text-center">#</th>
                                    <th class="text-center">Vendedor</th>
                                    <th class="text-center">Usuário</th>
                                    <th class="text-center">Produto</th>                                  
                                    <th class="text-center">Ações</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    List<Venda> vendas = (List<Venda>) request.getAttribute("vendas");
                                    for (Venda venda : vendas) {
                                %>  
                                <tr>
                                    <td class="text-center"><%= venda.getIdVenda()%></td>                        
                                    <td class="text-center"><%= venda.getVendedor().getNomeVendedor()%></td>                  
                                    <td class="text-center"><%= venda.getUsuario().getNome()%></td>  
                                    <td class="text-center"><%= venda.getProduto().getNomeProduto()%></td>                                       
                                    <td class="text-center">
                                        <a class="btn btn-default"  href="CarregarVenda?idVenda=<%=venda.getIdVenda()%>"><em class="fa fa-pencil"></em></a>
                                        <a class="btn btn-danger" href="ExcluirVenda?idVenda=<%=venda.getIdVenda()%>"><em class="fa fa-trash"></em></a>
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
