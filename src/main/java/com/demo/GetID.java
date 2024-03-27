package com.demo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class GetID {

    public int getCustomerID(String fullName){

        ConnectionDB database = new ConnectionDB();

        try {
            Connection db = database.getConnection();
            Statement st = db.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM customer WHERE fullname=" + fullName);

            int customerID = rs.getInt("customerid");

            rs.close();
            st.close();
            return customerID;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }


    }

    public int getEmployeeID(String fullName){
        ConnectionDB database = new ConnectionDB();

        try {
            Connection db = database.getConnection();
            Statement st = db.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM employee WHERE fullname=" + fullName);

            int employeeID = rs.getInt("employeeid");

            rs.close();
            st.close();
            return employeeID;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
