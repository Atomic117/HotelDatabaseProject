package com.demo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class Display_View2 {
    ArrayList<View2> view2 = new ArrayList<View2>();

    public ArrayList<View2> displayView2() {

        ConnectionDB database = new ConnectionDB();

        try {
            Connection db = database.getConnection();
            Statement st = db.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM view_2_aggregated_capacity_hotel");
            while (rs.next()) {
                View2 view = new View2(rs.getInt("hotelid"), rs.getInt("total_capacity"));

                view2.add(view);
            }
            rs.close();
            st.close();
            return view2;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}

