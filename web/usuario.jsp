<%-- 
    Document   : usuario
    Created on : 07/06/2018, 08:25:18
    Author     : LAB
--%>

<%@page import="br.com.crudPadaria2018.model.Usuario"%>
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
                            <h2>Usuários</h2>
                            </div>
                        </div>  
                        <div class="col col-xs-6 text-right">
                            <div class="input-group d-block mx-auto">
                                <a href="usuarioCadastrar.jsp" class="btn btn-primary m-2"><i class=" fa fa-user-plus"></i> Adicionar</a>                                                
                            </div>                                               
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped table-sm">
                            <thead>
                                <tr>
                                    <th class="text-center">#</th>
                                    <th class="text-center">Nome</th>
                                    <th class="text-center">Endereço</th>
                                    <th class="text-center">Cidade</th>
                                    <th class="text-center">Ações</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    List<Usuario> usuarios = (List<Usuario>) request.getAttribute("usuarios");
                                    for (Usuario usuario : usuarios) {
                                %> 
                                <tr>
                                    <td class="text-center"><%= usuario.getIdUsuario()%></td>                    
                                    <td class="text-center"><%= usuario.getNome()%></td>                    
                                    <td class="text-center"><%= usuario.getEndereco()%></td>  
                                    <td class="text-center"><%= usuario.getCidade()%></td>                                                         
                                    <td class="text-center">
                                        <a class="btn btn-default"  href="CarregarUsuario?idUsuario=<%=usuario.getIdUsuario()%>"><em class="fa fa-pencil"></em></a>
                                        <a class="btn btn-danger" href="ExcluirUsuario?idUsuario=<%=usuario.getIdUsuario()%>"><em class="fa fa-trash"></em></a>
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