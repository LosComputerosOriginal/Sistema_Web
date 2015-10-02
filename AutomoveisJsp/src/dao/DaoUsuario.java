package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conexao.MysqlConnect;
import model.Usuario;


public class DaoUsuario {
 
	
	/*faz conec��o com com Banco de dados*/
	
  
 
    /*Cadastra um novo usuario no banco*/
 
    public Usuario getUsuario( String login, String senha ){
        
    	Usuario user = new Usuario();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            //ps = c.prepareStatement("select * from usuario where login = ? and senha = ?");
            ps = MysqlConnect.db.statement("select * from usuario where login = ? and senha = ?");
        	ps.setString(1, login);
            ps.setString(2, senha);
 
            rs = ps.executeQuery();
 
            if ( rs.next() ){
                
               // user.setId( rs.getInt("id") );
                user.setLogin(login);
                user.setSenha(senha);
                user.setNome( rs.getString("nome") );
                user.setEmail( rs.getString("email") );
 
                
            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }
//        finally{
//            if (rs != null ) {
//                try { rs.close(); } catch (SQLException e) { ; }
//                rs = null;
//            }
//            if (ps != null ) {
//                try { ps.close(); } catch (SQLException e) { ; }
//                ps = null;
//            }
//            if (c != null ) {
//                try { c.close(); } catch (SQLException e) { ; }
//                c = null;
//            }
//        }
        return user;
    }
 
}