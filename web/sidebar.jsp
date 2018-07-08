<%-- 
    Document   : sidebar
    Created on : 24/06/2018, 12:43:45
    Author     : Servidor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg d-none d-lg-block sidebar col-2">
            <!-- Painel do usuário -->
            <div class="user-panel p-3 light mb-2">
                <div>
                    <div class="float-left image">
                        <img class="user_avatar" src="imagens/avatar.png" alt="User Image">
                    </div>
                    <div class="float-left info">
                        <h6 class="font-weight-light mt-2 mb-1">Thaís Laine</h6>
                        <a href="#"><i class="icon-circle text-primary blink"></i> Online</a>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
            <!-- menu -->
            <div class="menu sidebar-sticky">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link " href="index.jsp"> 
                            <span data-feather="home"></span>
                            Home
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="ListarUsuario">
                            <span data-feather="user"></span>
                            Usuário
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ListarVendedor">
                            <span data-feather="users"></span>
                            Vendedor
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ListarFornecedor">
                            <span data-feather="users"></span>
                            Fornecedor
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ListarProduto">
                            <span data-feather="package"></span>
                            Produtos
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ListarVenda">
                            <span data-feather="shopping-cart"></span>
                            Vendas
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
        <!-- Icons -->
        <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
        <script>
            feather.replace()
        </script>
    </body>
</html>
