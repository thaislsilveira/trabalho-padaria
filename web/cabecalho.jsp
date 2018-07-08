<%-- 
    Document   : cabecalho
    Created on : 06/06/2018, 10:06:14
    Author     : LAB
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css">
        <title>Cabecalho</title>
    </head>
    <body>
        <nav class="cabecalho navbar navbar-dark p-2">
            <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="index.jsp">Padaria</a>     
            <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse text-center d-lg-none" id="navbarsExampleDefault">
                <ul class="navbar-nav mr-auto">
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
    </nav>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
</body>
</html>
