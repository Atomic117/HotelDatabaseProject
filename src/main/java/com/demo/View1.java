package com.demo;

public class View1 {
    private int hotelID;
    private int available_rooms;

    public View1(int hotelID, int available_rooms) {
        this.hotelID = hotelID;
        this.available_rooms = available_rooms;
    }

    public int getHotelID() {
        return hotelID;
    }

    public int getAvailable_rooms() {
        return available_rooms;
    }

    public void setHotelID(int id) {
        hotelID = id;
    }

    public void setAvailable_rooms(int rooms) {
        available_rooms = rooms;
    }

}


