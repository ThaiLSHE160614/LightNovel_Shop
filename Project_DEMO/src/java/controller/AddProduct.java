/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoryDAO;
import dal.ProductDAO;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.nio.file.Path;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author admin
 */
public class AddProduct extends HttpServlet {

    ServletContext application;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProduct at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CategoryDAO cd = new CategoryDAO();
        List<Category> cate = cd.getAll();
        request.setAttribute("cate", cate);
        request.getRequestDispatcher("/admin/addProduct.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id_raw= request.getParameter("id");
        String title = request.getParameter("title");
        String price_raw = request.getParameter("price");
        String discount_raw = request.getParameter("discount");
        String[] cid_raw = request.getParameterValues("category");
        String author = request.getParameter("author");
        String publisher = request.getParameter("publisher");
        String public_year = request.getParameter("public_year");
        String form = request.getParameter("form");
        String size = request.getParameter("size");
        String discribe = request.getParameter("discribe");
        String quantity_raw = request.getParameter("quantity");
        String image= request.getParameter("img");

        ProductDAO pd = new ProductDAO();
        CategoryDAO cd = new CategoryDAO();
        int id, price, discount, quantity;
        int[] cid = new int[cid_raw.length];
        try {
            id= Integer.parseInt(id_raw);
            Product text= pd.getProductById(id);
            if(text!= null){
                request.setAttribute("error", "Id sản phẩm đã tồn tại");
                request.getRequestDispatcher("/admin/addProduct.jsp").forward(request, response);
            }
            else{
                price = Integer.parseInt(price_raw);
                discount = Integer.parseInt(discount_raw);
                quantity = Integer.parseInt(quantity_raw);
                List<Category> category = new ArrayList<>();
                for (int i = 0; i < cid_raw.length; i++) {
                    cid[i] = Integer.parseInt(cid_raw[i]);
                    Category c= new Category(cid[i],"");
                    category.add(c);
                }
                Product p = new Product();
                p.setId(id);
                p.setTitle(title);
                p.setPrice(price);
                p.setDiscount(discount);
                p.setAuthor(author);
                p.setPublisher(publisher);
                p.setForm(form);
                p.setSize(size);
                p.setDiscribe(discribe);
                p.setQuantity(quantity);
                p.setImage(image);
                p.setPublic_year(public_year);
                p.setCategory(category);
                pd.insert(p);
                pd.insertGenre(id, cid);
                request.setAttribute("error", "Tạo sản phẩm mới thành công");   
            }

        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        request.getRequestDispatcher("/admin/addProduct.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
