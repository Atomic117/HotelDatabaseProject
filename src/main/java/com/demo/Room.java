package com.demo;

public class Room {
    private int roomID;
    private int hotelID;
    private double price;
    private String capacity;
    private String sea_mountainView;
    private boolean extension;
    private boolean damage;

    public Room(int roomID, int hotelID, double price, String capacity, String sea_mountainView, boolean extension, boolean damage){
        this.roomID = roomID;
        this.hotelID = hotelID;
        this.price = price;
        this.capacity = capacity;
        this.sea_mountainView = sea_mountainView;
        this.extension = extension;
        this.damage = damage;
    }

    public int getRoomID(){
        return roomID;
    }
    public int getHotelID(){
        return hotelID;
    }
    public double getPrice(){
        return price;
    }
    public String getCapacity(){
        return capacity;
    }
    public String getSea_mountainView(){
        return sea_mountainView;
    }
    public boolean getExtension(){
        return extension;
    }
    public boolean getDamage(){
        return damage;
    }
    public void setRoomID(int roomID){
        this.roomID = roomID;
    }
    public void setHotelID(int hotelID){
        this.hotelID = hotelID;
    }
    public void setPrice(double price){
        this.price = price;
    }
    public void setSea_mountainView(String view){
        sea_mountainView = view;
    }
    public void setExtension(boolean extension){
        this.extension = extension;
    }
    public void setDamage(boolean damage){
        this.damage = damage;
    }

    @Override
    public String toString() {

        return "<ul>"
                + "<li>roomid= " + roomID + "</li>"
                + "<li>hotelid= " + hotelID + "</li>"
                + "<li>price= " + price + "</li>"
                + "<li>capacity= " + capacity + "</li>"
                + "<li>view= " + sea_mountainView + "</li>"
                + "<li>extension= " + extension + "</li>"
                + "<li>damage= " + damage + "</li>";
    }
}
