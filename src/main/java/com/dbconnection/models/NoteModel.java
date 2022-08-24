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
    private UserModel idUser;
    private HashtagModel idHashtag;
    
    public NoteModel(){
    }
    
     public NoteModel(int id, String description, String date, HashtagModel Hashtag){
        this.idNote=id;
        this.descriptionN = description;
        this.dateN = date;
        this.idHashtag = Hashtag;
    }
    
    public NoteModel(String description, UserModel User, HashtagModel Hashtag){
        this.descriptionN = description;
        this.idUser = User;
        this.idHashtag = Hashtag;
    }
    
    public NoteModel(String description, String date, HashtagModel Hashtag){
        this.descriptionN = description;
        this.dateN = date;
        this.idHashtag = Hashtag;
    }
    
    public NoteModel(UserModel User){
        this.idUser = User;
    }
    
    public NoteModel(int id){
        this.idNote=id;
    }

    public NoteModel(int id, String description, HashtagModel Hashtag) {
        this.idNote=id;
        this.descriptionN = description;
        this.idHashtag = Hashtag;
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
    
    public UserModel getIdUser() {
        return idUser;
    }

    public HashtagModel getIdHashtag() {
        return idHashtag;
    }

    public void setIdHashtag(HashtagModel idHashtag) {
        this.idHashtag = idHashtag;
    }
    
    
}
