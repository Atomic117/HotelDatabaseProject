package com.demo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class RentingService {
    public String createRenting(int customerID, int roomID, int paymentNum, String start_date, String end_date){
        ConnectionDB database = new ConnectionDB();

        try {
            Connection db = database.getConnection();
            Statement st = db.createStatement();
            ResultSet rs = st.executeQuery("INSERT INTO renting (customerid, roomid, payment, start_date, end_date) VALUES (" + Integer.toString(customerID) + ", " + Integer.toString(roomID) + ", " + Integer.toString(paymentNum) + ", DATE '" + start_date + "', DATE '" + end_date + "')");
            return "New Renting Created";


        } catch (Exception e) {
            return "Error in Creating Renting";
        }

    }

    public String changeBooking_to_Renting(int bookingID, int paymentNum){
        ConnectionDB database = new ConnectionDB();

        try {
            Connection db = database.getConnection();
            Statement st = db.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM booking where bookingid = " + Integer.toString(bookingID));

            Booking bookedRoom = new Booking(rs.getInt("bookingid"), rs.getInt("customerid"), rs.getInt("roomid"), rs.getDate("startdate"), rs.getDate("enddate"));

            rs = st.executeQuery("INSERT INTO renting (customerid, roomid, payment, start_date, end_date) VALUES (" + Integer.toString(bookedRoom.getCustomerID()) + ", " + Integer.toString(bookedRoom.getRoomID()) + ", " + Integer.toString(paymentNum) + ", DATE '" + bookedRoom.getStartDate() + "', DATE '" + bookedRoom.getEndDate() + "')");
            st.executeQuery("DELETE FROM booking WHERE bookingid=" + Integer.toString(bookingID));
            return "Booking Changed to Renting";

        } catch (Exception e) {
            return "Error in Switching Booking to Renting";
        }
    }

}
