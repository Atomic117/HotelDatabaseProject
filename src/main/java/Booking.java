import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Booking {
    private int bookingID;
    private int customerID;
    private int roomID;
    private Date startDate;
    private Date endDate;

    public Booking(int bookingID, int customerID, int roomID, Date start, Date end){
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
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        return df.format(startDate);
    }
    public String getEndDate(){
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        return df.format(endDate);
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
}
