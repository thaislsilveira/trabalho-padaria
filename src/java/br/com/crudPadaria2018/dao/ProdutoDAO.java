/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.crudPadaria2018.dao;

import br.com.crudPadaria2018.model.Fornecedor;
import br.com.crudPadaria2018.model.Produto;
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
public class ProdutoDAO implements GenericDAO{

   private Connection conexao;

     public ProdutoDAO() throws Exception
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
        Produto oProduto = (Produto) objeto;
       Boolean retorno = false;
       
       if(oProduto.getIdProduto()==0)
       {
           retorno = this.inserir(oProduto);
       }
       else
       {
           retorno = this.alterar(oProduto);
       }
       return retorno;
    }    
    
    
       @Override
    public Boolean inserir(Object objeto) {
        Produto oProduto  = (Produto) objeto;
        PreparedStatement stmt = null;
        String sql = "Insert into produto (nomeproduto,quantidade,preco_uni,idfornecedor) values (?,?,?,?)";
        
        try{
            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, oProduto.getNomeProduto());
            stmt.setString(2, oProduto.getQuantidade());
            stmt.setInt(3, oProduto.getPreco_uni());
            stmt.setInt(4, oProduto.getFornecedor().getIdFornecedor());
            
            stmt.execute();
            return true;
        }
        catch(SQLException ex)
        {
            System.out.println("Problemas ao cadastrar produto!Erro: "+ex.getMessage());
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
       Produto oProduto = (Produto) objeto;
       PreparedStatement stmt = null;
       String sql = "update produto set nomeproduto=?, quantidade=?,preco_uni=?,idfornecedor=? where idproduto=?";
       
       
       try{
           stmt = conexao.prepareStatement(sql);
           stmt.setString(1,oProduto.getNomeProduto());
           stmt.setString(2, oProduto.getQuantidade());
           stmt.setInt(3, oProduto.getPreco_uni());
           stmt.setInt(4, oProduto.getFornecedor().getIdFornecedor());
           stmt.setInt(5, oProduto.getIdProduto());
          
           stmt.execute();
           return true;
       }
       catch(Exception ex){
           System.out.println("Problemas ao alterar produto! Erro: " +ex.getMessage());
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
           int idProduto = numero;
            PreparedStatement stmt = null;
            String sql = "delete from produto where idproduto=?;";
            try{
                stmt = conexao.prepareStatement(sql);
                stmt.setInt(1, idProduto);
                
                stmt.execute();
                return true;
            }
            catch(Exception ex){
                System.out.println("Problemas ao excluir produto! Erro: " +ex.getMessage());
                return false;
            }
            finally{
                try {
                    ConnectionFactory.closeConnection(conexao, stmt);
                } catch (Exception ex){
                    System.out.println("Problemas ao fechar os parametros de conexao! Erro: " + ex.getMessage());
                }
            }
    }

    @Override
    public Object carregar(int numero) {
        int idProduto = numero;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Produto oProduto = null;
        String sql = "select p.*, f.* from produto p inner join fornecedor f on p.idfornecedor = f.idfornecedor where p.idProduto = ?";

        try{
            stmt=conexao.prepareStatement(sql);
            stmt.setInt(1, idProduto);
            rs=stmt.executeQuery();

            while (rs.next()){
                oProduto = new Produto();
                oProduto.setIdProduto(rs.getInt("idProduto"));
                oProduto.setNomeProduto(rs.getString("nomeProduto"));
                oProduto.setQuantidade(rs.getString("quantidade"));
                oProduto.setPreco_uni(rs.getInt("preco_uni"));
                oProduto.getFornecedor().setIdFornecedor(rs.getInt("idFornecedor"));
                oProduto.getFornecedor().setNomeFornecedor(rs.getString("nomeFornecedor"));
            }
            return oProduto;
        }
        catch (SQLException ex){
            System.out.println("Problemas ao carregar produto!"
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
       
       String sql = "select p.*, f.* from produto p inner join fornecedor f on p.idfornecedor = f.idfornecedor";
       try{
           stmt = conexao.prepareStatement(sql);
           rs = stmt.executeQuery();
           while (rs.next()){
               Produto oProduto = new Produto();
               oProduto.setIdProduto(rs.getInt("idProduto"));
               oProduto.setNomeProduto(rs.getString("nomeProduto"));
               oProduto.setQuantidade(rs.getString("quantidade"));
               oProduto.setPreco_uni(rs.getInt("preco_uni"));
               oProduto.getFornecedor().setIdFornecedor(rs.getInt("idFornecedor"));
               oProduto.getFornecedor().setNomeFornecedor(rs.getString("nomeFornecedor"));
               resultado.add(oProduto);               
           }
       }catch(SQLException ex){
           System.out.println("Problemas ao listar Produto! Erro:"
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
