import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class Admin_Hotel_List {
    ArrayList<Hotel> hotelList = new ArrayList<Hotel>();

    public ArrayList<Hotel> hotelList() {

        ConnectionDB database = new ConnectionDB();

        try {
            Connection db = database.getConnection();
            Statement st = db.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM hotel");
            while (rs.next()) {
                Hotel hotel = new Hotel(rs.getInt("hotelID"), rs.getInt("chainID"), rs.getString("manager"), rs.getInt("room_number"), rs.getString("hotelAddress"), rs.getInt("hotelStar"), rs.getString("email"), rs.getString("phone"));

                hotelList.add(hotel);
            }
            rs.close();
            st.close();
            return hotelList;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
