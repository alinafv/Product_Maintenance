<%-- 
    Document   : product.jsp
    Created on : Apr 11, 2018, 1:39:05 PM
    Author     : Alina Fernandez
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Maintenance</title>
        <link rel="stylesheet" href="styles/appStyles.css" type="text/css"/>
         
    </head>
   
    <body>
        <h2>Product</h2>
        <span><i><c:out value="${message}" /></i></span>
        <form action="<c:url value='productMaint'/>" method="post">
            <input type="hidden" name="action" value="updateProduct">
            <label>Code:</label>      
            <input type="text" name="code" value="<c:out value="${product.code}" />"><br>
            <label>Description:</label>
            <input class= "description-width" type="text" name="description"
                   value="<c:out value="${product.description}" />"><br>
            <label>Price:</label>
            <input type="text" name="price" value="<c:out value="${product.price}" />"><br>        
            <input class="update-width margin-left" type="submit" value="Update Product" /> 
        </form>
        <form action="<c:url value='productMaint'/>" method="get">
            <input type="hidden" name="action" value="displayProducts">
            <input class="update-width" type="submit" value="View Products" >
        </form>
    </body>
</html>
