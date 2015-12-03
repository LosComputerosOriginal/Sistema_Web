package relatorio;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;  
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;  
import java.util.Map;  
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;  
import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;  
import javax.servlet.http.HttpServletResponse;  
import conexao.MysqlConnect;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRResultSetDataSource;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperRunManager;

  
public class Relatorio {  
  
    // executa o relatório através de um JRBeanCollectionDataSource  
    public static void listar(String usuario) { 
    
    	String driverName = "com.mysql.jdbc.Driver";                          
        try {
			Class.forName(driverName);
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			System.out.println("Erro ao chamar classe Mysql" + e1.getMessage());
		}  
        // Configurando a nossa conexão com um banco de dados//  
        String serverName = "localhost:3307";    //caminho do servidor do BD  
        String mydatabase ="automoveis";        //nome do seu banco de dados  
        String url = "jdbc:mysql://" + serverName + "/" + mydatabase;  
        String username = "root";        //nome de um usuário de seu BD        
        String password = "root";      //sua senha de acesso  
        Connection connection = null;
		try {
			connection = DriverManager.getConnection(url, username, password);
			String select = null;
		       Connection conn = connection; 
		  select = "select cliente.nome, veiculos.placa, veiculos.ano, veiculos.valorvenda, veiculos.motor, veiculos.combustivel, " +
		"  cliente.cpf, cliente.telefone, cliente.rg, cliente.cidade, cliente.rua, cliente.bairro, " +
		"  cliente.email, venda.fk_cliente as cdcliente , marca.descricao, modelo.nome_modelo, venda.id, veiculos.cor " +
		"  from venda " +
		"  inner join veiculos on venda.fk_veiculo=veiculos.id " +
		"  inner join cliente on venda.fk_cliente=cliente.id " +
		"  inner join modelo on veiculos.cod_modelo=modelo.id " +
		"  inner join marca on modelo.codigo_marca=marca.id";	
		        	
		        	 PreparedStatement stmt = conn.prepareStatement(select);
		             ResultSet rs = stmt.executeQuery();
		    	     JRResultSetDataSource jrRS;  
		    	     jrRS = new JRResultSetDataSource(rs);
		    		    // System.out.println("Terminou consulta");
		    		
		    		
		       FacesContext context = FacesContext.getCurrentInstance();  
		      HttpServletResponse response = (HttpServletResponse) context  
		       .getExternalContext().getResponse();  
 
		       InputStream entrada = null;
			try {
				   HashMap parametros = new HashMap();  
				      

			       ExternalContext e = FacesContext.getCurrentInstance().getExternalContext();
			       ServletContext s = (ServletContext) e.getContext();
			       ServletOutputStream output = response.getOutputStream();
			       String diretorioDosRelatorios = s.getRealPath("/WEB-INF/relatorios");
				JasperRunManager.runReportToPdfStream(entrada, output, parametros, jrRS);
				
				entrada = new FileInputStream(diretorioDosRelatorios+"/"+"vendafaj.jasper");
				output.flush();
				output.close();
			} catch (JRException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
				System.out.println("Erro geracao" + e1.getMessage());
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
				System.out.println("Erro geracao" + e1.getMessage());
			}
			   response.setContentType("application/pdf");
			   response.addHeader("Content-Disposition", "Inline;");
			   FacesContext.getCurrentInstance().responseComplete();
			   stmt.close();
				rs.close();        
		       
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			System.out.println("Erro ao pedir conexao" + e1.getMessage());
		}  
       
        
    
    
              
             
          
      }   
            
    }  
