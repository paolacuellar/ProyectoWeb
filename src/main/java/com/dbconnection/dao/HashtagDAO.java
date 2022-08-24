/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dbconnection.dao;

import com.dbconnection.models.HashtagModel;
import com.dbconnection.utils.DbConnection;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HashtagDAO {
    
    public static List<HashtagModel> getHashtags() throws Exception{
        List<HashtagModel> hashtags = new ArrayList<>();
        Connection con = null;
        CallableStatement statement = null;

        try {
            con = DbConnection.getConnection();
            statement = con.prepareCall("CALL GetHashtags()");
            ResultSet resultSet = statement.executeQuery();
            // Si el resultSet tiene resultados lo recorremos
            while (resultSet.next()) {
                // Obtenemos el valor del result set en base al nombre de la
                // columna
                int id = resultSet.getInt("idHashtag");
                String name = resultSet.getString("nameH");
                int order = resultSet.getInt("orderH");
                // Agregamos el usuario a la lista
                hashtags.add(new HashtagModel(id, name, order));
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally{
            statement.close();
            con.close();
        }
        return hashtags;
    }
    
        public static HashtagModel getHashtag(int id) throws Exception{
        Connection con = null;
        CallableStatement statement = null;

        try {
            con = DbConnection.getConnection();
            statement = con.prepareCall("CALL GetHashtag(?)");
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            // Si el resultSet tiene resultados lo recorremos
            while (resultSet.next()) {
                // Obtenemos el valor del result set en base al nombre de la
                // columna
                int idHashtag = resultSet.getInt("idHashtag");
                String name = resultSet.getString("nameH");
                int order = resultSet.getInt("orderH");
                // Agregamos el usuario a la lista
                return new HashtagModel(idHashtag, name, order);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally{
            statement.close();
            con.close();
        }
        return null;
    }
}
