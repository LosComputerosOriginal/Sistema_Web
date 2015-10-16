package services;

import java.sql.ResultSet;
import java.sql.SQLException;

import dao.DaoCarro;
import model.Veiculo;

public class VeiculoServices {

	public ResultSet res = null;
	
	 public void inserir (int cod_model, String versao, String cor, int ano, int status,
			float valorCusto, float valorVenda, String placa, String motor, String combustivel 
			 ){
		 
		 Veiculo v = new Veiculo();
		 
		System.out.println(cod_model);
		v.setCod_model(cod_model);
		v.setVersao(versao);
		v.setCor(cor);
		v.setAno(ano);
		v.setStatus(status);
		v.setValorCusto(valorCusto);
		v.setValorVenda(valorVenda);
		v.setPlaca(placa);
		v.setMotor(motor);
		v.setCombustivel(combustivel);
		 
		 DaoCarro.inserirDados(v);
		 
	
		 
		 
	 }
	 
	 public void setConsultaVeiculosEmEstoque(){
		 res = DaoCarro.consultaVeiculoDisponivel(res); 
	 }
	 
	 
	 public void setConsultaVeiculoVenda(String id){
		 res = DaoCarro.consultaVenda(res, id);
	 }
	 
	 public void setConsulta() {  
	        
	      res = DaoCarro.consultaGeral(res);  
	  
	   }  
	
	
	   public ResultSet getResultado() {  
		      return res;  
		   } 
	
}
