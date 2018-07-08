CREATE TABLE usuario(
	idUsuario SERIAL NOT NULL PRIMARY KEY,
	nome VARCHAR(500),
	endereco VARCHAR (500),
	cidade VARCHAR (500)

);

CREATE TABLE fornecedor(
	idFornecedor SERIAL NOT NULL PRIMARY KEY,
	nomeFornecedor VARCHAR (500)
);

CREATE TABLE produto (
	idProduto SERIAL NOT NULL PRIMARY KEY,
	nomeProduto VARCHAR (500),
	quantidade VARCHAR (30),
	preco_uni INT NOT NULL,
	idFornecedor INT REFERENCES fornecedor (idFornecedor)
);

CREATE TABLE vendedor(
	idVendedor SERIAL NOT NULL PRIMARY KEY,
	nomeVendedor VARCHAR (500)

);

CREATE TABLE venda (
	idVenda SERIAL NOT NULL PRIMARY KEY,
	idVendedor INT REFERENCES vendedor(idVendedor),		
	idUsuario INT REFERENCES usuario (idUsuario),
	idProduto INT REFERENCES produto (idProduto)		
);

