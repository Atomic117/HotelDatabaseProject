package com.demo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class ViewService {

    //View1
    public ArrayList<View1> displayView1() {

        ArrayList<View1> view1 = new ArrayList<View1>();
        ConnectionDB database = new ConnectionDB();

        try {
            Connection db = database.getConnection();
            Statement st = db.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM view_1_available_rooms_hotel");
            while (rs.next()) {
                View1 view = new View1(rs.getInt("hotelid"), rs.getInt("available_rooms"));

                view1.add(view);
            }
            rs.close();
            st.close();
            return view1;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    //View 2

    public ArrayList<View2> displayView2() {
        ArrayList<View2> view2 = new ArrayList<View2>();

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
