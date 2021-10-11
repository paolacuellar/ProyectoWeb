/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dbconnection.models;


public class NoteModel {
    
    private int idNote;
    private String descriptionN;
    private String dateN;
    private int statusN;
    private int idUser;
    
    public NoteModel(){
    }
    
     public NoteModel(int id, String description, String date){
        this.idNote=id;
        this.descriptionN = description;
        this.dateN = date;
    }
    
    public NoteModel(String description, String date){
        this.descriptionN = description;
        this.dateN = date;
    }
    
    public NoteModel(int status){
        this.statusN = status;
    }
    
    public int getId() {
        return idNote;
    }
    
    public void setId(int id) {
        this.idNote=id;
    }
    
    public String getDescription() {
        return descriptionN;
    }
    
    public void setDescription(String description) {
        this.descriptionN = description;
    }
    
    public String getDate() {
        return dateN;
    }
    
    public void setDate(String date) {
        this.dateN = date;
    }
    
    public int getIdUser() {
        return idUser;
    }
    
}
