package com.demo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class AdminService {


    public String SQLQuery(String query) {

        ConnectionDB database = new ConnectionDB();

        try {
            Connection db = database.getConnection();
            Statement st = db.createStatement();
            ResultSet rs = st.executeQuery(query);

            rs.close();
            st.close();
            return "Query Was Successful, the Database was altered";

        } catch (Exception e) {
            return "Query Was Unsuccessful";
        }
    }

    public ArrayList<Room> roomList() {

        ArrayList<Room> roomList = new ArrayList<Room>();
        ConnectionDB database = new ConnectionDB();

        try {
            Connection db = database.getConnection();
            Statement st = db.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM hotel_room");
            while (rs.next()) {
                Room room = new Room(rs.getInt("roomID"), rs.getInt("hotelID"), rs.getDouble("price"), rs.getString("capacity"), rs.getString("sea_mountain_view"), rs.getBoolean("extension"), rs.getBoolean("damage"));

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
}
