public class Employee {

    private int employeeID;
    private int hotelID;
    private String fullName;
    private String address;
    private String rolePosition;
    private int SSN;
    public Employee(int employeeID, int hotelID, String fullName, String address, String rolePosition, int SSN){
        this.employeeID = employeeID;
        this.hotelID = hotelID;
        this.fullName = fullName;
        this.address = address;
        this.rolePosition = rolePosition;
        this.SSN = SSN;
    }

    public int getEmployeeID(){
        return employeeID;
    }
    public int getHotelID(){
        return hotelID;
    }
    public String fullName(){
        return fullName;
    }
    public String address(){
        return address;
    }
    public String rolePosition(){
        return rolePosition;
    }
    public int getSSN(){
        return SSN;
    }
    public void setEmployeeID(int ID){
        employeeID = ID;
    }
    public void setHotelID(int ID){
        hotelID = ID;
    }
    public void setName(String name){
        fullName = name;
    }
    public void setAddress(String address){
        this.address = address;
    }
    public void setPosition(String position){
        rolePosition = position;
    }
    public void setSSN(int type){
        SSN = type;
    }
}
