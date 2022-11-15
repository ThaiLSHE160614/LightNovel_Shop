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
import model.User;

/**
 *
 * @author admin
 */
public class UserDAO extends DBContext {
    
    public List<User> getAll(){
        List<User> list= new ArrayList<>();
        String sql="select * from [User]";
        try{
            PreparedStatement st= connection.prepareStatement(sql);
            ResultSet rs= st.executeQuery();
            while(rs.next()){
                User u= new User(rs.getString("fname"),
                        rs.getString("lname"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("address"),
                        rs.getString("phone"),
                        rs.getBoolean("role_id")
                );
            list.add(u);
            }    
        }catch(SQLException e){
            System.out.println(e);
        }
        return list;
    }
    
    public User check(String email, String password) {
        String sql = "SELECT [fname]\n"
                + "      ,[lname]\n"
                + "      ,[email]\n"
                + "      ,[password]\n"
                + "      ,[address]\n"
                + "      ,[phone]\n"
                + "      ,[role_id]\n"
                + "  FROM [dbo].[User]\n"
                + "  WHERE [email]=? and [password]=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User(rs.getString("fname"),
                        rs.getString("lname"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("address"),
                        rs.getString("phone"),
                        rs.getBoolean("role_id"));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void insert(User u) {
        String sql = "INSERT INTO [dbo].[User]\n"
                + "           ([fname]\n"
                + "           ,[lname]\n"
                + "           ,[email]\n"
                + "           ,[password]\n"
                + "           ,[address]\n"
                + "           ,[phone]\n"
                + "           ,[role_id])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getFname());
            st.setString(2, u.getLname());
            st.setString(3, u.getEmail());
            st.setString(4, u.getPassword());
            st.setString(5, u.getAddress());
            st.setString(6, u.getPhone());
            st.setBoolean(7, u.isRole_id());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public User getUserByEmail(String email) {
        String sql = "select * from [User] where [email] =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User(rs.getString("fname"),
                        rs.getString("lname"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("address"),
                        rs.getString("phone"),
                        rs.getBoolean("role_id"));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // quen mat khau
    public User checkPhone(String email, String phone) {
        String sql = "SELECT [fname]\n"
                + "      ,[lname]\n"
                + "      ,[email]\n"
                + "      ,[password]\n"
                + "      ,[address]\n"
                + "      ,[phone]\n"
                + "      ,[role_id]\n"
                + "  FROM [dbo].[User]\n"
                + "  WHERE [email]=? and [phone]=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, phone);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User(rs.getString("fname"),
                        rs.getString("lname"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("address"),
                        rs.getString("phone"),
                        rs.getBoolean("role_id"));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void forget(User u) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [password] = ?\n"
                + " WHERE [email]=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getPassword());
            st.setString(2, u.getEmail());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    // thay doi thong tin nguoi dung
    public void changeInfor(User u) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [fname] = ?\n"
                + "      ,[lname] = ?\n"
                + "      ,[password] = ?\n"
                + "      ,[address] = ?\n"
                + "      ,[phone] = ?\n"
                + " WHERE [email] =?";
        try{
            PreparedStatement st= connection.prepareStatement(sql);
            st.setString(1, u.getFname());
            st.setString(2, u.getLname());
            st.setString(3, u.getPassword());
            st.setString(4, u.getAddress());
            st.setString(5, u.getPhone());
            st.setString(6, u.getEmail());
            st.executeUpdate();
            
        }catch(SQLException e){
            System.out.println(e);
        }
    }
    // thay doi dia chi va so dien thoai
    public void changeAddress(User u) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [address] = ?\n"
                + "      ,[phone] = ?\n"
                + " WHERE [email]=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getAddress());
            st.setString(2, u.getPassword());
            st.setString(3, u.getEmail());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        UserDAO d = new UserDAO();
        if (d.check("lesythai123@gmail.com", "17102002") == null) {
            System.out.println("ok");
        } else {
            System.out.println("loi");
        }

    }
}
