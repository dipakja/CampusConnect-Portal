/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.entities;

import java.security.Timestamp;
import java.sql.*;

/**
 *
 * @author HP
 */
public class User {
    
   private  int id;
   private  String Name;
   private  String Email;
   private  String Password;
   private  String Gender;
   private  String About;
   private  Timestamp dateTime;
   private  String  profile;

    public User(int id, String Name, String Email, String Password, String Gender, String About) {
        this.id = id;
        this.Name = Name;
        this.Email = Email;
        this.Password = Password;
        this.Gender = Gender;
        this.About = About;
      
    }

    public User() {
        
    }

    public User(String Name, String Email, String Password, String Gender, String About) {
        this.Name = Name;
        this.Email = Email;
        this.Password = Password;
        this.Gender = Gender;
        this.About = About;
//        this.dateTime = dateTime;
    }
    
    
//    getter and setter

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getGender() {
        return Gender;
    }

    public void setGender(String Gender) {
        this.Gender = Gender;
    }

    public String getAbout() {
        return About;
    }

    public void setAbout(String About) {
        this.About = About;
    }

    public Timestamp getDateTime() {
        return dateTime;
    }

    public void setDateTime(Timestamp dateTime) {
        this.dateTime = dateTime;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }


    
    
    
    
    
    
    
}
