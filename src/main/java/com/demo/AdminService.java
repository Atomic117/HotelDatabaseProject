package com.demo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class AdminService {
    public ArrayList<Room> roomList() {

        ArrayList<Room> roomList = new ArrayList<Room>();
        ConnectionDB database = new ConnectionDB();

        try {
            Connection db = database.getConnection();
            Statement st = db.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM hotel_room");
            while (rs.next()) {
                Room room = new Room(rs.getInt("roomID"), rs.getInt("hotelID"), rs.getDouble("price"), rs.getString("capacity"), rs.getString("sea_mountainview"), rs.getBoolean("extension"), rs.getBoolean("damages"));

                roomList.add(room);
            }
            rs.close();
            st.close();
            return roomList;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Hotel> hotelList() {
        ArrayList<Hotel> hotelList = new ArrayList<Hotel>();
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

    public ArrayList<Customer> customerList(){
        ArrayList<Customer> customerList = new ArrayList<Customer>();
        ConnectionDB database = new ConnectionDB();

        try{
            Connection db = database.getConnection();
            Statement st = db.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM customer");
            while (rs.next()){
                Customer customer = new Customer(rs.getInt("customerID"), rs.getString("fullName"), rs.getString("address"), rs.getString("registrationDate"), rs.getInt("typeID"), rs.getString("password"));

                customerList.add(customer);
            }
            rs.close();
            st.close();
            return customerList;
        }

        catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Employee> employeeList() {
        ArrayList<Employee> employeeList = new ArrayList<Employee>();
        ConnectionDB database = new ConnectionDB();

        try {
            Connection db = database.getConnection();
            Statement st = db.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM employee");
            while (rs.next()) {
                Employee employee = new Employee(rs.getInt("employeeID"), rs.getInt("hotelID"), rs.getString("fullName"), rs.getString("address"), rs.getString("rolePosition"), rs.getInt("ssn_sin_type"), rs.getString("password"));

                employeeList.add(employee);
            }
            rs.close();
            st.close();
            return employeeList;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public boolean deleteHotel(int id) {
        boolean success = false;
        ConnectionDB database = new ConnectionDB();

        try (Connection connection = database.getConnection();
             PreparedStatement statement = connection.prepareStatement(
                     "DELETE FROM hotel WHERE hotelid = ?")) {
            statement.setInt(1, id);

            int rowsAffected = statement.executeUpdate();
            if (rowsAffected > 0) {
                success = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }

    public boolean deleteRoom(int id) {
        boolean success = false;
        ConnectionDB database = new ConnectionDB();

        try (Connection connection = database.getConnection();
             PreparedStatement statement = connection.prepareStatement(
                     "DELETE FROM hotel_room WHERE roomid = ?")) {
            statement.setInt(1, id);

            int rowsAffected = statement.executeUpdate();
            if (rowsAffected > 0) {
                success = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }

    public boolean deleteEmployee(int id) {
        boolean success = false;
        ConnectionDB database = new ConnectionDB();

        try (Connection connection = database.getConnection();
             PreparedStatement statement = connection.prepareStatement(
                     "DELETE FROM employee WHERE employeeid = ?")) {
            statement.setInt(1, id);

            int rowsAffected = statement.executeUpdate();
            if (rowsAffected > 0) {
                success = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }

    public boolean deleteCustomer(int id) {
        boolean success = false;
        ConnectionDB database = new ConnectionDB();

        try (Connection connection = database.getConnection();
             PreparedStatement statement = connection.prepareStatement(
                     "DELETE FROM customer WHERE customerid = ?")) {
            statement.setInt(1, id);

            int rowsAffected = statement.executeUpdate();
            if (rowsAffected > 0) {
                success = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }

    public boolean createHotel(int hotelid, int roomnumber, int chainid, String address, String email, int star, String manager, String phone) {
        ConnectionDB database = new ConnectionDB();
        try (Connection conn = database.getConnection();
             PreparedStatement stmt = conn.prepareStatement(
                     "INSERT INTO hotel (hotelid, room_number, chainid, hoteladdress, email, hotelstar, manager, phone) VALUES (?, ?, ?, ?, ?, ?, ?, ?)")) {
            stmt.setInt(1, hotelid);
            stmt.setInt(2, roomnumber);
            stmt.setInt(3, chainid);
            stmt.setString(4, address);
            stmt.setString(5, email);
            stmt.setInt(6, star);
            stmt.setString(7, manager);
            stmt.setString(8, phone);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean createRoom(int roomID, int hotelID, double price, String capacity, String seaMountainView, boolean extension, boolean damage) {
        ConnectionDB database = new ConnectionDB();
        try (Connection conn = database.getConnection();
             PreparedStatement stmt = conn.prepareStatement(
                     "INSERT INTO hotel_room (roomid, hotelid, price, extension, damages, capacity, sea_mountainview) " +
                             "VALUES (?, ?, ?, ?, ?, ?, ?)")) {
            stmt.setInt(1, roomID);
            stmt.setInt(2, hotelID);
            stmt.setDouble(3, price);
            stmt.setBoolean(4, extension);
            stmt.setBoolean(5, damage);
            stmt.setString(6, capacity);
            stmt.setString(7, seaMountainView);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean createCustomer(String username, String password, int ID, String address) {
        ConnectionDB database = new ConnectionDB();
        try (Connection db = database.getConnection();
             Statement st = db.createStatement()) {
            String query = "INSERT INTO customer (typeid, fullname, address, password) VALUES (" +
                    ID + ", '" +
                    username + "', '" +
                    address + "', '" +
                    password + "')";
            int rowsAffected = st.executeUpdate(query);
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    //Creates a new employee
    public boolean createEmployee(String username, String password, int ssn, String address, int hotelID, String role) {
        ConnectionDB database = new ConnectionDB();
        try (Connection db = database.getConnection();
             Statement st = db.createStatement()) {
            String query = "INSERT INTO employee (hotelid, ssn_sin_type, fullname, address, roleposition, password) VALUES (" +
                    hotelID + ", '" +
                    ssn + "', '" +
                    username + "', '" +
                    address + "', '" +
                    role + "', '" +
                    password + "')";
            int rowsAffected = st.executeUpdate(query);
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateCustomer(int customerID, String username, String password, int ID, String address) {
        ConnectionDB database = new ConnectionDB();
        try (Connection db = database.getConnection();
             PreparedStatement st = db.prepareStatement(
                     "UPDATE customer SET typeid=?, fullname=?, address=?, password=? WHERE customerid=?")) {
            st.setInt(1, ID);
            st.setString(2, username);
            st.setString(3, address);
            st.setString(4, password);
            st.setInt(5, customerID);

            int rowsAffected = st.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateEmployee(int employeeID, String username, String password, int ssn, String address, int hotelID, String role) {
        ConnectionDB database = new ConnectionDB();
        try (Connection db = database.getConnection();
             PreparedStatement st = db.prepareStatement(
                     "UPDATE employee SET hotelid=?, ssn_sin_type=?, fullname=?, address=?, roleposition=?, password=? WHERE employeeid=?")) {
            st.setInt(1, hotelID);
            st.setInt(2, ssn);
            st.setString(3, username);
            st.setString(4, address);
            st.setString(5, role);
            st.setString(6, password);
            st.setInt(7, employeeID);

            int rowsAffected = st.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateRoom(int roomID, int hotelid, double newPrice, String newCapacity, String newSeaMountainView, boolean newExtension, boolean newDamage) {
        ConnectionDB database = new ConnectionDB();
        try (Connection conn = database.getConnection();
             PreparedStatement stmt = conn.prepareStatement(
                     "UPDATE hotel_room SET hotelid = ?, price = ?, capacity = ?, sea_mountainview = ?, extension = ?, damages = ? WHERE roomid = ?")) {
            stmt.setInt(1, hotelid);
            stmt.setDouble(2, newPrice);
            stmt.setString(3, newCapacity);
            stmt.setString(4, newSeaMountainView);
            stmt.setBoolean(5, newExtension);
            stmt.setBoolean(6, newDamage);
            stmt.setInt(7, roomID);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateHotel(int hotelid, int roomnumber, int chainid, String address, String email, int star, String manager, String phone) {
        ConnectionDB database = new ConnectionDB();
        try (Connection conn = database.getConnection();
             PreparedStatement stmt = conn.prepareStatement(
                     "UPDATE hotel SET room_number=?, chainid=?, hoteladdress=?, email=?, hotelstar=?, manager=?, phone=? WHERE hotelid=?")) {
            stmt.setInt(1, roomnumber);
            stmt.setInt(2, chainid);
            stmt.setString(3, address);
            stmt.setString(4, email);
            stmt.setInt(5, star);
            stmt.setString(6, manager);
            stmt.setString(7, phone);
            stmt.setInt(8, hotelid);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }


}
