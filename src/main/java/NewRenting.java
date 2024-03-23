import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class NewRenting {

    public String registerCustomer(String username, String password, int ID, String address){
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

    public String createRenting(int customerID, int roomID, int paymentNum, String start_date, String end_date){
        ConnectionDB database = new ConnectionDB();

        try {
            Connection db = database.getConnection();
            Statement st = db.createStatement();
            ResultSet rs = st.executeQuery("INSERT INTO renting (customerID, roomID, payment, start_date, end_date) VALUES (" + Integer.toString(customerID) + ", " + Integer.toString(roomID) + ", " + Integer.toString(paymentNum) + ", DATE '" + start_date + "', DATE '" + end_date + "')");
            return "New Renting Created";


        } catch (Exception e) {
            return "Error in Creating Renting";
        }

    }


}
