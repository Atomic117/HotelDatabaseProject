public class Booking {
    private int bookingID;
    private int customerID;
    private int roomID;
    private String startDate;
    private String endDate;

    public Booking(int bookingID, int customerID, int roomID, String start, String end){
        this.bookingID = bookingID;
        this.customerID = customerID;
        this.roomID = roomID;
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
    public String getStartDate(){
        return startDate;
    }
    public String getEndDate(){
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
    public void setStartDate(String date){
        startDate = date;
    }
    public void setEndDate(String date){
        endDate = date;
    }
}
