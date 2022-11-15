/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author admin
 */
public class CategoryDAO extends DBContext{
    public List<Category> getAll(){
        List<Category> list= new ArrayList<>();
        String sql="select * from [Category]";
        try{
            PreparedStatement st= connection.prepareStatement(sql);
            ResultSet rs= st.executeQuery();
            while(rs.next()){
                Category c= new Category(rs.getInt("id"),
                                         rs.getString("name")
                );
            list.add(c);
            }    
        }catch(SQLException e){
            System.out.println(e);
        }
        return list;
    }
    //tim ban ghi bang id
    public Category getCategoryById(int id){
        String sql="select * from [Category] where id=?";
        try{
            PreparedStatement st= connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs= st.executeQuery();
            if(rs.next()){
                Category c= new Category(rs.getInt("id"),
                                         rs.getString("name"));
                return c;
            }    
        }catch(SQLException e){
            System.out.println(e);
        }
        return null;
    }
    
    // chen them ban ghi moi
    public void insert(Category c){
        String sql="insert into [Category]([name]) values (?)";
        try{
            PreparedStatement st= connection.prepareStatement(sql);
            st.setString(1, c.getName());
            st.executeUpdate();
        }catch(SQLException e){
            System.out.println(e);
        }
    }
    //sua ban ghi
    public void update(Category c){
        String sql="update [Category] set [name]= ? where [id]=?";
        try{
            PreparedStatement st= connection.prepareStatement(sql);
            st.setString(1, c.getName());
            st.setInt(2, c.getId());
            st.executeUpdate();
        }catch(SQLException e){
            System.out.println(e);
        }
    }
    // xoa ban ghi
    public void delete(int id) {
        String sql = "DELETE FROM [dbo].[Category]\n"
                + "      WHERE id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public static void main(String[] args) {
        CategoryDAO cd= new CategoryDAO();
        Category c= cd.getCategoryById(11);
        c.setName("Gender Bender");
        cd.update(c);
        System.out.println(c.getName());
    }
}
