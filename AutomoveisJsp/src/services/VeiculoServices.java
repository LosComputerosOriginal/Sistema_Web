package services;

import java.sql.ResultSet;
import java.sql.SQLException;

import dao.DaoCarro;
import model.Veiculo;

public class VeiculoServices {

	public ResultSet res = null;
	
	 public void inserir (String placa, String modelo, int ano, Float valorCusto, Float valorVenda, String marca){
		 
		 Veiculo v = new Veiculo();
		 
		 v.setPlaca(placa);
		 v.setModelo(modelo);
		 v.setAno(ano);
		 v.setValorcusto(valorCusto);
		 v.setValorvenda(valorVenda);
		 v.setMarca(marca);
		 
		 DaoCarro.inserirDados(v);
		 
		 
	 }
	 
	 
	 public void setConsulta() {  
	        
	      res = DaoCarro.consultaGeral(res);  
	  
	   }  
	
	
	   public ResultSet getResultado() {  
		      return res;  
		   } 
	
}
