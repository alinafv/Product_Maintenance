/*
    Document   : ProductMaintenance.java
    Created on : Apr 11, 2018, 1:36:53 PM
    Author     : Alina Fernandez

 */
package music.controller;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

import music.business.Product;
import music.data.ProductIO;


public class ProductMaintenance extends HttpServlet {
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
       
        // get current action
        String action = request.getParameter("action");
        String url;
        // perform action and set URL to appropriate page
        if (action.equals("displayProducts")) {
            url = displayProducts(request);
        }
        else if (action.equals("addProduct")) {
            url = addProduct(request);  
        }
        else if (action.equals("updateProduct")){
            if (validateInput(request)){
                url = updateProduct(request); 
            }
            else {
                request.setAttribute("message", "Please, enter a valid value in all fields.");
                url = "/product.jsp";
            }
            
        } 
        else if(action.equals("deleteProduct")){     
            url = deleteProduct(request);
        }
        else{
            // default action
            url = "/index.jsp";            
        }
        // forward to the view
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }
    
   
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        doGet(request, response);
    }
    
    
    public String displayProducts(HttpServletRequest request){
      
        String path = getServletContext().getRealPath("/WEB-INF/product.txt");
            
        ProductIO.init(path); 
        List<Product> products = ProductIO.selectProducts();
        request.setAttribute("products", products);
        return  "/products.jsp"; 
    }
    
    public String addProduct(HttpServletRequest request){
        
        String productCode = request.getParameter("productCode");
        // get current session object
        HttpSession session = request.getSession();
        
        Product product = new Product();
        if (productCode != null){
            product= ProductIO.selectProduct(productCode);    
        }
        session.setAttribute("product",product);
        
        return  "/product.jsp"; 
    }
    
    public String updateProduct(HttpServletRequest request){
        
        // get current session object
        HttpSession session = request.getSession();
        
        Product product = (Product) session.getAttribute("product");
            
        if (!ProductIO.exists(product.getCode())){
            ProductIO.insertProduct(product);
        }
        else{
            ProductIO.updateProduct(product);
        } 
        session.setAttribute("product",product);
        
        return  "/product.jsp"; 
    }
    
    public String deleteProduct(HttpServletRequest request){
        // get current session object
        HttpSession session = request.getSession();
        
        String productCode = request.getParameter("productCode");
        Product product = new Product();
        if (productCode != null){
            product= ProductIO.selectProduct(productCode);
            session.setAttribute("product",product);
            return "/confirm_delete.jsp";
        }
        else {
            product = (Product) session.getAttribute("product");
            ProductIO.deleteProduct(product);
            return  displayProducts(request); 
        }
        
      
    }
     
    public Boolean validateInput(HttpServletRequest request){
        
        // get current session object
        HttpSession session = request.getSession();
        
        Product product = new Product();
        boolean isValid = true;
        
        String code = request.getParameter("code");
        String description = request.getParameter("description");
        
        if (code.isEmpty()){
            isValid = false;
        }
        else{
            product.setCode(code);
        }
        
        if (description.isEmpty()){
            isValid = false;
        }
        else{
            product.setDescription(description);
        }
        
        try {
            Double price = Double.parseDouble(request.getParameter("price"));
            product.setPrice(price);
        } 
        catch (NumberFormatException e) {
            isValid = false;
            product.setPrice(0.0);
        }
        session.setAttribute("product",product);
        return isValid;
    }

   
}
