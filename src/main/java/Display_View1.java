import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class Display_View1 {
    ArrayList<View1> view1 = new ArrayList<View1>();

    public ArrayList<View1> displayView1() {

        ConnectionDB database = new ConnectionDB();

        try {
            Connection db = database.getConnection();
            Statement st = db.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM view_1_available_rooms_hotel");
            while (rs.next()) {
                View1 view = new View1(rs.getInt("hotelID"), rs.getInt("available_rooms"));

                view1.add(view);
            }
            rs.close();
            st.close();
            return view1;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
