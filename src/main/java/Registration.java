import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Objects;

public class Registration {

    public boolean logIn(String username, String password, String accountType){
        ConnectionDB database = new ConnectionDB();

        try {
            Connection db = database.getConnection();
            Statement st = db.createStatement();
            if (accountType=="Customer"){
                ResultSet rs = st.executeQuery("SELECT * FROM customer WHERE fullName='" + username + "' AND password='" + password + "'");
                rs.close();
                st.close();
                return rs.first();


            }
            else if (accountType=="Employee"){
                ResultSet rs = st.executeQuery("SELECT * FROM employee WHERE fullName='" + username + "' AND password='" + password + "'");
                rs.close();
                st.close();
                return rs.first();
            }

            return false;

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }


    public String signUpCustomer(String username, String password, int ID, String address){
        ConnectionDB database = new ConnectionDB();

        try {
            Connection db = database.getConnection();
            Statement st = db.createStatement();
            ResultSet rs = st.executeQuery("INSERT INTO customer (typeID, fullName, address, password) VALUES (" + Integer.toString(ID) + ", '" + username + "', '" + address + "', '" + password + "')");
            return "Customer Account Created";

        } catch (Exception e) {
            return "Error in Creating Customer Account";
        }
    }

    public String signUpEmployee(String username, String password, int ID, String address, int hotelID, String role){
        ConnectionDB database = new ConnectionDB();

        try {
            Connection db = database.getConnection();
            Statement st = db.createStatement();
            ResultSet rs = st.executeQuery("INSERT INTO employee (hotelID, ssn_sin_type, fullName, address, rolePosition, password) VALUES (" + Integer.toString(hotelID) + ", '" + Integer.toString(hotelID) + ", " + username + "', '" + address + "', '" + role + "', '" + password + "')");
            return "Employee Account Created";

        } catch (Exception e) {
            return "Error in Creating Employee Account";
        }
    }
}
