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
public class Vendedor {
    private int idVendedor;
    private String nomeVendedor;

    public Vendedor() {
    }

    public Vendedor(int idVendedor, String nomeVendedor) {
        this.idVendedor = idVendedor;
        this.nomeVendedor = nomeVendedor;
    }

    public int getIdVendedor() {
        return idVendedor;
    }

    public void setIdVendedor(int idVendedor) {
        this.idVendedor = idVendedor;
    }

    public String getNomeVendedor() {
        return nomeVendedor;
    }

    public void setNomeVendedor(String nomeVendedor) {
        this.nomeVendedor = nomeVendedor;
    }
    
    
}
