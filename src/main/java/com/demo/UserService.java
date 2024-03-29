package com.demo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.util.Date;

public class UserService {
    //Sees if the username and password exist in a row of Customer
    public boolean customerLogIn(String username, String password) {
        ConnectionDB database = new ConnectionDB();
        try (Connection db = database.getConnection();
             PreparedStatement st = db.prepareStatement("SELECT * FROM customer WHERE fullname=? AND password=?")) {
            st.setString(1, username);
            st.setString(2, password);
            try (ResultSet rs = st.executeQuery()) {
                return rs.next();
            }
        } catch (Exception e) {
            throw new RuntimeException("Error occurred while processing login", e);
        }
    }

    //Sees if the username and password exist in a row of Employee
    public boolean employeeLogIn(String username, String password) {
        ConnectionDB database = new ConnectionDB();
        try (Connection db = database.getConnection();
             PreparedStatement st = db.prepareStatement("SELECT * FROM employee WHERE fullname=? AND password=?")) {
            st.setString(1, username);
            st.setString(2, password);
            try (ResultSet rs = st.executeQuery()) {
                return rs.next();
            }
        } catch (Exception e) {
            throw new RuntimeException("Error occurred while processing login", e);
        }
    }

    //Creates a new customer
    public boolean signUpCustomer(String username, String password, int ID, String address) {
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
    public boolean signUpEmployee(String username, String password, int ssn, String address, int hotelID, String role) {
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

    //Finds customerID given the cookie username
    public int findCustomerID(String username) {
        int userID = -1; // Default userID if not found
        ConnectionDB database = new ConnectionDB();
        try (Connection db = database.getConnection();
             PreparedStatement st = db.prepareStatement("SELECT customerid FROM customer WHERE fullname=?")) {
            st.setString(1, username);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    userID = rs.getInt("customerid");
                }
            }
        } catch (Exception e) {
            throw new RuntimeException("Error occurred while processing query", e);
        }
        return userID;
    }

    //Finds employeeID given the cookie username
    public int findEmployeeID(String username) {
        int userID = -1;
        ConnectionDB database = new ConnectionDB();
        try (Connection db = database.getConnection();
             PreparedStatement st = db.prepareStatement("SELECT employeeid FROM employee WHERE fullname=?")) {
            st.setString(1, username);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    userID = rs.getInt("employeeid");
                }
            }
        } catch (Exception e) {
            throw new RuntimeException("Error occurred while processing query", e);
        }
        return userID;
    }




}
