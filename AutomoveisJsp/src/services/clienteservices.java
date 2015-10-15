package services;

import java.sql.ResultSet;


import dao.DaoCliente;
import model.Cliente;


public class clienteservices {
	public ResultSet res = null;
	
	 public void inserirClientes ( int cpf, String nome, int rg, String telefone,
			String rua, String bairro, int numero, String cidade, String nascimento, String email
			 ){
		 
		 Cliente c = new Cliente();
		 
		//System.out.println(cod_model);
		
		//c.setId(id);
		c.setCpf(cpf);
		c.setNome(nome);
		c.setRg(rg);
		c.setTelefone(telefone);
		c.setRua(rua);
		c.setRua(rua);
		c.setBairro(bairro);
		c.setNumero(numero);
		c.setCidade(cidade);
		c.setNascimento(nascimento);
		c.setEmail(email);
		 
	DaoCliente.inserirDados(c);
		 
		 
	 }
	 
	 
	 public void setConsulta() {  
	        
	      res = DaoCliente.consultaGeral(res);  
	  
	   }  
	
	
	   public ResultSet getResultado() {  
		      return res;  
		   } 
	

}
