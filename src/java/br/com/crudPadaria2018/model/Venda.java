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
public class Venda {
    private int idVenda;
    private Vendedor vendedor;
    private Usuario usuario;
    private Produto produto;

    public Venda() {
    }

    public Venda(int idVenda, Vendedor vendedor, Usuario usuario, Produto produto) {
        this.idVenda = idVenda;
        this.vendedor = vendedor;
        this.usuario = usuario;
        this.produto = produto;
    }

    public int getIdVenda() {
        return idVenda;
    }

    public void setIdVenda(int idVenda) {
        this.idVenda = idVenda;
    }

    public Vendedor getVendedor() {
        if(vendedor==null){
            vendedor = new Vendedor();
        }
        return vendedor;
    }

    public void setVendedor(Vendedor vendedor) {
        this.vendedor = vendedor;
    }

    public Usuario getUsuario() {
        if(usuario==null){
            usuario = new Usuario();
        }
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public Produto getProduto() {
        if(produto==null){
            produto = new Produto();
        }
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }
    
    
    
}
