<%-- 
    Document   : index.jsp
    Created on : Apr 11, 2018, 1:38:05 PM
    Author     : Alina Fernandez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Maintenance</title>
        <link rel="stylesheet" href="styles/appStyles.css" type="text/css"/>
    </head>
    <body>
        <h2>Product Maintenance</h2>
        <a href="<c:url value='productMaint?action=displayProducts' />">View Products</a>
    </body>
</html>
