package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conexao.MysqlConnect;
import model.Modelo;


public class DaoModelo{

/*Cria��o de um array list de modelos para quando a query trouxer as
 * informa��es do banco, salvar no array */
	
public static List<Modelo> getItems(int id) {
	 List<Modelo> listaModelos = new ArrayList<Modelo>();
		
	 
	 /*cria um result set e joga os campos do select para essa variavel
	  * e cria um novo objeto (modelo mo = new modelo();) */
	 
		try {
			ResultSet set =  MysqlConnect.db.query("select id, nome_modelo from modelo where codigo_marca = " + id);
			int i = 0;
			while(set.next()){
				i = i + 1;
				Modelo mo = new Modelo();
				mo.setId(set.getInt("id"));
				mo.setNome_modelo(set.getString("nome_modelo"));
				listaModelos.add(mo);
				
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
       return listaModelos;
   }
	
	
	
	
}

