import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionDB {

    private final String ip = "127.0.0.1";
    private final String dbServerPort = "5432";
    private final String dbName = "postgres";
    private final String dbusername = "postgres";
    private final String dbpassword = "";

    private Connection con = null;

    public Connection getConnection() throws Exception {
        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection("jdbc:postgresql://" + ip + ":" + dbServerPort + "/" + dbName, dbusername, dbpassword);
            return con;
        } catch (Exception e){
            throw new Exception("Unable to connect to DB Server: " + e.getMessage());
        }
    }

    public void close() throws SQLException{
        try {
            if (con != null)
                con.close();
        } catch (SQLException e){
            throw new SQLException("Could not close connection with DB: " + e.getMessage());
        }
    }


}
