package com.demo;

import java.util.ArrayList;
import java.util.Date;

public class Testing {
    public static void main(String[] args) {

        RentingService service = new RentingService();
        System.out.println(service.getRentingByRentingID(4));
        System.out.println(service.getRentingByRentingID(4).getBookingID());

    }
}
