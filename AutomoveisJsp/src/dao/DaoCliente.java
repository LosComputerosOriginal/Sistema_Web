package dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import conexao.MysqlConnect;
import model.Cliente;

public class DaoCliente {

	
	/*Consulta e retorna todos os campos e itens salvos na tabela veiculos*/
	
	public static ResultSet consultaGeral(ResultSet set){
	
		  try {  
		      set =  MysqlConnect.db.query("select id, cpf, nome, rg, telefone, rua, bairro, numero, cidade, nascimento, email " +  
"from cliente"); 
		      
		  
		  }   
		      catch (SQLException e){  
		        // e.printStackTrace();  
		         System.out.println("Deu Erro nessa bosta");
		      }  
		  return set;
		   }  
		
	
	
	/*insere os dados na tabela veiulos*/
	
	
	  public static void inserirDados(Cliente c) {  
		 
		  String query = "INSERT INTO cliente (cpf, nome, rg, telefone, rua, bairro, numero, cidade, nascimento, email) VALUES ( " 
	        + c.getCpf()
		   + ", '" + c.getNome() + "','"+ c.getRg() + "'," + c.getTelefone() + 
		   ", '" + c.getRua() + "', '" + c.getBairro() + "'," + c.getNumero() + ",'" + 
		  c.getCidade() + "','" + c.getNascimento() + "','" + c.getEmail() + "');";
		  
		  System.out.println(query);
		   
		  
			  MysqlConnect.db.insert(query);
			
		
		   
		   
	   
	   }  
	  

	  public static void alterarDados(Cliente c) {  
		 
		  String query = "INSERT INTO cliente (cpf, nome, rg, telefone, rua, bairro, numero, cidade, nascimento, email) VALUES ( " 
	        + c.getCpf()
		   + ", '" + c.getNome() + "','"+ c.getRg() + "'," + c.getTelefone() + 
		   ", '" + c.getRua() + "', '" + c.getBairro() + "'," + c.getNumero() + ",'" + 
		  c.getCidade() + "','" + c.getNascimento() + "','" + c.getEmail() + "');";
		  
		  System.out.println(query);
		   
		  
			  MysqlConnect.db.insert(query);
			
		
		   
		   
	   
	   }  
	
	
	
}
