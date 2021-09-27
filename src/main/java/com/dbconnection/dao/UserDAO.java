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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author magoc
 */
public class UserDAO {

    // Query de creacion de Tabla
    /**
     * CREATE TABLE `user` ( `idUser` INT NOT NULL AUTO_INCREMENT, `nameUser`
     * VARCHAR(45) NULL, `password` VARCHAR(45) NULL, `urlImage` VARCHAR(255)
     * NULL, PRIMARY KEY (`idUser`));
     *
     */
    /**
     * Inserta un usuario en la base de datos
     *
     * @param user
     * @return
     */

     //TODO: Es ideal incluir el "throws Exception" ?
    public static int insertUser(UserModel user) throws Exception {
    	Connection con = null;
    	CallableStatement statement = null;

        int rowsAffectted = 0;
        try {
            con = DbConnection.getConnection();
            // En el proyecto solo podran hacer uso de Store Procedures
            // No llamadas directas como esta
            // Esta linea prepara la llamada a la base de datos para insertar
            // Cada ? significa un valor a ser remplazado
            //statement = con.prepareCall("INSERT INTO user (nameUser, dobUser, emailUser, passUser, nickUser, imageUser) VALUES (?,?,?,?,?,?)");
            statement = con.prepareCall("call InsertUser(?,?,?,?,?,?)");
            // Remplazamos el primer parametro por el nombre
            statement.setString(1, user.getUserName());
            statement.setString(2, user.getUserdob());
            statement.setString(3, user.getUserEmail());
            statement.setString(4, user.getPassword());
            statement.setString(5, user.getNickname());
            // El ultimo por la url de la imagen
            statement.setString(6, user.getUrlImage());
            // Ejecuta el Statement y retorna cuantos registros
            // fueron actualizados
            
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
    	Connection con = null;
    	CallableStatement statement = null;

        //boolean rowsAffectted = false;
        try{
            con = DbConnection.getConnection();

            statement = con.prepareCall("call LogInUser(?,?)");
            statement.setString(1, user.getNickname());
            statement.setString(2, user.getPassword());
            ResultSet resultSet = statement.executeQuery();
            // Si el resultSet tiene resultados lo recorremos
            while (resultSet.next()) {
                // Obtenemos el valor del result set en base al nombre de la
                // columna
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
        } finally {
        	statement.close();
            con.close();
        }
       
        return null;
    }

    
    public static List<UserModel> getUsers() throws Exception  {
        List<UserModel> users = new ArrayList<>();
        Connection con = null;
        CallableStatement statement = null;

        try {
            con = DbConnection.getConnection();
            statement = con.prepareCall("SELECT * FROM user");
            ResultSet resultSet = statement.executeQuery();
            // Si el resultSet tiene resultados lo recorremos
            while (resultSet.next()) {
                // Obtenemos el valor del result set en base al nombre de la
                // columna
                String name = resultSet.getString("nameUser");
                String dob = resultSet.getString("dobUser");
                String email = resultSet.getString("emailUser");
                String password = resultSet.getString("passUser");
                String nickname = resultSet.getString("nickUser");
                String urlImage = resultSet.getString("imageUser");
                // Agregamos el usuario a la lista
                users.add(new UserModel(name, dob, email, password, nickname,urlImage));
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            statement.close();
            con.close();
        }

        return users;
    }
}
