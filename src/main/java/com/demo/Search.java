package com.demo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;
import java.sql.PreparedStatement;

public class Search {

        public ArrayList<Room> search(int chainId, Date bookingDate, Date startDate, int hotelStar, String capacity, double price, int totalRooms) {

            ArrayList<Room> filteredRooms = new ArrayList<>();

            ConnectionDB database = new ConnectionDB();

            try {
                Connection db = database.getConnection();
                String sql = "SELECT hr.roomid, hr.hotelid, hr.price, hr.extension, hr.damages, hr.capacity, hr.sea_mountainview " +
                        "FROM hotel_room hr " +
                        "LEFT JOIN hotel h ON hr.hotelid = h.hotelid " +
                        "WHERE hr.roomid NOT IN (SELECT roomid FROM booking WHERE start_date <= ? AND end_date >= ?) " +
                        "AND hr.roomid NOT IN (SELECT roomid FROM renting WHERE end_date >= ?) ";

                if (chainId != 0) {
                    sql += "AND h.chainid = ? ";
                }

                if (hotelStar != 0) {
                    sql += "AND h.hotelstar = ? ";
                }

                if (capacity != null) {
                    sql += "AND hr.capacity = ? ";
                }

                if (price != 0) {
                    sql += "AND hr.price <= ? ";
                }

                if (totalRooms != 0) {
                    sql += "AND room_number >= ? ";
                }

                // Set parameters for prepared statement
                PreparedStatement ps = db.prepareStatement(sql);
                ps.setDate(1, new java.sql.Date(bookingDate.getTime()));
                ps.setDate(2, new java.sql.Date(bookingDate.getTime()));
                ps.setDate(3, new java.sql.Date(startDate.getTime()));

                int parameterIndex = 4; // Index for the first parameter after dates

                if (chainId != 0) {
                    ps.setInt(parameterIndex++, chainId);
                }

                if (hotelStar != 0) {
                    ps.setInt(parameterIndex++, hotelStar);
                }

                if (capacity != null) {
                    ps.setString(parameterIndex++, capacity);
                }

                if (price != 0) {
                    ps.setDouble(parameterIndex++, price);
                }

                if (totalRooms != 0) {
                    ps.setInt(parameterIndex, totalRooms);
                }

                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    Room room = new Room(rs.getInt("roomid"), rs.getInt("hotelid"), rs.getDouble("price"), rs.getString("capacity"), rs.getString("sea_mountainview"), rs.getBoolean("extension"), rs.getBoolean("damages"));
                    filteredRooms.add(room);
                }

                rs.close();
                ps.close();
                return filteredRooms;
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
    }