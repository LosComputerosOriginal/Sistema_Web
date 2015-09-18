package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conexao.MysqlConnect;
import model.Modelo;


public class DaoModelo{


public List<Modelo> getItems() {
	 List<Modelo> listaModelos = new ArrayList<Modelo>();
		
		try {
			ResultSet set =  MysqlConnect.db.query("select id, nome_modelo from modelo");
			while(set.next()){
				Modelo mo = new Modelo();
				mo.setId(set.getInt("id"));
				mo.setNome_modelo(set.getString("nome_modelo"));
				listaModelos.add(mo);
				System.out.println(mo.getNome_modelo());
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
       return listaModelos;
   }
	
	
	
	
}

