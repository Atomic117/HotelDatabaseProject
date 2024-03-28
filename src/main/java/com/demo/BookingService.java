package com.demo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.util.Date;

public class BookingService {

    public Booking getBookingByBookingID(int bookingID) {
        ConnectionDB database = new ConnectionDB();
        String query = "SELECT * FROM booking WHERE bookingid = ?";
        Booking booking = null;
        try (Connection conn = database.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, bookingID);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    // Retrieve booking information from the ResultSet
                    int customerID = rs.getInt("customerid");
                    int roomID = rs.getInt("roomid");
                    Date startDate = rs.getDate("start_date");
                    Date endDate = rs.getDate("end_date");
                    // Create Booking object
                    booking = new Booking(bookingID, customerID, roomID, startDate, endDate);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return booking;
    }

    public Room getRoomByBookingID(int bookingID) {
        ConnectionDB database = new ConnectionDB();
        String query = "SELECT hr.* FROM booking b JOIN hotel_room hr ON b.roomid = hr.roomid WHERE b.bookingid = ?";
        Room room = null;
        try (Connection conn = database.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, bookingID);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    // Retrieve room information from the ResultSet
                    int roomID = rs.getInt("roomid");
                    int hotelID = rs.getInt("hotelid");
                    double price = rs.getDouble("price");
                    boolean extension = rs.getBoolean("extension");
                    boolean damages = rs.getBoolean("damages");
                    String capacity = rs.getString("capacity");
                    String seaMountainView = rs.getString("sea_mountainview");
                    // Create Room object
                    room = new Room(roomID, hotelID, price, capacity, seaMountainView, extension, damages);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return room;
    }

    public Room getRoomByID(int roomID) {
        ConnectionDB database = new ConnectionDB();
        String query = "SELECT * FROM hotel_room WHERE roomid = ?";
        Room room = null;
        try (Connection conn = database.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, roomID);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    // Retrieve room information from the ResultSet
                    int hotelID = rs.getInt("hotelid");
                    double price = rs.getDouble("price");
                    boolean extension = rs.getBoolean("extension");
                    boolean damages = rs.getBoolean("damages");
                    String capacity = rs.getString("capacity");
                    String seaMountainView = rs.getString("sea_mountainview");
                    room = new Room(roomID, hotelID, price, capacity, seaMountainView, extension, damages);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return room;
    }
    public boolean newBooking(int customerID, int roomID, Date startDate, Date endDate) {
        ConnectionDB database = new ConnectionDB();
        String query = "INSERT INTO booking (customerid, roomid, start_date, end_date) VALUES (?, ?, ?, ?)";
        try (Connection db = database.getConnection();
             PreparedStatement stmt = db.prepareStatement(query)) {
            stmt.setInt(1, customerID);
            stmt.setInt(2, roomID);
            stmt.setDate(3, new java.sql.Date(startDate.getTime()));
            stmt.setDate(4, new java.sql.Date(endDate.getTime()));
            stmt.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public ArrayList<Booking> getCustomerBookings(int customerID) {
        ArrayList<Booking> bookingList = new ArrayList<>();
        ConnectionDB database = new ConnectionDB();
        try (Connection db = database.getConnection();
             PreparedStatement st = db.prepareStatement("SELECT * FROM booking WHERE customerid=?")) {
            st.setInt(1, customerID);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Booking room = new Booking(
                            rs.getInt("bookingid"),
                            rs.getInt("customerid"),
                            rs.getInt("roomid"),
                            rs.getDate("start_date"),
                            rs.getDate("end_date")
                    );
                    bookingList.add(room);
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return bookingList;
    }

    public boolean deleteBooking(int bookingID) {
        ConnectionDB database = new ConnectionDB();
        String query = "DELETE FROM booking WHERE bookingid = ?";
        try (Connection conn = database.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, bookingID);
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0; // Return true if at least one row was deleted
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}
