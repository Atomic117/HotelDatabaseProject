package com.demo;

public class Testing {
    public static void main(String[] args) {
        SignIn signin = new SignIn();
        String username = "Thomas Tran";
        String password = "password";
        boolean isEmployee = false;
        boolean isCustomer = false;
        boolean result = false;
        try {
            isEmployee = signin.employeeLogIn(username, password);
            isCustomer = signin.customerLogIn(username, password);
            System.out.println("processed in database");
        } catch (Exception e){
            e.printStackTrace();
            System.out.println("error with connection");
        }
        System.out.println(isEmployee + " " + isCustomer);

        try {
            result = signin.signUpCustomer("test", "test", 1, "test drive");
            System.out.println(result);
        } catch (Exception e){
            System.out.println("Error signing up");
        }
    }
}
