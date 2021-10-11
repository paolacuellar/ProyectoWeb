/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dbconnection.dao;

import com.dbconnection.models.NoteModel;
import com.dbconnection.utils.DbConnection;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class NoteDAO {
    
    public static List<NoteModel> getNotes(NoteModel note) throws Exception  {
        List<NoteModel> notes = new ArrayList<>();
        Connection con = null;
        CallableStatement statement = null;

        try {
            con = DbConnection.getConnection();
            statement = con.prepareCall("CALL ActiveNote(?)");
            statement.setInt(1, note.getIdUser());
            ResultSet resultSet = statement.executeQuery();
            // Si el resultSet tiene resultados lo recorremos
            while (resultSet.next()) {
                // Obtenemos el valor del result set en base al nombre de la
                // columna
                int id = resultSet.getInt("idNote");
                String description = resultSet.getString("descriptionN");
                String date = resultSet.getString("dateN");
                // Agregamos el usuario a la lista
                notes.add(new NoteModel(id, description, date));
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            statement.close();
            con.close();
        }

        return notes;
    }
    
    
    public static int insertNote(NoteModel note) throws Exception {
    	Connection con = null;
    	CallableStatement statement = null;

        int rowsAffectted = 0;
        try {
            con = DbConnection.getConnection();
            
            statement = con.prepareCall("CALL InsertNote(?, ?)");
            
            statement.setString(1, note.getDescription());
            statement.setInt(2, note.getIdUser());
            
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
    
    public static NoteModel updateNote(NoteModel note) throws Exception {
    	Connection con = null;
    	CallableStatement statement = null;


        try {
            con = DbConnection.getConnection();
            
            statement = con.prepareCall("CALL UpdateNote(?, ?)");
            
            statement.setInt(1, note.getId());
            statement.setString(2, note.getDescription());
            
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                
                String description = resultSet.getString("descriptionN");
                String date = resultSet.getString("dateN");
                
                return new NoteModel(description, date);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            
        } finally {
        	statement.close();
            con.close();
        }
        return null;
    }
    
    public static NoteModel deleteNote(NoteModel note) throws Exception {
    	Connection con = null;
    	CallableStatement statement = null;

        //int rowsAffectted = 0;
        try {
            con = DbConnection.getConnection();
            
            statement = con.prepareCall("CALL DeleteNote(?)");
            statement.setInt(1, note.getId());
            
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                
                int status = resultSet.getInt("statusN");
                
                return new NoteModel(status);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
        	statement.close();
            con.close();
        }
        return null;
    }
}
