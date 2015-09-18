package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Usuario;


public class DaoUsuario {
 
    public Connection getConnection(){
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/automoveis", "root", "");
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } 
        return connection;
    }
 
 
    public Usuario getUsuario( String login, String senha ){
        Connection c = this.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            ps = c.prepareStatement("select * from usuario where login = ? and senha = ?");
            ps.setString(1, login);
            ps.setString(2, senha);
 
            rs = ps.executeQuery();
 
            if ( rs.next() ){
                Usuario user = new Usuario();
               // user.setId( rs.getInt("id") );
                user.setLogin(login);
                user.setSenha(senha);
                user.setNome( rs.getString("nome") );
                user.setEmail( rs.getString("email") );
 
                return user;
            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        finally{
            if (rs != null ) {
                try { rs.close(); } catch (SQLException e) { ; }
                rs = null;
            }
            if (ps != null ) {
                try { ps.close(); } catch (SQLException e) { ; }
                ps = null;
            }
            if (c != null ) {
                try { c.close(); } catch (SQLException e) { ; }
                c = null;
            }
        }
        return null;
    }
 
}