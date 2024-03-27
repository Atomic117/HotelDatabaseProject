package com.demo;

import java.util.ArrayList;
import java.util.Date;

public class Testing {
    public static void main(String[] args) {

        int chainId = 1;
        Date bookingDate = new Date();
        Date startDate = new Date();
        int hotelStar = 4;
        String capacity = "Double";
        double price = 500;
        int totalRooms = 3;

        Search help = new Search();

        ArrayList<Room> result = help.search(chainId, bookingDate, startDate, hotelStar, capacity, price, totalRooms);

        System.out.println("Search Result:");
        System.out.println(result.get(0).getRoomID());
        System.out.println(result.get(1).getRoomID());
        System.out.println(result.size());
    }
}
