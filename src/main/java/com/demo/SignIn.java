package com.demo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.PreparedStatement;

public class SignIn {

    public boolean customerLogIn(String username, String password) {
        ConnectionDB database = new ConnectionDB();
        try (Connection db = database.getConnection();
             PreparedStatement st = db.prepareStatement("SELECT * FROM customer WHERE fullname=? AND password=?")) {
            st.setString(1, username);
            st.setString(2, password);
            try (ResultSet rs = st.executeQuery()) {
                return rs.next(); // Check if any row is returned
            }
        } catch (Exception e) {
            throw new RuntimeException("Error occurred while processing login", e);
        }
    }

    public boolean employeeLogIn(String username, String password) {
        ConnectionDB database = new ConnectionDB();
        try (Connection db = database.getConnection();
             PreparedStatement st = db.prepareStatement("SELECT * FROM employee WHERE fullname=? AND password=?")) {
            st.setString(1, username);
            st.setString(2, password);
            try (ResultSet rs = st.executeQuery()) {
                return rs.next(); // Check if any row is returned
            }
        } catch (Exception e) {
            throw new RuntimeException("Error occurred while processing login", e);
        }
    }

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
            return rowsAffected > 0; // Return true if at least one row was affected (insert successful)
        } catch (Exception e) {
            e.printStackTrace(); // Handle or log the exception properly
            return false;
        }
    }

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
}
