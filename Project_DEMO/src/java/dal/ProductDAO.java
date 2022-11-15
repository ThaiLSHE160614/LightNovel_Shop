/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.ArrayList;
import model.Category;
import model.Product;

/**
 *
 * @author admin
 */
public class ProductDAO extends DBContext {

    public List<Product> getAll() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from [Product]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("id"),
                        rs.getString("title"),
                        rs.getInt("price"),
                        rs.getInt("discount"),
                        rs.getString("author"),
                        rs.getString("publisher"),
                        rs.getString("public_year"),
                        rs.getString("form"),
                        rs.getString("size"),
                        rs.getString("discribe"),
                        rs.getInt("quantity"),
                        rs.getString("image")
                );

                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Product getProductById(int id) {
        String sql = "select * from [Product] where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Product(rs.getInt("id"),
                        rs.getString("title"),
                        rs.getInt("price"),
                        rs.getInt("discount"),
                        rs.getString("author"),
                        rs.getString("public_year"),
                        rs.getString("publisher"),
                        rs.getString("form"),
                        rs.getString("size"),
                        rs.getString("discribe"),
                        rs.getInt("quantity"),
                        rs.getString("image"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //phan trang
    public List<Product> getListByPage(List<Product> list,
            int start, int end) {
        ArrayList<Product> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    //tạo sản phẩm mới
    public void insert(Product p) {
        try {
            String sql = "INSERT INTO [dbo].[Product]\n"
                    + "           ([id]\n"
                    + "           ,[title]\n"
                    + "           ,[price]\n"
                    + "           ,[discount]\n"
                    + "           ,[author]\n"
                    + "           ,[publisher]\n"
                    + "           ,[form]\n"
                    + "           ,[size]\n"
                    + "           ,[discribe]\n"
                    + "           ,[quantity]\n"
                    + "           ,[image]\n"
                    + "           ,[public_year])\n"
                    + "     VALUES"
                    + "           (?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, p.getId());
            st.setString(2, p.getTitle());
            st.setInt(3, p.getPrice());
            st.setInt(4, p.getDiscount());
            st.setString(5, p.getAuthor());
            st.setString(6, p.getPublisher());
            st.setString(7, p.getForm());
            st.setString(8, p.getSize());
            st.setString(9, p.getDiscribe());
            st.setInt(10, p.getQuantity());
            st.setString(11, p.getImage());
            st.setString(12, p.getPublic_year());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //insert into Genre
    public void insertGenre(int pid, int[] cid) {
        String sql = "insert into [Genre]([product_id], [category_id]) values(?,?)";
        try {
            for (int i = 0; i < cid.length; i++) {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, pid);
                st.setInt(2, cid[i]);
                st.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    // delete Genre
    public void deleteGenre(int id) {
        String sql = "DELETE FROM [dbo].[Genre]\n"
                + "      WHERE [product_id]=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    // xoa san pham 
    public void delete(int id) {
        String sql = "DELETE FROM [dbo].[Product]\n"
                + "      WHERE id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //sua san pham
    public void update(Product p) {
        String sql = "UPDATE [dbo].[Product]\n"
                + "   SET [title] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[discount] = ?\n"
                + "      ,[author] = ?\n"
                + "      ,[publisher] = ?\n"
                + "      ,[form] = ?\n"
                + "      ,[size] = ?\n"
                + "      ,[discribe] = ?\n"
                + "      ,[quantity] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[public_year] = ?\n"
                + " WHERE id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, p.getTitle());
            st.setInt(2, p.getPrice());
            st.setInt(3, p.getDiscount());
            st.setString(4, p.getAuthor());
            st.setString(5, p.getPublisher());
            st.setString(6, p.getForm());
            st.setString(7, p.getSize());
            st.setString(8, p.getDiscribe());
            st.setInt(9, p.getQuantity());
            st.setString(10, p.getImage());
            st.setString(11, p.getPublic_year());
            st.setInt(12, p.getId());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //Lấy ds sản phẩm theo category id
    public List<Product> getProductsByCid(int cid) {
        List<Product> list = new ArrayList<>();
        String sql = "select p.id,p.title,p.price,p.discount,p.author,p.public_year,p.publisher,p.form,p.size,p.discribe,c.name,p.image,p.quantity \n"
                + "from [Product] p, [Category] c, [Genre] g\n"
                + "where g.category_id=c.id and g.product_id= p.id ";
        if (cid != 0) {
            sql += " and c.id=" + cid;
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setTitle(rs.getString("title"));
                p.setPrice(rs.getInt("price"));
                p.setDiscount(rs.getInt("discount"));
                p.setAuthor(rs.getString("author"));
                p.setPublic_year(rs.getString("public_year"));
                p.setPublisher(rs.getString("publisher"));
                p.setForm(rs.getString("form"));
                p.setSize(rs.getString("size"));
                p.setDiscribe(rs.getString("discribe"));
                p.setQuantity(rs.getInt("quantity"));
                p.setImage(rs.getString("image"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //Lấy ds sản phẩm theo danh sách category id
    public List<Product> searchByCheck(int[] cid) {
        List<Product> list = new ArrayList<>();
        String sql = "select p.id,p.title,p.price,p.discount,p.author,p.public_year,p.publisher,p.form,p.size,p.discribe,c.name,p.image,p.quantity \n"
                + "from [Product] p, [Category] c, [Genre] g\n"
                + "where g.category_id=c.id and g.product_id= p.id ";
        if (cid != null && cid[0] != 0) {
            sql += " and c.id in(";
            for (int i = 0; i < cid.length; i++) {
                sql += cid[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setTitle(rs.getString("title"));
                p.setPrice(rs.getInt("price"));
                p.setDiscount(rs.getInt("discount"));
                p.setAuthor(rs.getString("author"));
                p.setPublic_year(rs.getString("public_year"));
                p.setPublisher(rs.getString("publisher"));
                p.setForm(rs.getString("form"));
                p.setSize(rs.getString("size"));
                p.setDiscribe(rs.getString("discribe"));
                p.setQuantity(rs.getInt("quantity"));
                p.setImage(rs.getString("image"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //Đưa ds sản phẩm theo tên sp
    public List<Product> searchByKey(String key) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[title]\n"
                + "      ,[price]\n"
                + "      ,[discount]\n"
                + "      ,[author]\n"
                + "      ,[public_year]\n"
                + "      ,[publisher]\n"
                + "      ,[form]\n"
                + "      ,[size]\n"
                + "      ,[discribe]\n"
                + "      ,[quantity]\n"
                + "      ,[image]\n"
                + "  FROM [dbo].[Product]\n"
                + "  where title like ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + key + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setTitle(rs.getString("title"));
                p.setPrice(rs.getInt("price"));
                p.setDiscount(rs.getInt("discount"));
                p.setAuthor(rs.getString("author"));
                p.setPublic_year(rs.getString("public_year"));
                p.setPublisher(rs.getString("publisher"));
                p.setForm(rs.getString("form"));
                p.setSize(rs.getString("size"));
                p.setDiscribe(rs.getString("discribe"));
                p.setQuantity(rs.getInt("quantity"));
                p.setImage(rs.getString("image"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //Đưa ra ds sản phẩm có giá từ… đến…
    public List<Product> getProductsByPrice(double from, double to) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[title]\n"
                + "      ,[price]\n"
                + "      ,[discount]\n"
                + "      ,[author]\n"
                + "      ,[public_year]\n"
                + "      ,[publisher]\n"
                + "      ,[form]\n"
                + "      ,[size]\n"
                + "      ,[discribe]\n"
                + "      ,[quantity]\n"
                + "      ,[image]\n"
                + "  FROM [dbo].[Product]\n"
                + "  where discount between ? and ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setDouble(1, from);
            st.setDouble(2, to);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setTitle(rs.getString("title"));
                p.setPrice(rs.getInt("price"));
                p.setDiscount(rs.getInt("discount"));
                p.setAuthor(rs.getString("author"));
                p.setPublic_year(rs.getString("public_year"));
                p.setPublisher(rs.getString("publisher"));
                p.setForm(rs.getString("form"));
                p.setSize(rs.getString("size"));
                p.setDiscribe(rs.getString("discribe"));
                p.setQuantity(rs.getInt("quantity"));
                p.setImage(rs.getString("image"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //Đưa ra 4 sản phẩm mới nhất
    public List<Product> get4NewProducts() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT top 4 [id]\n"
                + "      ,[title]\n"
                + "      ,[price]\n"
                + "      ,[discount]\n"
                + "      ,[author]\n"
                + "      ,[public_year]\n"
                + "      ,[publisher]\n"
                + "      ,[form]\n"
                + "      ,[size]\n"
                + "      ,[discribe]\n"
                + "      ,[quantity]\n"
                + "      ,[image]\n"
                + "  FROM [dbo].[Product]\n"
                + " order by [public_year] desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setTitle(rs.getString("title"));
                p.setPrice(rs.getInt("price"));
                p.setDiscount(rs.getInt("discount"));
                p.setAuthor(rs.getString("author"));
                p.setPublic_year(rs.getString("public_year"));
                p.setPublisher(rs.getString("publisher"));
                p.setForm(rs.getString("form"));
                p.setSize(rs.getString("size"));
                p.setDiscribe(rs.getString("discribe"));
                p.setQuantity(rs.getInt("quantity"));
                p.setImage(rs.getString("image"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //Đưa ra ds sản phẩm mới nhất
    public List<Product> getNewProducts() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[title]\n"
                + "      ,[price]\n"
                + "      ,[discount]\n"
                + "      ,[author]\n"
                + "      ,[public_year]\n"
                + "      ,[publisher]\n"
                + "      ,[form]\n"
                + "      ,[size]\n"
                + "      ,[discribe]\n"
                + "      ,[quantity]\n"
                + "      ,[image]\n"
                + "  FROM [dbo].[Product]\n"
                + " order by [public_year] desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setTitle(rs.getString("title"));
                p.setPrice(rs.getInt("price"));
                p.setDiscount(rs.getInt("discount"));
                p.setAuthor(rs.getString("author"));
                p.setPublic_year(rs.getString("public_year"));
                p.setPublisher(rs.getString("publisher"));
                p.setForm(rs.getString("form"));
                p.setSize(rs.getString("size"));
                p.setDiscribe(rs.getString("discribe"));
                p.setQuantity(rs.getInt("quantity"));
                p.setImage(rs.getString("image"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //Đưa ra 4 sản phẩm cũ nhất 
    public List<Product> get4OldProducts() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT top 4 [id]\n"
                + "      ,[title]\n"
                + "      ,[price]\n"
                + "      ,[discount]\n"
                + "      ,[author]\n"
                + "      ,[public_year]\n"
                + "      ,[publisher]\n"
                + "      ,[form]\n"
                + "      ,[size]\n"
                + "      ,[discribe]\n"
                + "      ,[quantity]\n"
                + "      ,[image]\n"
                + "  FROM [dbo].[Product]\n"
                + " order by [public_year]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setTitle(rs.getString("title"));
                p.setPrice(rs.getInt("price"));
                p.setDiscount(rs.getInt("discount"));
                p.setAuthor(rs.getString("author"));
                p.setPublic_year(rs.getString("public_year"));
                p.setPublisher(rs.getString("publisher"));
                p.setForm(rs.getString("form"));
                p.setSize(rs.getString("size"));
                p.setDiscribe(rs.getString("discribe"));
                p.setQuantity(rs.getInt("quantity"));
                p.setImage(rs.getString("image"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    //Đưa ra ds sản phẩm cũ nhất 
    public List<Product> getOldProducts() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[title]\n"
                + "      ,[price]\n"
                + "      ,[discount]\n"
                + "      ,[author]\n"
                + "      ,[public_year]\n"
                + "      ,[publisher]\n"
                + "      ,[form]\n"
                + "      ,[size]\n"
                + "      ,[discribe]\n"
                + "      ,[quantity]\n"
                + "      ,[image]\n"
                + "  FROM [dbo].[Product]\n"
                + " order by [public_year]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setTitle(rs.getString("title"));
                p.setPrice(rs.getInt("price"));
                p.setDiscount(rs.getInt("discount"));
                p.setAuthor(rs.getString("author"));
                p.setPublic_year(rs.getString("public_year"));
                p.setPublisher(rs.getString("publisher"));
                p.setForm(rs.getString("form"));
                p.setSize(rs.getString("size"));
                p.setDiscribe(rs.getString("discribe"));
                p.setQuantity(rs.getInt("quantity"));
                p.setImage(rs.getString("image"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //Đưa ds sản phẩm có giá nhỏ nhất
    public List<Product> getLowPrice() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT TOP 4[id]\n"
                + "      ,[title]\n"
                + "      ,[price]\n"
                + "      ,[discount]\n"
                + "      ,[author]\n"
                + "      ,[public_year]\n"
                + "      ,[publisher]\n"
                + "      ,[form]\n"
                + "      ,[size]\n"
                + "      ,[discribe]\n"
                + "      ,[quantity]\n"
                + "      ,[image]\n"
                + "  FROM [dbo].[Product]\n"
                + " order by [discount]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setTitle(rs.getString("title"));
                p.setPrice(rs.getInt("price"));
                p.setDiscount(rs.getInt("discount"));
                p.setAuthor(rs.getString("author"));
                p.setPublic_year(rs.getString("public_year"));
                p.setPublisher(rs.getString("publisher"));
                p.setForm(rs.getString("form"));
                p.setSize(rs.getString("size"));
                p.setDiscribe(rs.getString("discribe"));
                p.setQuantity(rs.getInt("quantity"));
                p.setImage(rs.getString("image"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //top4 san pham lien quan
    public List<Product> getRelatedProduct(int id) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT TOP 4 p.[id]\n"
                + "      ,[title]\n"
                + "      ,[price]\n"
                + "      ,[discount]\n"
                + "      ,[author]\n"
                + "      ,[publisher]\n"
                + "      ,[form]\n"
                + "      ,[size]\n"
                + "      ,[discribe]\n"
                + "      ,[quantity]\n"
                + "      ,[image]\n"
                + "      ,[public_year]\n"
                + "  FROM [Genre] g1, [Product] p, [Genre] g2\n"
                + "  where g1.product_id=? and g1.category_id= g2.category_id and g2.product_id=p.id";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setTitle(rs.getString("title"));
                p.setPrice(rs.getInt("price"));
                p.setDiscount(rs.getInt("discount"));
                p.setAuthor(rs.getString("author"));
                p.setPublic_year(rs.getString("public_year"));
                p.setPublisher(rs.getString("publisher"));
                p.setForm(rs.getString("form"));
                p.setSize(rs.getString("size"));
                p.setDiscribe(rs.getString("discribe"));
                p.setQuantity(rs.getInt("quantity"));
                p.setImage(rs.getString("image"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        ProductDAO pd = new ProductDAO();
        Product p = new Product();
        p.setTitle("Dr.STONE - Tập 19: Thành Phố Ngô 1 Triệu Dân");
        p.setPrice(25000);
        p.setDiscount(22000);
        p.setAuthor("Riichiro Inagaki, Boichi 25");
        p.setPublic_year("2022-06-27");
        p.setPublisher("NXB Kim Đồng");
        p.setForm("Bìa mềm");
        p.setSize("17.6 x 11.3 cm");
        p.setDiscribe("Các thành viên của Vương quốc khoa học phân tán ra để tiếp tục triển khai kế hoạch chế tác liều chết hòng bắt giữ Dr. Xeno!! Mặt khác, ở phe địch cũng đang phát triển một “vũ khí bí mật” gây sốc!! Trận quyết chiến khoa học vô tiền khoáng hậu sẽ là một trận đấu căng thẳng nhằm tranh giành quyền chi phối bầu trời, mặt đất và mặt nước!!");
        p.setQuantity(100);
        p.setImage("images\\stone19.jpg");
        List<Category> cate = new ArrayList<>();
        Category c = new Category(5, "");
        cate.add(c);
        p.setCategory(cate);
        pd.insert(p);
    }
}
