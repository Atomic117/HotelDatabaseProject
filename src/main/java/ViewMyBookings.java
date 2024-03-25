import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class ViewMyBookings {

    ArrayList<Booking> bookingList = new ArrayList<Booking>();
    public ArrayList<Booking> myBookings(int customerID) {

        ConnectionDB database = new ConnectionDB();

        try {
            Connection db = database.getConnection();
            Statement st = db.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM booking WHERE customerID=" + Integer.toString(customerID));
            while (rs.next()) {
                Booking room = new Booking(rs.getInt("bookingID"), rs.getInt("customerID"), rs.getInt("roomID"), rs.getDate("startDate"), rs.getDate("endDate"));

                bookingList.add(room);
            }
            rs.close();
            st.close();
            return bookingList;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
