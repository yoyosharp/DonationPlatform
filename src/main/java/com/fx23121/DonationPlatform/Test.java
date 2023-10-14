package com.fx23121.DonationPlatform;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Test {

        public static void main(String[] args) {
            Connection connection = null;

            try {
                // Database connection parameters
                String url = "jdbc:mysql://localhost:3306/prj321_asm01";
                String username = "datndfx23121";
                String password = "12345678";

                // Load the MySQL JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish the database connection
                connection = DriverManager.getConnection(url, username, password);

                // Check if the connection is successful
                if (connection != null) {
                    System.out.println("Connection to the database is successful.");
                } else {
                    System.out.println("Failed to connect to the database.");
                }
            } catch (ClassNotFoundException e) {
                System.err.println("JDBC driver not found: " + e.getMessage());
            } catch (SQLException e) {
                System.err.println("Database connection error: " + e.getMessage());
            } finally {
                if (connection != null) {
                    try {
                        connection.close();
                    } catch (SQLException e) {
                        System.err.println("Failed to close the database connection: " + e.getMessage());
                    }
                }
            }
        }
    }

