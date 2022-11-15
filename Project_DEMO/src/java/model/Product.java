/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;
import java.util.List;

/**
 *
 * @author admin
 */
public class Product {
//[id] int identity(1,1) primary key,
//[title] nvarchar(300),
//[price] float ,
//[discount] float ,
//[author] nvarchar(20),
//[public_year] int,
//[publisher] nvarchar(50),
//[form] nvarchar(20),
//[size] varchar(20),
//[discribe] nvarchar(1000),
//[quantity] int
    private int id;
    private String title;
    private int price, discount;
    private String author;
    private String public_year;
    private String publisher, form, size, discribe;
    private int quantity;
    private String image;
    private List<Category> category;

    public Product() {
    }

    public Product(int id, String title, int price, int discount, String author, String public_year, String publisher, String form, String size, String discribe, int quantity, String image) {
        this.id = id;
        this.title = title;
        this.price = price;
        this.discount = discount;
        this.author = author;
        this.public_year = public_year;
        this.publisher = publisher;
        this.form = form;
        this.size = size;
        this.discribe = discribe;
        this.quantity = quantity;
        this.image = image;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublic_year() {
        return public_year;
    }

    public void setPublic_year(String public_year) {
        this.public_year = public_year;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getForm() {
        return form;
    }

    public void setForm(String form) {
        this.form = form;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getDiscribe() {
        return discribe;
    }

    public void setDiscribe(String discribe) {
        this.discribe = discribe;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public List<Category> getCategory() {
        return category;
    }

    public void setCategory(List<Category> category) {
        this.category = category;
    }
    
}