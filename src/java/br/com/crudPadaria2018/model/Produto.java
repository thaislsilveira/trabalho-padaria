/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.crudPadaria2018.model;

/**
 *
 * @author Servidor
 */
public class Produto {
    private int idProduto;
    private String nomeProduto;
    private String quantidade;
    private int preco_uni;
    public Fornecedor fornecedor;

    public Produto() {
    }

    public Produto(int idProduto, String nomeProduto, String quantidade, int preco_uni, Fornecedor fornecedor) {
        this.idProduto = idProduto;
        this.nomeProduto = nomeProduto;
        this.quantidade = quantidade;
        this.preco_uni = preco_uni;
        this.fornecedor = fornecedor;
    }

    public int getIdProduto() {
        return idProduto;
    }

    public void setIdProduto(int idProduto) {
        this.idProduto = idProduto;
    }

    public String getNomeProduto() {
        return nomeProduto;
    }

    public void setNomeProduto(String nomeProduto) {
        this.nomeProduto = nomeProduto;
    }

    public String getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(String quantidade) {
        this.quantidade = quantidade;
    }

    public int getPreco_uni() {
        return preco_uni;
    }

    public void setPreco_uni(int preco_uni) {
        this.preco_uni = preco_uni;
    }

    public Fornecedor getFornecedor() {
        if(fornecedor == null){
            fornecedor = new Fornecedor();
        }
        return fornecedor;
    }

    public void setFornecedor(Fornecedor fornecedor) {
        this.fornecedor = fornecedor;
    }

   
}
