package com.demo;

import java.sql.*;
import java.util.*;

public class Admin_Customer_List {

    ArrayList<Customer> customerList = new ArrayList<Customer>();
    public ArrayList<Customer> customerList(){

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
}
