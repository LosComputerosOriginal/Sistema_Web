package dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import conexao.MysqlConnect;
import model.Veiculo;

public class DaoCarro {

	
	public static ResultSet consultaGeral(ResultSet set){
	
		  try {  
		      set =  MysqlConnect.db.query("select * from veiculos"); 
		      }   
		      catch (SQLException e){  
		         e.printStackTrace();  
		      }  
		  return set;
		   }  
		
	
	
	  public static void inserirDados(Veiculo v) {  
		   String query = "INSERT INTO veiculos (placa, ano, marca, modelo, valorcusto, valorvenda) VALUES ( '" 
	        + v.getPlaca() + "', "+ v.getAno()
		   + ", '" + v.getMarca() + "','"+ v.getModelo() + "'," + v.getValorcusto() + 
		   ", " + v.getValorvenda() + ");";

		   
		   try {
			  MysqlConnect.db.insert(query);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		   
		   
	   
	   }  
	
	
	
}
