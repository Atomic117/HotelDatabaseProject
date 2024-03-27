package com.demo;

public class View2 {

    private int hotelID;
    private int total_capacity;

    public View2(int hotelID, int total_capacity) {
        this.hotelID = hotelID;
        this.total_capacity = total_capacity;
    }

    public int getHotelID() {
        return hotelID;
    }

    public int getTotal_capacity() {
        return total_capacity;
    }

    public void setHotelID(int id) {
        hotelID = id;
    }

    public void setTotal_capacity(int capacity) {
        total_capacity = capacity;
    }
}
