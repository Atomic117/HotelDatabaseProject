package com.demo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class Admin_Room_List {
    ArrayList<Room> roomList = new ArrayList<Room>();

    public ArrayList<Room> roomList() {

        ConnectionDB database = new ConnectionDB();

        try {
            Connection db = database.getConnection();
            Statement st = db.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM hotel_room");
            while (rs.next()) {
                Room room = new Room(rs.getInt("roomID"), rs.getInt("hotelID"), rs.getDouble("price"), rs.getString("capacity"), rs.getString("sea_mountain_view"), rs.getBoolean("extension"), rs.getBoolean("damage"));

                roomList.add(room);
            }
            rs.close();
            st.close();
            return roomList;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
