package com.fx23121.DonationPlatform;

import java.sql.Connection;
import java.sql.DriverManager;

public class Main {


    //test database connection
    public static void main(String[] args) {
        String user = "springstudent";
        String password = "springstudent";

        String jdbcUrl = "jdbc:mysql://localhost:3306/web_customer_tracker?useSSL=false&severTimeZone=UTC";
        String driver = "com.mysql.jdbc.Driver";

        try{
            System.out.println("Connecting to database" + jdbcUrl);

            Class.forName(driver);
            Connection myConn = DriverManager.getConnection(jdbcUrl, user, password);
            System.out.println("Connect successfully!");
            myConn.close();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}