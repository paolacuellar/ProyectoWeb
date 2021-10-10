/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dbconnection.dao;

import com.dbconnection.models.UserModel;
import com.dbconnection.utils.DbConnection;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;


public class UserDAO {

  
    public static int insertUser(UserModel user) throws Exception {
    	Connection con = null;
    	CallableStatement statement = null;

        int rowsAffectted = 0;
        try {
            con = DbConnection.getConnection();
            
            statement = con.prepareCall("call InsertUser(?,?,?,?,?,?)");
            
            statement.setString(1, user.getUserName());
            statement.setString(2, user.getUserdob());
            statement.setString(3, user.getUserEmail());
            statement.setString(4, user.getPassword());
            statement.setString(5, user.getNickname());
            statement.setString(6, user.getUrlImage());
            
            
            rowsAffectted = statement.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            rowsAffectted = 0;
        } finally {
        	statement.close();
            con.close();
        }
        return rowsAffectted;
    }
    
    public static UserModel logInUser(UserModel user) throws Exception {
    	//Connection con = null;
    	//CallableStatement statement = null;

        //boolean rowsAffectted = false;
        try{
            Connection con = DbConnection.getConnection();

            
            CallableStatement statement = con.prepareCall("call LogInUser(?,?)");
            statement.setString(1, user.getNickname());
            statement.setString(2, user.getPassword());
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {

                int id=resultSet.getInt("ID");
                String userName = resultSet.getString("Nombre");
                String userdob = resultSet.getString("Fecha_de_nacimiento");
                String userEmail = resultSet.getString("Correo");
                String password = resultSet.getString("Contraseña");
                String nickname = resultSet.getString("Usuario");
                String urlImage = resultSet.getString("Foto");
                
                return new UserModel(id,userName,userdob,userEmail,password,nickname,urlImage);
            }
            
            //rowsAffectted = true;
        }catch (SQLException ex) {
            System.out.println(ex.getMessage());
            //rowsAffectted = false;
        }
       
        return null;
    }

}
