<%-- 
    Document   : vendedorAlterar
    Created on : 09/06/2018, 02:09:38
    Author     : Servidor
--%>

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
                            <h3>Alterações dos Vendedores</h3>
                            <hr>
                            <p class="p-geral">
                               A alterações dos vendedores só podem ser realizadas com pedido do próprio vendedor, do contrário poderia causar um transtorno na utilização do sistema.
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
                                    <form  name="alterarvendedor" action="AlterarVendedor" 
                                           method="POST">
                                        <div class="form-group">
                                            <div class="form-line">
                                                <input type="text" name="idvendedor" id="idvendedor" class="form-control" value="${vendedor.idVendedor}" readonly="readonly"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-line">
                                                <input type="text" name="nomevendedor" id="nomevendedor" class="form-control" value="${vendedor.nomeVendedor}" size="50" maxlength="50"/>
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
