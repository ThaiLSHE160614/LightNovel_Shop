/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.Item;
import model.Order;
import model.User;

/**
 *
 * @author admin
 */
public class OrderDAO extends DBContext {

    public List<Order> getAll() {
        List<Order> list = new ArrayList<>();
        String sql = "select * from [Order]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order(rs.getInt("id"),
                        rs.getString("date"),
                        rs.getString("ue"),
                        rs.getDouble("total_money")
                );
                list.add(o);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public void addOrder(User u, Cart c) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        try {
            String sql = "INSERT INTO [dbo].[Order]\n"
                    + "           ([date]\n"
                    + "           ,[ue]\n"
                    + "           ,[total_money])\n"
                    + "     VALUES(?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, date);
            st.setString(2, u.getEmail());
            st.setDouble(3, c.getTotalMoney());
            st.executeUpdate();
            
            //lay id cua order vua add
            String sql1 = "select top 1 [id] from [Order] order by [id] desc";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            
            //add vao bang OrderDetail
            if (rs.next()) {
                int oid = rs.getInt("id");
                for (Item i : c.getItems()) {
                    String sql2 = "insert into [OrderLine] values(?,?,?,?)";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, oid);
                    st2.setInt(2, i.getProduct().getId());
                    st2.setInt(3, i.getQuantity());
                    st2.setDouble(4, i.getPrice());
                    st2.executeUpdate();
                }
            }
            //cap nhat lai so luong san pham
            String sql3 = "update [Product] set [quantity]=[quantity]-? where id=?";
            PreparedStatement st3 = connection.prepareStatement(sql3);
            for (Item i : c.getItems()) {
                st3.setInt(1, i.getQuantity());
                st3.setInt(2, i.getProduct().getId());
                st3.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
