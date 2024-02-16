<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product List</title>
    <style>
        /* Add your CSS styling here */
    </style>
</head>
<body>
<h2>Product List</h2>
<table border="1">
    <tr>
        <th>Item No</th>
        <th>Item Name</th>
        <th>Price</th>
        <th>Details</th>
    </tr>
    <c:forEach var="product" items="${products}">
        <tr>
            <td>${product.itemNo}</td>
            <td>${product.itemName}</td>
            <td>${product.price}</td>
            <td><a href="detail/${product.itemNo}">View Details</a></td>
        </tr>
    </c:forEach>
</table>
<br>
<a href="add">Add New Product</a>
</body>
</html>