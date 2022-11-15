/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class Genre {
//    [id] int identity(1,1) primary key,
//[product_id] int foreign key references [Product]([id]),
//[category_id] int foreign key references [Category]([id])
    private Product product;
    private Category category;

    public Genre() {
    }

    public Genre(Product product, Category category) {
        this.product = product;
        this.category = category;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
    
}
