package com.fx23121.DonationPlatform.Demo;

import java.sql.Connection;
import java.sql.DriverManager;

public class Main {

    public static void main(String[] args) {

        //test database connection
        String user = "datndfx23121";
        String password = "12345678";

        String jdbcUrl = "jdbc:mysql://localhost:3306/prj321_asm01?useSSL=false&severTimeZone=UTC";
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

        //test database CRUD
        System.out.println(new testDAO().getUser(1));
    }
}
