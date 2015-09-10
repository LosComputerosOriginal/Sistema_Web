package conexao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
  
public class Conexao {  
     
   public Connection con;  
   public Statement stm;  
   public ResultSet res = null;  
   private String placa;
	private String modelo;
	private int ano;
	private Float valorcusto;
	private Float valorvenda;
	private String marca;
	private int cod_veiculo;
	private String usuario;
	
	private String erro;
	
   
  
   public String getErro() {
		return erro;
	}



	public void setErro(String erro) {
		this.erro = erro;
	}



public String getUsuario() {
		return usuario;
	}



	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}



public String getPlaca() {
		return placa;
	}



	public void setPlaca(String placa) {
		this.placa = placa;
	}



	public String getModelo() {
		return modelo;
	}



	public void setModelo(String modelo) {
		this.modelo = modelo;
	}



	public int getAno() {
		return ano;
	}



	public void setAno(int ano) {
		this.ano = ano;
	}



	public Float getValorcusto() {
		return valorcusto;
	}



	public void setValorcusto(Float valorcusto) {
		this.valorcusto = valorcusto;
	}



	public Float getValorvenda() {
		return valorvenda;
	}



	public void setValorvenda(Float valorvenda) {
		this.valorvenda = valorvenda;
	}



	public String getMarca() {
		return marca;
	}



	public void setMarca(String marca) {
		this.marca = marca;
	}



	public int getCod_veiculo() {
		return cod_veiculo;
	}



	public void setCod_veiculo(int cod_veiculo) {
		this.cod_veiculo = cod_veiculo;
	}



public Conexao() {  
  
      try {  
    	 
         Class.forName("com.mysql.jdbc.Driver");  
         con = DriverManager.getConnection ("jdbc:mysql://localhost:3307/automoveis", "root", "");  
         stm = con.createStatement();     	  
         
      } catch (Exception e) {  
         System.out.println("n�o foi poss�vel conectar ao banco" + e.getMessage());  
      }  
   }  
     
    
  
   public void inserirDados() {  
	   String query = "INSERT INTO `veiculos` (`cod_veiculo`, `placa`, `ano`, `marca`, `modelo`, `valorcusto`, `valorvenda`) VALUES (4, '34', '123', 'knsi1', '123', '123', '123'); ";

	   
	   try {
		  
		  MysqlConnect.db.insert(query);
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	 
	   
	   
   
   }  
  
   public boolean alterarDados(){  
        
      boolean testa = false;  
     
      try {  
         String query = "update veiculos set placa = " + placa + ", "+ "modelo = " + modelo + ", "+ "ano = " + ano + ", "+ "marca = " + marca + ", "+ "valorcusto = " + valorcusto + ", "+ "valorvenda = " + valorvenda + " " +  "where cod_veiculo = " + cod_veiculo + "";  
  
         int linhas = stm.executeUpdate(query);  
           
         if (linhas > 0)  
            testa = true;  
         else  
            testa = false;  
  
      }catch (SQLException e){System.out.println("Erro na inser��o:" + e.getMessage());}  
        
      return testa;  
   }  
     
   public boolean excluirDados(){  
     
    boolean testa = false;  
     
      try {  
         String query = "delete from veiculos where placa='" +placa+"'";  
         int linhas = stm.executeUpdate(query);  
           
         if (linhas > 0)  
            testa = true;  
         else  
            testa = false;  
  
      }catch (SQLException e){System.out.println("Erro na exclus�o:" + e.getMessage());}  
        
      return testa;  
   }  
     
   public boolean consultarDados(){  
        
      boolean testa = false;  
           
      try {  
         String query = "select * from veiculos where modelo='"+modelo+"'";  
         res = stm.executeQuery(query);  
           
         if (res.next()){testa = true;}  
         else{testa = false;}  
           
      }catch (SQLException e){System.out.println("Erro na inser��o:" + e.getMessage());}  
        
      return testa;  
   }     
  
   public void setConsulta() {  
        
      try {  
         res = stm.executeQuery("select * from veiculos");  
      }   
      catch (SQLException e){  
         e.printStackTrace();  
      }  
  
   }  
  
   public ResultSet getResultado() {  
      return res;  
   }  
}  