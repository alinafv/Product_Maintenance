<%-- 
    Document   : confirm_delete.jsp
    Created on : Apr 11, 2018, 1:39:20 PM
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
        <h2>Are you sure you want to delete this product?</h2>
        <form action="<c:url value='productMaint' />" method="post">
            <input type="hidden" name="action" value="deleteProduct">
            <label>Code:</label>      
            <input class="no-border" type="text" name="code" value="<c:out value="${product.code}" />"><br>
            <label>Description:</label>
            <input class="description-width no-border" type="text" name="description"
                   value="<c:out value="${product.description}" />"><br>
            <label>Price:</label>
            <input class="no-border" type="text" name="price" value="<c:out value="${product.price}" />"><br>         
            <input class="confirm-delete-width" type="submit" value="Yes"/>    
        </form>
        <form action="<c:url value='productMaint' />" method="get">
            <input type="hidden" name="action" value="displayProducts">
            <input class="confirm-delete-width" type="submit" value="No" >
        </form>    
    </body>
</html>
