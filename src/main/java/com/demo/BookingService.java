package com.demo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.util.Date;

public class BookingService {

    //Returns Booking given the primary key
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

    //Returns a room given bookingID

    public Room getRoomByBookingID(int bookingID) {
        ConnectionDB database = new ConnectionDB();
        String query = "SELECT hr.* FROM booking b JOIN hotel_room hr ON b.roomid = hr.roomid WHERE b.bookingid = ?";
        Room room = null;
        try (Connection conn = database.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, bookingID);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    int roomID = rs.getInt("roomid");
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

    //Returns the room given the primary key
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

    //Creates a new tuple of booking
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

    //Gets the list of bookings that belong to a customer
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

    //Gets all bookings such that the room booked are hotel rooms that the employee works at
    public ArrayList<Booking> getEmployeeBookings(int employeeID) {
        ArrayList<Booking> bookings = new ArrayList<>();
        ConnectionDB database = new ConnectionDB();
        String query = "SELECT b.* " +
                "FROM booking b " +
                "INNER JOIN hotel_room hr ON b.roomid = hr.roomid " +
                "INNER JOIN hotel h ON hr.hotelid = h.hotelid " +
                "INNER JOIN employee e ON h.hotelid = e.hotelid " +
                "WHERE e.employeeid = ?";
        try (Connection conn = database.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, employeeID);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Booking booking = new Booking(
                            rs.getInt("bookingid"),
                            rs.getInt("customerid"),
                            rs.getInt("roomid"),
                            rs.getDate("start_date"),
                            rs.getDate("end_date")
                    );
                    bookings.add(booking);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bookings;
    }

    //Delete a booking given the primary key
    public boolean deleteBooking(int bookingID) {
        ConnectionDB database = new ConnectionDB();
        String query = "DELETE FROM booking WHERE bookingid = ?";
        try (Connection conn = database.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, bookingID);
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    //Finds a customer given a bookingid
    public Customer findCustomerByBookingID(int bookingID) {
        Customer customer = null;
        ConnectionDB database = new ConnectionDB();
        try (Connection db = database.getConnection();
             PreparedStatement statement = db.prepareStatement(
                     "SELECT c.* " +
                             "FROM customer c " +
                             "JOIN booking b ON c.customerid = b.customerid " +
                             "WHERE b.bookingid = ?")) {
            statement.setInt(1, bookingID);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    int customerid = resultSet.getInt("customerid");
                    String fullname = resultSet.getString("fullname");
                    String address = resultSet.getString("address");
                    int typeid = resultSet.getInt("typeid");
                    customer = new Customer(customerid, fullname, address, "", typeid, "");
                }
            }
        } catch (Exception e) {
            throw new RuntimeException("Error occurred while processing query", e);
        }

        return customer;
    }


}
