/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dbconnection.models;

/**
 *
 * @author magoc
 */
public class UserModel {

    private int id;
    private String userName;
    private String userdob;
    private String userEmail;
    private String nickname;
    private String password;
    private String urlImage;

    public UserModel() {
    }

    public UserModel(String nickname, String password) {
        this.nickname = nickname;
        this.password = password;
    }
    
     public UserModel(int id, String userName, String userdob, String userEmail,String nickname, String password, String urlImage) {
        this.id=id;
        this.userName = userName;
        this.userdob = userdob;
        this.userEmail = userEmail;
        this.nickname = nickname;
        this.password = password;
        this.urlImage = urlImage;
    }

    public UserModel(String userName, String userdob, String userEmail,String nickname, String password, String urlImage) {
        this.userName = userName;
        this.userdob = userdob;
        this.userEmail = userEmail;
        this.nickname = nickname;
        this.password = password;
        this.urlImage = urlImage;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
    
    public String getUserdob() {
        return userdob;
    }

    public void setUserdob(String userdob) {
        this.userdob = userdob;
    }
    
    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }
    
    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getUrlImage() {
        return urlImage;
    }

    public void setUrlImage(String urlImage) {
        this.urlImage = urlImage;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}
