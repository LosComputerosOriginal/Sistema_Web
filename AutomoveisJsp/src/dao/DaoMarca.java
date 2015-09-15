package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conexao.MysqlConnect;
import model.Marca;

public class DaoMarca {

	 public List<Marca> getItems() {
		 List<Marca> listaMarcas = new ArrayList<Marca>();
			
			try {
				ResultSet set =  MysqlConnect.db.query("select * from marca");
				while(set.next()){
					Marca m = new Marca();
					m.setId(set.getInt("id"));
					m.setDescricao(set.getString("descricao"));
					listaMarcas.add(m);
					System.out.println(m.getDescricao());
				}
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			
	        return listaMarcas;
	    }
	
}
