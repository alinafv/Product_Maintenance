<%-- 
    Document   : products.jsp
    Created on : Apr 11, 2018, 1:36:53 PM
    Author     : Alina Fernandez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Product Maintenance</title>
        <link rel="stylesheet" href="styles/appStyles.css" type="text/css"/>       
    </head>
    <body>
        <h2>Products</h2>
        <table>
         <tr>
          <th>Code</th>
          <th>Description</th>
          <th>Price</th>
          <th></th>
          <th></th>
         </tr>
         <c:forEach var="product" items="${products}">
          <tr>
           <td><c:out value="${product.code}" /></td>
           <td><c:out value="${product.description}" /></td>
           <td><c:out value="${product.price}" /></td>
           <td><a href="<c:url value='productMaint?action=addProduct&amp;productCode=${product.code}' />">Edit</a></td>
           <td><a href="<c:url value='productMaint?action=deleteProduct&amp;productCode=${product.code}' />">Delete</a></td>
          </tr>
         </c:forEach>
        </table>
        <form action="<c:url value='productMaint' />" method="get">
            <input type="hidden" name="action" value="addProduct">
            <input type="submit" value="Add Product">
        </form>
    </body>
</html>
