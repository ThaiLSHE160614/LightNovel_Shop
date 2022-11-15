/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author admin
 */
public class UpdateProduct extends HttpServlet {

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
            out.println("<title>Servlet UpdateProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProduct at " + request.getContextPath() + "</h1>");
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
        String id_raw = request.getParameter("id");
        int id;
        ProductDAO pd = new ProductDAO();
        try {
            id = Integer.parseInt(id_raw);
            Product p = pd.getProductById(id);
            request.setAttribute("product", p);
            request.getRequestDispatcher("updateProduct.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
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
        String id_raw = request.getParameter("id");
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
        String image = request.getParameter("img");

        int id, price, discount, quantity;
        try {
            id= Integer.parseInt(id_raw);
            price = Integer.parseInt(price_raw);
            discount = Integer.parseInt(discount_raw);
            quantity = Integer.parseInt(quantity_raw);
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
            ProductDAO pd = new ProductDAO();
            pd.update(p);

        } catch (Exception e) {
            System.out.println(e);
        }
        response.sendRedirect("listProduct");
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
