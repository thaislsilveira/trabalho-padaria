/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.crudPadaria2018.dao;

import br.com.crudPadaria2018.model.Vendedor;
import br.com.crudPadaria2018.utils.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Servidor
 */
public class VendedorDAO implements GenericDAO {

   private Connection conexao;

     public VendedorDAO() throws Exception
    {
        try{
            this.conexao = ConnectionFactory.getConnection();
            System.out.println("Conectado com sucesso");
        }catch(Exception ex)
        {
            throw new Exception("Problemas ao conectar no BD! Erro:" + ex.getMessage());
        }
    }
   @Override
    public Boolean cadastrar(Object objeto) {
       Vendedor oVendedor = (Vendedor) objeto;
       Boolean retorno = false;
       
       if(oVendedor.getIdVendedor()==0)
       {
           retorno = this.inserir(oVendedor);
       }
       else
       {
           retorno = this.alterar(oVendedor);
       }
       return retorno;
    }    
    
    
       @Override
    public Boolean inserir(Object objeto) {
        Vendedor oVendedor  = (Vendedor) objeto;
        PreparedStatement stmt = null;
        String sql = "Insert into vendedor (nomevendedor) values (?)";
        
        try{
            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, oVendedor.getNomeVendedor());
                       
            stmt.execute();
            return true;
        }
        catch(Exception ex)
        {
            System.out.println("Problemas ao cadastrar Vendedor!Erro: "+ex.getMessage());
            return false;
        }
        finally
        {
            try
            {
                ConnectionFactory.closeConnection(conexao, stmt);
            }catch(Exception ex){
                System.out.println("Problemas ao fechar os parametros de conexao! Erro: " + ex.getMessage());
            }
        }
    }
   @Override
    public Boolean alterar(Object objeto) {
         Vendedor oVendedor = (Vendedor) objeto;
       PreparedStatement stmt = null;
       String sql = "update vendedor set nomevendedor=? where idvendedor=?";
       
       try{
           stmt = conexao.prepareStatement(sql);
           stmt.setString(1,oVendedor.getNomeVendedor());
           stmt.setInt(2, oVendedor.getIdVendedor());
          
           stmt.execute();
           return true;
       }
       catch(Exception ex){
           System.out.println("Problemas ao alterar Fornecedor! Erro: " +ex.getMessage());
           return false;
       }
       finally
       {
           try{
               ConnectionFactory.closeConnection(conexao, stmt);               
           }catch (Exception ex){
               System.out.println("Problemas ao fechar os parametros de conexão! Erro" + ex.getMessage());
           }
       }
    }

    @Override
    public Boolean excluir(int numero) {
           int idVendedor = numero;
            PreparedStatement stmt = null;
            String sql = "delete from vendedor where idvendedor=?;";
            try{
                stmt = conexao.prepareStatement(sql);
                stmt.setInt(1, idVendedor);
                
                stmt.execute();
                return true;
            }
            catch(Exception ex){
                System.out.println("Problemas ao excluir vendedor! Erro: " +ex.getMessage());
                return false;
            }
            finally{
                try {
                    ConnectionFactory.closeConnection(conexao, stmt);
                } catch (Exception ex){
                    System.out.println("Problemas ao fehcar os parametros de conexao! Erro: " + ex.getMessage());
                }
            }
    }

    @Override
    public Object carregar(int numero) {
        int idVendedor = numero;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Vendedor oVendedor = null;
        String sql = "Select * from vendedor where idvendedor=?;";

        try{
            stmt=conexao.prepareStatement(sql);
            stmt.setInt(1, idVendedor);
            rs=stmt.executeQuery();

            while (rs.next()){
                oVendedor = new Vendedor();
                oVendedor.setIdVendedor(rs.getInt("idVendedor"));
                oVendedor.setNomeVendedor(rs.getString("nomeVendedor"));
               
            }
            return oVendedor;
        }
        catch (SQLException ex){
            System.out.println("Problemas ao carregar vendedor!"
               + "Erro: " +ex.getMessage());
            return null;         
        }finally{
            try{
                ConnectionFactory.closeConnection(conexao, stmt, rs);
            }
            catch(Exception ex){
                System.out.println("Problemas ao fechar os parâmetros de conexão! Erro: "
                   +ex.getMessage());
            }
        }
    }

    @Override
    public List<Object> Listar() {
           List <Object> resultado = new ArrayList<>();
       PreparedStatement stmt = null;
       ResultSet rs = null;
       
       String sql = "Select * from vendedor order by nomevendedor";
       try{
           stmt = conexao.prepareStatement(sql);
           rs = stmt.executeQuery();
           while (rs.next()){
               Vendedor oVendedor = new Vendedor();
               oVendedor.setIdVendedor(rs.getInt("idvendedor"));
               oVendedor.setNomeVendedor(rs.getString("nomevendedor"));
               resultado.add(oVendedor);               
           }
       }catch(SQLException ex){
           System.out.println("Problemas ao listar Vendedor! Erro:"
                        + ex.getMessage());
       }finally{
           try{
               ConnectionFactory.closeConnection(conexao, stmt,rs);
           }catch (Exception ex){
               System.out.println("Problemas ao fechar os "
                + "parametros de conexão! Erro: "
                +ex.getMessage());
           }
       }
       return resultado;
       
    }
    
}
