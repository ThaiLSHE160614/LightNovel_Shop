/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class User {
    private String fname, lname, email, password, address, phone;
    private boolean role_id;

    public User() {
    }

    public User(String fname, String lname, String email, String password, String address, String phone, boolean role_id) {
        this.fname = fname;
        this.lname = lname;
        this.email = email;
        this.password = password;
        this.address = address;
        this.phone = phone;
        this.role_id = role_id;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public boolean isRole_id() {
        return role_id;
    }

    public void setRole_id(boolean role_id) {
        this.role_id = role_id;
    }
    
}
