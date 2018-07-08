<%-- 
    Document   : fornecedorAlterar
    Created on : 09/06/2018, 00:02:50
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
                            <h3>Alterações dos Fornecedores</h3>
                            <hr>
                            <p class="p-geral">
                               É recomendável a alteração dos dados do fornecedor
                               se houver solicitação do fornecedor, porém seu ID
                               não poderá ser modificado. Além de que toda modificação
                               deve ser verídica.
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
                                    <form  name="alterarfornecedor" action="AlterarFornecedor" 
                                           method="POST">
                                        <div class="form-group">
                                            <div class="form-line">
                                                <input type="text" name="idfornecedor" id="idfornecedor" class="form-control" value="${fornecedor.idFornecedor}" readonly="readonly"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-line">
                                              <input type="text" name="nomefornecedor" id="nomefornecedor" class="form-control" value="${fornecedor.nomeFornecedor}" size="50" maxlength="50"/>
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
