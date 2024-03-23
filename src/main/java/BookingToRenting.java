import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class BookingToRenting {

    ArrayList<Booking> bookingList = new ArrayList<Booking>();

    public ArrayList<Booking> bookingList() {

        ConnectionDB database = new ConnectionDB();

        try {
            Connection db = database.getConnection();
            Statement st = db.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM booking");
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


    public String changeBooking_to_Renting(int bookingID, int paymentNum){
        ConnectionDB database = new ConnectionDB();

        try {
            Connection db = database.getConnection();
            Statement st = db.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM booking where bookingID = " + Integer.toString(bookingID));

            Booking bookedRoom = new Booking(rs.getInt("bookingID"), rs.getInt("customerID"), rs.getInt("roomID"), rs.getDate("startDate"), rs.getDate("endDate"));

            rs = st.executeQuery("INSERT INTO renting (customerID, roomID, payment, start_date, end_date) VALUES (" + Integer.toString(bookedRoom.getCustomerID()) + ", " + Integer.toString(bookedRoom.getRoomID()) + ", " + Integer.toString(paymentNum) + ", DATE '" + bookedRoom.getStartDate() + "', DATE '" + bookedRoom.getEndDate() + "')");
            st.executeQuery("DELETE FROM booking WHERE bookingID=" + Integer.toString(bookingID));
            return "Booking Changed to Renting";

        } catch (Exception e) {
            return "Error in Switching Booking to Renting";
        }
    }
}
