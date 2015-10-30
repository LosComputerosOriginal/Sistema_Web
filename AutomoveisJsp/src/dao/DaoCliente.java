package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import conexao.MysqlConnect;
import model.Cliente;

public class DaoCliente {

	
	/*Consulta e retorna todos os campos e itens salvos na tabela veiculos*/
	
	public static ResultSet consultaGeral(){
		ResultSet set = null;
		  try {  
			  set =  MysqlConnect.db.query("select id, cpf, nome, rg, telefone, rua, bairro, numero, cidade, nascimento, email " +  
"from cliente"); 
			 
		    	      
		      
		      
			  }   
		      catch (SQLException e){  
		        // e.printStackTrace();  
		    	 
		         
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



	public static String consultacpf(String cpf) {
		ResultSet set2 = null;
		String nome = null;
		try{
			set2=MysqlConnect.db.query("select id, cpf, nome, rg, telefone, rua, bairro, numero, cidade, nascimento, email " +  
"from cliente where cpf="+cpf);
		
			while(set2.next()){
				
				nome=(set2.getString("nome"));
			}
		
	  
}catch (SQLException e){  
    // e.printStackTrace();  
	 
    
  }  
		return nome;
}
}