/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.crudPadaria2018.dao;

import br.com.crudPadaria2018.model.Usuario;
import br.com.crudPadaria2018.utils.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Secretaria-PC-04
 */
public class UsuarioDAO implements GenericDAO{
    
    private Connection conexao;

     public UsuarioDAO() throws Exception
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
        Usuario oUsuario = (Usuario) objeto;
       Boolean retorno = false;
       
       if(oUsuario.getIdUsuario()==0)
       {
           retorno = this.inserir(oUsuario);
       }
       else
       {
           retorno = this.alterar(oUsuario);
       }
       return retorno;
    }    
    
    
       @Override
    public Boolean inserir(Object objeto) {
        Usuario oUsuario  = (Usuario) objeto;
        PreparedStatement stmt = null;
        String sql = "Insert into usuario (nome,endereco,cidade) values (?,?,?)";
        
        try{
            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, oUsuario.getNome());
            stmt.setString(2, oUsuario.getEndereco());
            stmt.setString(3, oUsuario.getCidade());
            
            stmt.execute();
            return true;
        }
        catch(Exception ex)
        {
            System.out.println("Problemas ao cadastrar usuario!Erro: "+ex.getMessage());
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
         Usuario oUsuario = (Usuario) objeto;
       PreparedStatement stmt = null;
       String sql = "update usuario set nome=?, endereco=?,cidade=? where idusuario=?";
       
       try{
           stmt = conexao.prepareStatement(sql);
           stmt.setString(1,oUsuario.getNome());
           stmt.setString(2, oUsuario.getEndereco());
           stmt.setString(3, oUsuario.getCidade());
           stmt.setInt(4, oUsuario.getIdUsuario());
          
           stmt.execute();
           return true;
       }
       catch(Exception ex){
           System.out.println("Problemas ao alterar usuário? Erro: " +ex.getMessage());
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
           int idUsuario = numero;
            PreparedStatement stmt = null;
            String sql = "delete from usuario where idusuario=?;";
            try{
                stmt = conexao.prepareStatement(sql);
                stmt.setInt(1, idUsuario);
                
                stmt.execute();
                return true;
            }
            catch(Exception ex){
                System.out.println("Problemas ao excluir usuário! Erro: " +ex.getMessage());
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
        int idUsuario = numero;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Usuario oUsuario = null;
        String sql = "Select * from usuario where idusuario=?;";

        try{
            stmt=conexao.prepareStatement(sql);
            stmt.setInt(1, idUsuario);
            rs=stmt.executeQuery();

            while (rs.next()){
                oUsuario = new Usuario();
                oUsuario.setIdUsuario(rs.getInt("idUsuario"));
                oUsuario.setNome(rs.getString("nome"));
                oUsuario.setEndereco(rs.getString("endereco"));
                oUsuario.setCidade(rs.getString("cidade"));
            }
            return oUsuario;
        }
        catch (SQLException ex){
            System.out.println("Problemas ao carregar usuario!"
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
       
       String sql = "Select * from usuario order by nome";
       try{
           stmt = conexao.prepareStatement(sql);
           rs = stmt.executeQuery();
           while (rs.next()){
               Usuario oUsuario = new Usuario();
               oUsuario.setIdUsuario(rs.getInt("idusuario"));
               oUsuario.setNome(rs.getString("nome"));
                oUsuario.setEndereco(rs.getString("endereco"));
               oUsuario.setCidade(rs.getString("cidade"));
               resultado.add(oUsuario);               
           }
       }catch(SQLException ex){
           System.out.println("Problemas ao listar Usuário! Erro:"
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
