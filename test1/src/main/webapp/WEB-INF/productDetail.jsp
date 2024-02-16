<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product Details</title>
    <style>
        /* Add your CSS styling here */
    </style>
</head>
<body>
<h2>Product Details</h2>
<table>
    <tr><td>Item No:</td><td>${product.itemNo}</td></tr>
    <tr><td>Item Name:</td><td>${product.itemName}</td></tr>
    <tr><td>Price:</td><td>${product.price}</td></tr>
    <tr><td>Contents:</td><td>${product.contents}</td></tr>
    <tr><td>Transportation Info:</td><td>${product.transInfo}</td></tr>
</table>
<br>
<a href="../edit/${product.itemNo}">Edit</a> | 
<a href="../delete/${product.itemNo}" onclick="return confirm('Are you sure?')">Delete</a> | 
<a href="../list">Back to List</a>
</body>
</html>
