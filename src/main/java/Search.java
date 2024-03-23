import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;

public class Search {

    String startDate;

    String endDate;

    String capacity;

    int chain;

    int category;

    int num_of_rooms;

    double price;

    public ArrayList<Room> search(String startDate, String endDate, String capacity, String chain, int category, int number_of_rooms, double price) {

        ArrayList<Room> filteredRooms = new ArrayList<Room>();

        this.startDate = startDate;
        this.endDate = endDate;
        this.capacity = capacity;
        if (chain.contains("1")) {
            this.chain = 1;
        } else if (chain.contains("2")) {
            this.chain = 2;
        } else if (chain.contains("3")) {
            this.chain = 3;
        } else if (chain.contains("4")) {
            this.chain = 4;
        } else if (chain.contains("5")) {
            this.chain = 5;
        }
        this.category = category;
        this.num_of_rooms = number_of_rooms;
        this.price = price;

        ConnectionDB database = new ConnectionDB();

        try {
            Connection db = database.getConnection();
            Statement st = db.createStatement();
            ResultSet rs = st.executeQuery("SELECT hotel_room.\"roomID\", hotel_room.\"hotelID\", price, extension, damages, capacity, hotel_room.\"sea_mountainView\" FROM hotel_room " +
                    "LEFT JOIN hotel ON hotel_room.\"hotelID\" = hotel.\"hotelID\" " +
                    "LEFT JOIN renting ON hotel_room.\"roomID\" = renting.\"roomID\" " +
                    "LEFT JOIN booking ON hotel_room.\"roomID\" = booking.\"roomID\" " +
                    "WHERE ((booking.\"bookingID\" IS NULL AND renting.\"rentingID\" IS NULL " +
                    "OR NOT (booking.start_date <= DATE '" + this.startDate + "' AND DATE '" + this.endDate + "' <= booking.end_date) AND booking.\"bookingID\" IS NOT NULL " +
                    "OR NOT (renting.start_date <= DATE '" + this.startDate + "' AND DATE '" + this.endDate + "' <= renting.end_date) AND renting.\"rentingID\" IS NOT NULL) OR " + this.startDate + " IS NULL OR " + this.endDate + " IS NULL)" +
                    "AND (capacity = '" + this.capacity + "' OR " + this.capacity + " IS NULL)" +
                    "AND (hotel.\"chainID\" = " + Integer.toString(this.chain) + " OR " + Integer.toString(this.chain) + " IS NULL)" +
                    "AND (hotel.\"hotelStar\" = " + Integer.toString(this.category) + " OR " + Integer.toString(this.category) + " IS NULL)" +
                    "AND (room_number >= " + Integer.toString(this.num_of_rooms) + " OR " + Integer.toString(this.num_of_rooms) + " IS NULL)" +
                    "AND (price <= " + Double.toString(this.price) + " OR " + Double.toString(this.price) + " IS NULL)");
            while (rs.next()) {
                Room room = new Room(rs.getInt("roomID"), rs.getInt("hotelID"), rs.getDouble("price"), rs.getString("capacity"), rs.getString("sea_mountain_view"), rs.getBoolean("extension"), rs.getBoolean("damage"));

                filteredRooms.add(room);
            }
            rs.close();
            st.close();
            return filteredRooms;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
