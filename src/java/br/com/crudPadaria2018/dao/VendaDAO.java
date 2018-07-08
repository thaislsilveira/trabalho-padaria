/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.crudPadaria2018.dao;

import br.com.crudPadaria2018.model.Produto;
import br.com.crudPadaria2018.model.Usuario;
import br.com.crudPadaria2018.model.Venda;
import br.com.crudPadaria2018.utils.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author LAB
 */
public class VendaDAO implements GenericDAO{
    
    private Connection conexao;
    
    public VendaDAO() throws Exception
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
       Venda oVenda = (Venda) objeto;
       Boolean retorno = false;
       
       if(oVenda.getIdVenda()==0)
       {
           retorno = this.inserir(oVenda);
       }
       else
       {
           retorno = this.alterar(oVenda);
       }
       return retorno;
    }

    @Override
    public Boolean inserir(Object objeto) {
       Venda oVenda  = (Venda) objeto;
        PreparedStatement stmt = null;
        String sql = "Insert into venda (idvendedor,idusuario,idproduto) values (?,?,?)";
        
        try{
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, oVenda.getVendedor().getIdVendedor());
            stmt.setInt(2, oVenda.getUsuario().getIdUsuario());
            stmt.setInt(3, oVenda.getProduto().getIdProduto());
            
            stmt.execute();
            return true;
        }
        catch(Exception ex)
        {
            System.out.println("Problemas ao cadastrar Venda!Erro: "+ex.getMessage());
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
       Venda oVenda = (Venda) objeto;
       PreparedStatement stmt = null;
       String sql = "update venda set idvendedor=?, idusuario=?,idproduto=? where idvenda=?";
       
       
       try{
           stmt = conexao.prepareStatement(sql);
           stmt.setInt(1, oVenda.getVendedor().getIdVendedor());
           stmt.setInt(2, oVenda.getUsuario().getIdUsuario());
           stmt.setInt(3, oVenda.getProduto().getIdProduto());
           stmt.setInt(4, oVenda.getIdVenda());
          
           stmt.execute();
           return true;
       }
       catch(Exception ex){
           System.out.println("Problemas ao alterar Venda! Erro: " +ex.getMessage());
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
       int idVenda = numero;
            PreparedStatement stmt = null;
            String sql = "delete from venda where idvenda=?;";
            try{
                stmt = conexao.prepareStatement(sql);
                stmt.setInt(1, idVenda);
                
                stmt.execute();
                return true;
            }
            catch(Exception ex){
                System.out.println("Problemas ao excluir venda! Erro: " +ex.getMessage());
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
       int idVenda = numero;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Venda oVenda = null;
        String sql = "select ve.*, vd.*, u.*, p.* from vendedor vd inner join venda ve on vd.idvendedor = ve.idvendedor inner join usuario u on ve.idusuario = u.idusuario inner join produto p on ve.idproduto = p.idproduto where ve.idVenda = ?";

        try{
            stmt=conexao.prepareStatement(sql);
            stmt.setInt(1, idVenda);
            rs=stmt.executeQuery();

            while (rs.next()){
                oVenda = new Venda();
                oVenda.setIdVenda(rs.getInt("idVenda"));
                
                oVenda.getVendedor().setIdVendedor(rs.getInt("idVendedor"));
                oVenda.getVendedor().setNomeVendedor(rs.getString("nomeVendedor"));
                
                oVenda.getUsuario().setIdUsuario(rs.getInt("idUsuario"));
                oVenda.getUsuario().setNome(rs.getString("nome"));
                
                oVenda.getProduto().setIdProduto(rs.getInt("idProduto"));
                oVenda.getProduto().setNomeProduto(rs.getString("nomeProduto"));
              
            }
            return oVenda;
        }
        catch (SQLException ex){
            System.out.println("Problemas ao carregar venda!"
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
       
       String sql = "select ve.*, vd.*, u.* , p.* from vendedor vd inner join venda ve on vd.idvendedor = ve.idvendedor"
                + " inner join usuario u on ve.idusuario = u.idusuario"
                + " inner join produto p on ve.idproduto = p.idproduto ";
       try{
           stmt = conexao.prepareStatement(sql);
           rs = stmt.executeQuery();
           while (rs.next()){
               Venda oVenda = new Venda();
               oVenda.setIdVenda(rs.getInt("idVenda"));
              
               oVenda.getVendedor().setIdVendedor(rs.getInt("idVendedor"));
               oVenda.getVendedor().setNomeVendedor(rs.getString("nomeVendedor"));
               
               oVenda.getUsuario().setIdUsuario(rs.getInt("idUsuario"));
               oVenda.getUsuario().setNome(rs.getString("nome"));
               
               oVenda.getProduto().setIdProduto(rs.getInt("idProduto"));
               oVenda.getProduto().setNomeProduto(rs.getString("nomeProduto"));
               
               resultado.add(oVenda);               
           }
       }catch(SQLException ex){
           System.out.println("Problemas ao listar Venda! Erro:"
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
