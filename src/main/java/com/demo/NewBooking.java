package com.demo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class NewBooking {

    public String createBooking(int customerID, int roomID, String start_date, String end_date){
        ConnectionDB database = new ConnectionDB();

        try {
            Connection db = database.getConnection();
            Statement st = db.createStatement();
            ResultSet rs = st.executeQuery("INSERT INTO booking (customerid, roomid, start_date, end_date) VALUES (" + Integer.toString(customerID) + ", " + Integer.toString(roomID) + ", DATE '" + start_date + "', DATE '" + end_date + "')");
            return "New Booking Created";


        } catch (Exception e) {
            return "Error in Creating Booking";
        }

    }

}
