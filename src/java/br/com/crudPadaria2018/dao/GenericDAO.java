/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.crudPadaria2018.dao;

import java.util.List;

/**
 *
 * @author Secretaria-PC-04
 */
public interface GenericDAO {
      //Object é uma classe generica, sendo implementada em varias classes diferentes, assumindo qualquer formato.
    public Boolean cadastrar(Object objeto);
    public Boolean inserir(Object objeto);
    public Boolean alterar(Object objeto);
    public Boolean excluir(int numero);
    public Object carregar(int numero);
    public List<Object> Listar();
    
}
