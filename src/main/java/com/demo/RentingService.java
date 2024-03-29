package com.demo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.util.Date;

public class RentingService {

    //Creates renting
    public boolean createRenting(int customerID, int roomID, int paymentNum, Date endDate) {
        ConnectionDB database = new ConnectionDB();
        String query = "INSERT INTO renting (customerid, roomid, payment, start_date, end_date) VALUES (?, ?, ?, CURRENT_DATE, ?)";

        try (Connection conn = database.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, customerID);
            stmt.setInt(2, roomID);
            stmt.setInt(3, paymentNum);
            stmt.setDate(4, new java.sql.Date(endDate.getTime()));

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    //Given an employeeID, returns all booking that belongs to the hotel that the employee works at
    public ArrayList<Booking> employeeGetBookings(int employeeID) {
        ArrayList<Booking> bookings = new ArrayList<>();
        ConnectionDB database = new ConnectionDB();
        String query = "SELECT b.* " +
                "FROM booking b " +
                "JOIN hotel_room hr ON b.roomid = hr.roomid " +
                "JOIN hotel h ON hr.hotelid = h.hotelid " +
                "JOIN employee e ON h.hotelid = e.hotelid " +
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

    //Converts the object booking into renting, deletes booking afterwards
    public boolean convertBookingToRenting(Booking booking, int paymentNum) {
        boolean success = false;
        ConnectionDB database = new ConnectionDB();

        try (Connection connection = database.getConnection();
             PreparedStatement deleteStatement = connection.prepareStatement(
                     "DELETE FROM booking WHERE bookingid = ?");
             PreparedStatement insertStatement = connection.prepareStatement(
                     "INSERT INTO renting (customerid, roomid, payment, start_date, end_date) " +
                             "VALUES (?, ?, ?, ?, ?)")) {

            insertStatement.setInt(1, booking.getCustomerID());
            insertStatement.setInt(2, booking.getRoomID());
            insertStatement.setInt(3, paymentNum);
            insertStatement.setDate(4, (java.sql.Date) booking.getStartDate());
            insertStatement.setDate(5, (java.sql.Date) booking.getEndDate());

            int insertRowsAffected = insertStatement.executeUpdate();

            if (insertRowsAffected > 0) {
                deleteStatement.setInt(1, booking.getBookingID());

                int deleteRowsAffected = deleteStatement.executeUpdate();

                if (deleteRowsAffected > 0) {
                    success = true;
                }
            }
        } catch (Exception e) {
            throw new RuntimeException("Error occurred while converting booking to renting", e);
        }

        return success;
    }

    //Finds all active renting (renting does not exist in archives) that belongs to the hotel that the employee
    // works at
    public ArrayList<Renting> employeeFindRenting(int employeeID) {
        ArrayList<Renting> rentings = new ArrayList<>();
        ConnectionDB database = new ConnectionDB();

        try (Connection conn = database.getConnection();
             PreparedStatement stmt = conn.prepareStatement(
                     "SELECT r.* " +
                             "FROM renting r " +
                             "JOIN hotel_room hr ON r.roomid = hr.roomid " +
                             "JOIN hotel h ON hr.hotelid = h.hotelid " +
                             "JOIN employee e ON h.hotelid = e.hotelid " +
                             "LEFT JOIN archives a ON r.rentingid = a.rentingid " +
                             "WHERE e.employeeid = ? AND a.rentingid IS NULL")) {
            stmt.setInt(1, employeeID);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Renting renting = new Renting(
                            rs.getInt("rentingid"),
                            rs.getInt("customerid"),
                            rs.getInt("roomid"),
                            rs.getInt("payment"),
                            rs.getDate("start_date"),
                            rs.getDate("end_date")
                    );
                    rentings.add(renting);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rentings;
    }

    //Given a rentingID, finds the customer that it belongs to
    public Customer findCustomerByRentingID(int rentingID) {
        Customer customer = null;
        ConnectionDB database = new ConnectionDB();

        try (Connection conn = database.getConnection();
             PreparedStatement stmt = conn.prepareStatement(
                     "SELECT c.* " +
                             "FROM customer c " +
                             "JOIN renting r ON c.customerid = r.customerid " +
                             "WHERE r.rentingid = ?")) {
            stmt.setInt(1, rentingID);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    int customerid = rs.getInt("customerid");
                    String fullname = rs.getString("fullname");
                    String address = rs.getString("address");
                    int typeid = rs.getInt("typeid");
                    customer = new Customer(customerid, fullname, address, "", typeid, "");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return customer;
    }


    //Given a rentingID, finds the room that is rented
    public Room getRoomByRentingID(int rentingID) {
        Room room = null;
        ConnectionDB database = new ConnectionDB();

        try (Connection conn = database.getConnection();
             PreparedStatement stmt = conn.prepareStatement(
                     "SELECT hr.* " +
                             "FROM hotel_room hr " +
                             "JOIN renting r ON hr.roomid = r.roomid " +
                             "WHERE r.rentingid = ?")) {
            stmt.setInt(1, rentingID);
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

    //Returns the renting object given the primary key
    public Renting getRentingByRentingID(int rentingID) {
        ConnectionDB database = new ConnectionDB();
        String query = "SELECT * FROM renting WHERE rentingid = ?";
        Renting renting = null;
        try (Connection conn = database.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, rentingID);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    // Retrieve booking information from the ResultSet
                    int customerID = rs.getInt("customerid");
                    int roomID = rs.getInt("roomid");
                    int paymentnum = rs.getInt("payment");
                    Date startDate = rs.getDate("start_date");
                    Date endDate = rs.getDate("end_date");
                    renting = new Renting(rentingID, customerID, roomID, paymentnum, startDate, endDate);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return renting;
    }

    //Given renting, create a new Archive tuple
    public boolean archivesRenting(Renting renting, String info) {
        ConnectionDB database = new ConnectionDB();

        boolean worked = false;

        try (Connection connection = database.getConnection();
             PreparedStatement statement = connection.prepareStatement(
                     "INSERT INTO archives (rentingid, additionaldetails) VALUES (?, ?)")) {

            statement.setInt(1, renting.getBookingID());
            statement.setString(2, info);

            int rowsAffected = statement.executeUpdate();

            if (rowsAffected > 0) {
                worked = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return worked;
    }

}
