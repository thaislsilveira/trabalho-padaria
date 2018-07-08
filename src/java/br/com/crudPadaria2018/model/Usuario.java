/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.crudPadaria2018.model;

/**
 *
 * @author Secretaria-PC-04
 */
public class Usuario {
    
    private int idUsuario;
    private String nome;
    private String endereco;
    private String cidade;

    public Usuario() {
    }

    public Usuario(int idUsuario, String nome, String endereco, String cidade) {
        this.idUsuario = idUsuario;
        this.nome = nome;
        this.endereco = endereco;
        this.cidade = cidade;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }   
   
}
