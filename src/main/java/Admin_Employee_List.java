import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class Admin_Employee_List {

    ArrayList<Employee> employeeList = new ArrayList<Employee>();

    public ArrayList<Employee> employeeList() {

        ConnectionDB database = new ConnectionDB();

        try {
            Connection db = database.getConnection();
            Statement st = db.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM employee");
            while (rs.next()) {
                Employee employee = new Employee(rs.getInt("employeeID"), rs.getInt("hotelID"), rs.getString("fullName"), rs.getString("address"), rs.getString("rolePosition"), rs.getInt("ssn_sin_type"), rs.getString("password"));

                employeeList.add(employee);
            }
            rs.close();
            st.close();
            return employeeList;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
