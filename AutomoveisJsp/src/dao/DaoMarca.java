package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conexao.MysqlConnect;
import model.Marca;

public class DaoMarca {

	/*Criação de um array list de marca para quando a query trouxer as
	 * informações do banco, salvar no array */
	
	 public List<Marca> getItems() {
		 List<Marca> listaMarcas = new ArrayList<Marca>();
			
		 
		 /*cria um result set e joga os campos do select para essa variavel
		  * e cria um novo objeto (marca m = new marca();) */
		 
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
