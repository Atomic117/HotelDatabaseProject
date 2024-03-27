package com.demo;

import java.util.Date;

public class Renting {
    private int bookingID;
    private int customerID;
    private int roomID;
    private int payment;
    private Date startDate;
    private Date endDate;

    public Renting(int bookingID, int customerID, int roomID, int payment, Date start, Date end){
        this.bookingID = bookingID;
        this.customerID = customerID;
        this.roomID = roomID;
        this.payment = payment;
        startDate = start;
        endDate = end;
    }
    public int getBookingID(){
        return bookingID;
    }
    public int getCustomerID(){
        return customerID;
    }
    public int getRoomID(){
        return roomID;
    }
    public int getPayment(){
        return payment;
    }
    public Date getStartDate(){
        return startDate;
    }
    public Date getEndDate(){
        return endDate;
    }
    public void setBookingID(int id){
        bookingID = id;
    }
    public void setCustomerID(int id){
        customerID = id;
    }
    public void setRoomID(int id){
        roomID = id;
    }
    public void setStartDate(Date date){
        startDate = date;
    }
    public void setEndDate(Date date){
        endDate = date;
    }
    public void setPayment(int num){
        payment = num;
    }

    @Override
    public String toString() {

        return "<ul>"
                + "<li>rentingid= " + bookingID + "</li>"
                + "<li>customerid= " + customerID + "</li>"
                + "<li>roomid= " + roomID + "</li>"
                + "<li>payment= " + payment + "</li>"
                + "<li>startdate= " + startDate + "</li>"
                + "<li>enddate= " + endDate + "</li>";
    }
}
