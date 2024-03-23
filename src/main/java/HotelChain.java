public class HotelChain {
    private int ID;
    private int hotelNumber;
    private String email;
    private String phone;

    public HotelChain(int ID,int hotelNumber, String email, String phone){
        this.ID = ID;
        this.hotelNumber = hotelNumber;
        this.email = email;
        this.phone = phone;
    }
    public int getID(){
        return ID;
    }
    public int getHotelNumber(){
        return hotelNumber;
    }
    public String getEmail(){
        return email;
    }
    public String getPhone(){
        return phone;
    }
    public void setID(int id){
        ID = id;
    }
    public void setHotelNumber(int num){
        hotelNumber = num;
    }
    public void setEmail(String email){
        this.email = email;
    }
    public void setPhone(String phone){
        this.phone = phone;
    }
}
