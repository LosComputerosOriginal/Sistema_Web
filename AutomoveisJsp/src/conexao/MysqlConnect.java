package conexao;

import com.mysql.jdbc.Connection;
import java.sql.*;

public final class MysqlConnect {
    public Connection conn;
    private Statement statement;
    public static MysqlConnect db = MysqlConnect.getDbCon();
    
    MysqlConnect() {
        String url= "jdbc:mysql://localhost:3307/";
        String dbName = "automoveis";
        String driver = "com.mysql.jdbc.Driver";
        String userName = "root";
        String password = "root";
        try {
            Class.forName(driver).newInstance();
            this.conn = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3307/automoveis", "root", "root");
        }
        catch (Exception sqle) {
            sqle.printStackTrace();
        }
    }
    /**
     *
     * @return MysqlConnect Database connection object
     */
    public static synchronized MysqlConnect getDbCon() {
        if ( db == null ) {
            db = new MysqlConnect();
        }
        return db;
 
    }
    /**
     *
     * @param query String The query to be executed
     * @return a ResultSet object containing the results or null if not available
     * @throws SQLException
     */
    public ResultSet query(String query) throws SQLException{
        statement = db.conn.createStatement();
        ResultSet res = statement.executeQuery(query);
        return res;
    }
    /**
     * @desc Method to insert data to a table
     * @param insertQuery String The Insert query
     * @return boolean
     * @throws SQLException
     */
    public void insert(String insertQuery)  {
       System.out.println("PASOOU AQUI PORRA");
    	
       try{
    	statement = db.conn.createStatement();
        statement.executeUpdate(insertQuery);
      
       }catch(SQLException e){
    	   e.printStackTrace();
       }
    }
    
    public PreparedStatement statement(String query){
    	PreparedStatement ps = null;
    	try {
			ps = MysqlConnect.db.conn.prepareStatement(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	
    	return ps;
    }
 
}
