package com.demo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;

public class Search {

    String startDate;

    String endDate;

    String capacity;

    int chain;

    int category;

    int num_of_rooms;

    double price;

    public ArrayList<Room> search(String startDate, String endDate, String capacity, int chain, int category, int number_of_rooms, double price) {

        ArrayList<Room> filteredRooms = new ArrayList<Room>();

        this.startDate = startDate;
        this.endDate = endDate;
        this.capacity = capacity;
        this.chain = chain;
        this.category = category;
        this.num_of_rooms = number_of_rooms;
        this.price = price;

        ConnectionDB database = new ConnectionDB();

        try {
            Connection db = database.getConnection();
            Statement st = db.createStatement();
            ResultSet rs = st.executeQuery("SELECT hotel_room.\"roomid\", hotel_room.\"hotelid\", price, extension, damages, capacity, hotel_room.\"sea_mountainview\" FROM hotel_room " +
                    "LEFT JOIN hotel ON hotel_room.\"hotelid\" = hotel.\"hotelid\" " +
                    "LEFT JOIN renting ON hotel_room.\"roomid\" = renting.\"roomid\" " +
                    "LEFT JOIN booking ON hotel_room.\"roomid\" = booking.\"roomid\" " +
                    "WHERE ((booking.\"bookingid\" IS NULL AND renting.\"rentingid\" IS NULL " +
                    "OR NOT (booking.start_date <= DATE '" + this.startDate + "' AND DATE '" + this.endDate + "' <= booking.end_date) AND booking.\"bookingid\" IS NOT NULL " +
                    "OR NOT (renting.start_date <= DATE '" + this.startDate + "' AND DATE '" + this.endDate + "' <= renting.end_date) AND renting.\"rentingid\" IS NOT NULL) OR " + this.startDate + " IS NULL OR " + this.endDate + " IS NULL)" +
                    "AND (capacity = '" + this.capacity + "' OR " + this.capacity + " IS NULL)" +
                    "AND (hotel.\"chainid\" = " + Integer.toString(this.chain) + " OR " + Integer.toString(this.chain) + " IS NULL)" +
                    "AND (hotel.\"hotelstar\" = " + Integer.toString(this.category) + " OR " + Integer.toString(this.category) + " IS NULL)" +
                    "AND (room_number >= " + Integer.toString(this.num_of_rooms) + " OR " + Integer.toString(this.num_of_rooms) + " IS NULL)" +
                    "AND (price <= " + Double.toString(this.price) + " OR " + Double.toString(this.price) + " IS NULL)");
            while (rs.next()) {
                Room room = new Room(rs.getInt("roomid"), rs.getInt("hotelid"), rs.getDouble("price"), rs.getString("capacity"), rs.getString("sea_mountain_view"), rs.getBoolean("extension"), rs.getBoolean("damage"));

                filteredRooms.add(room);
            }
            rs.close();
            st.close();
            return filteredRooms;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
