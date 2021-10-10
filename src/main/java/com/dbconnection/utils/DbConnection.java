/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dbconnection.utils;

import java.sql.*;
import org.apache.commons.dbcp.BasicDataSource;
//import javax.sql.DataSource; 

public class DbConnection {

    
    private static final BasicDataSource dataSource = new BasicDataSource();

   
    static {
 
        dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");

        dataSource.setUrl("jdbc:mysql://localhost:3306/dbproyecto?useUnicode=true&useJDBCCompliantTimeZoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC");

        dataSource.setUsername("root");

        dataSource.setPassword("root");

    }


    public static Connection getConnection() throws SQLException {
        return dataSource.getConnection();
    }


    public static void closeConnection() throws SQLException {
        dataSource.close();
    }
}
