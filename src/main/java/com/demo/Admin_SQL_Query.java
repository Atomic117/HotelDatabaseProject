package com.demo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class Admin_SQL_Query {


    public String SQLQuery(String query) {

        ConnectionDB database = new ConnectionDB();

        try {
            Connection db = database.getConnection();
            Statement st = db.createStatement();
            ResultSet rs = st.executeQuery(query);

            rs.close();
            st.close();
            return "Query Was Successful, the Database was altered";

        } catch (Exception e) {
            return "Query Was Unsuccessful";
        }
    }
}
