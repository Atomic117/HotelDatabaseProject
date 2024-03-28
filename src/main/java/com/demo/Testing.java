package com.demo;

import java.util.ArrayList;
import java.util.Date;

public class Testing {
    public static void main(String[] args) {

        BookingService service = new BookingService();
        System.out.println(service.getCustomerBookings(3).size());

    }
}
