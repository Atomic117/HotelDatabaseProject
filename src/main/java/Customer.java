public class Customer {
    private int customerID;
    private String fullName;
    private String address;
    private String registrationDate;
    private int typeID;

    public Customer(int customerID, String fullName, String address, String registrationDate, int typeID){
        this.customerID = customerID;
        this.fullName = fullName;
        this.address = address;
        this.registrationDate = registrationDate;
        this.typeID = typeID;
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
}
