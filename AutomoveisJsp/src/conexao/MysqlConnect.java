package conexao;

import com.mysql.jdbc.Connection;
import java.sql.*;
import java.sql.DriverManager;

public final class MysqlConnect {
    public Connection conn;
    private Statement statement;
    public static MysqlConnect db = MysqlConnect.getDbCon();
    
    MysqlConnect() {
        String url= "jdbc:mysql://localhost:3307/";
        String dbName = "automoveis";
        String driver = "com.mysql.jdbc.Driver";
        String userName = "root";
        String password = "";
        try {
            Class.forName(driver).newInstance();
            this.conn = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/automoveis", "root", "");
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
    public void insert(String insertQuery) throws SQLException {
        statement = db.conn.createStatement();
        statement.executeUpdate(insertQuery);
      
 
    }
 
}
