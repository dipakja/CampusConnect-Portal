
package com.tech.entities;

public class Category {
    
   private int cId;
   private String name;
   private String descriptioin;

    public Category(int cId, String name, String descriptioin) {
        this.cId = cId;
        this.name = name;
        this.descriptioin = descriptioin;
    }

    public Category() {
        
    }

    public Category(String name, String descriptioin) {
        this.name = name;
        this.descriptioin = descriptioin;
    }

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescriptioin() {
        return descriptioin;
    }

    public void setDescriptioin(String descriptioin) {
        this.descriptioin = descriptioin;
    }
   
    
    
    
    
   
   
}
