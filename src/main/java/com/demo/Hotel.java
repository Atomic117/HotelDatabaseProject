package com.demo;

public class Hotel {
    private int hotelID;
    private int chainID;
    private String manager;
    private int room_number;
    private String hotelAddress;
    private int hotelStar;
    private String email;
    private String phone;

    public Hotel(int hotelID, int chainID, String manager, int room_number, String address, int star, String email, String phone){
        this.hotelID = hotelID;
        this.chainID = chainID;
        this.manager = manager;
        this.room_number = room_number;
        hotelAddress = address;
        hotelStar = star;
        this.email = email;
        this.phone = phone;
    }

    public int getHotelID(){
        return hotelID;
    }
    public int getChainID(){
        return chainID;
    }
    public String getManagerName(){
        return manager;
    }
    public int getRoomNumber(){
        return room_number;
    }
    public String getAddress(){
        return hotelAddress;
    }
    public int getStar(){
        return hotelStar;
    }
    public String getEmail(){
        return email;
    }
    public String getPhone(){
        return phone;
    }
    public void setHotelID(int id){
        hotelID = id;
    }
    public void setChainIDI(int id){
        chainID = id;
    }
    public void setManagerNum(String name){
        manager = name;
    }
    public void setRoomNum(int num){
        room_number = num;
    }
    public void setAddress(String address){
        hotelAddress = address;
    }
    public void setStar(int star){
        hotelStar = star;
    }
    public void setEmail(String email){
        this.email = email;
    }
    public void setPhone(String phone){
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "<ul>"
                + "<li>hotelid= " + hotelID + "</li>"
                + "<li>chainid= " + chainID + "</li>"
                + "<li>manager= " + manager + "</li>"
                + "<li>roomnumber= " + room_number + "</li>"
                + "<li>address= " + hotelAddress + "</li>"
                + "<li>star= " + hotelStar + "</li>"
                + "<li>email= " + email + "</li>"
                + "<li>phone= " + phone + "</li>";
    }
}
