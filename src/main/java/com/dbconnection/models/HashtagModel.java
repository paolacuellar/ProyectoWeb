/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dbconnection.models;


public class HashtagModel {
    private int id;
    private String name;
    private int order;
    
    public HashtagModel(){
    }

    public HashtagModel(int id) {
        this.id = id;
    }
    
    public HashtagModel(int id, String name, int order){
        this.id=id;
        this.name=name;
        this.order=order;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getOrder() {
        return order;
    }

    public void setOrder(int order) {
        this.order = order;
    }
    
    
}
