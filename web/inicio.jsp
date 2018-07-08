<%-- 
    Document   : index
    Created on : 06/06/2018, 10:19:39
    Author     : LAB
--%>

<%@page import="java.util.List"%>
<%@page import="br.com.crudPadaria2018.model.Venda"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!doctype html>
<html lang="pt-br">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">       
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <title>Sistema de Padaria</title>

        <!-- Bootstrap core CSS -->
        <link href="../../dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/style.css">

        <!-- Custom styles for this template -->
        <link href="dashboard.css" rel="stylesheet">
    </head>

    <body>

        <%@ include file="cabecalho.jsp"%>   
        <div class="container-fluid">
            <div class="row">           
                <%@ include file="sidebar.jsp"%>             
                <main role="main" class="col-md-12 ml-sm-auto col-lg-9 col-xl-10 pt-3 px-4">
                    <!-- Conteúdo -->
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
                        <h1 class="h2">Dados Gerais de Cadastros </h1>
                        <div class="botoes-topo btn-toolbar mb-2 mb-md-0">
                            <div class="btn-group mr-2">
                                <button class="btn btn-sm btn-outline-secondary">Compartilhar</button>
                                <button class="btn btn-sm btn-outline-secondary">Exportar</button>
                            </div>
                            <button class="btn btn-sm btn-outline-secondary dropdown-toggle">
                                <span data-feather="calendar"></span>
                                Esta semana
                            </button>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-xl-3 col-sm-6 py-2">
                            <div class="card bg-success text-white h-100">
                                <div class="card-body bg-success">
                                    <div class="rotate">
                                        <i class="fa fa-user fa-4x"></i>
                                    </div>
                                    <h6 class="text-uppercase">Usuários</h6>
                                    <h1 class="display-4">134</h1>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-sm-6 py-2">
                            <div class="card text-white bg-danger h-100">
                                <div class="card-body bg-danger">
                                    <div class="rotate">
                                        <i class="fa fa-users fa-4x"></i>
                                    </div>
                                    <h6 class="text-uppercase">Vendedores</h6>
                                    <h1 class="display-4">87</h1>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-sm-6 py-2">
                            <div class="card text-white bg-info h-100">
                                <div class="card-body bg-info">
                                    <div class="rotate">
                                        <i class="fa fa-users fa-4x"></i>
                                    </div>
                                    <h6 class="text-uppercase">Fornecedores</h6>
                                    <h1 class="display-4">125</h1>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-sm-6 py-2">
                            <div class="card text-white bg-warning h-100">
                                <div class="card-body">
                                    <div class="rotate">
                                        <i class="fa fa-handshake-o fa-4x"></i>
                                    </div>
                                    <h6 class="text-uppercase">Vendas</h6>
                                    <h1 class="display-4">36</h1>
                                </div>
                            </div>
                        </div>
                    </div>
                    <h2>Últimas vendas</h2>
                    <div class="table-responsive">
                        <table class="table table-striped table-sm">
                            <thead>
                                <tr>
                                    <th class="text-center">#</th>
                                    <th class="text-center">Vendedor</th>
                                    <th class="text-center">Usuário</th>
                                    <th class="text-center">Produto</th>
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