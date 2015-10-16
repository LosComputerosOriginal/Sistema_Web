package dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import conexao.MysqlConnect;
import model.Veiculo;

public class DaoCarro {

	
	/*Consulta e retorna todos os campos e itens salvos na tabela veiculos*/
	
	public static ResultSet consultaGeral(ResultSet set){
	
		  try {  
		      set =  MysqlConnect.db.query("select v.id, m.nome_modelo, v.versao, v.ano, v.placa, v.valorcusto, v.valorvenda, v.cor, v.status, v.motor, v.combustivel " +  
"from veiculos v,modelo m where v.cod_modelo = m.id"); 
		      
		  
		  }   
		      catch (SQLException e){  
		        // e.printStackTrace();  
		         System.out.println("FUUUUU");
		      }  
		  return set;
		   }  
		
	
	
	/*insere os dados na tabela veiulos*/
	
	
	  public static void inserirDados(Veiculo v) {  
		 
		  String query = "INSERT INTO veiculos (cod_modelo, versao, cor, ano,"
		   		+ "status,valorcusto,valorvenda,placa,motor,combustivel) VALUES ( " 
	        + v.getCod_model()
		   + ", '" + v.getVersao() + "','"+ v.getCor() + "'," + v.getAno() + 
		   ", " + v.getStatus() + ", " + v.getValorCusto() + "," + v.getValorVenda() + ",'" + 
		  v.getPlaca() + "','" + v.getMotor() + "','" + v.getCombustivel() + "');";
		  
		  System.out.println(query);
		   
		  
		  
			  MysqlConnect.db.insert(query);
			
		
		   
		   
	   
	   }  
	
	
	
}
