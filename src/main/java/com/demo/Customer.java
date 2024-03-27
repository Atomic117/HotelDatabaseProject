package com.demo;

public class Customer {
    private int customerID;
    private String fullName;
    private String address;
    private String registrationDate;
    private int typeID;
    private String password;

    public Customer(int customerID, String fullName, String address, String registrationDate, int typeID, String password){
        this.customerID = customerID;
        this.fullName = fullName;
        this.address = address;
        this.registrationDate = registrationDate;
        this.typeID = typeID;
        this.password = password;
    }

    public int getCustomerID(){
        return customerID;
    }

    public String fullName(){
        return fullName;
    }

    public String getAddress(){
        return address;
    }

    public String getRegistrationDate(){
        return registrationDate;
    }

    public int getTypeID() {
        return typeID;
    }

    public String getPassword() { return password; }
    public void setCustomerID(int id){
        customerID = id;
    }

    public void setName(String name){
        fullName = name;
    }

    public void setAddress(String address){
        this.address = address;
    }

    public void setDate(String date){
        registrationDate = date;
    }

    public void setTypeID(int id){
        typeID = id;
    }

    public void setPassword(String pass) { password = pass; }

    @Override
    public String toString() {
        return "<ul>"
                + "<li>id= " + customerID + "</li>"
                + "<li>fullname= " + fullName + "</li>"
                + "<li>address= " + address + "</li>"
                + "<li>date= " + registrationDate + "</li>"
                + "<li>type= " + typeID + "</li>";
    }
}