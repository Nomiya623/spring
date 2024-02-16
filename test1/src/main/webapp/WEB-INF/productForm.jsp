<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add/Edit Product</title>
    <style>
        /* Add your CSS styling here */
    </style>
</head>
<body>
<h2>${empty product.itemNo ? "Add New Product" : "Edit Product"}</h2>
<form action="save" method="post">
    <input type="hidden" name="itemNo" value="${product.itemNo}">
    Item Name: <input type="text" name="itemName" value="${product.itemName}"><br>
    Price: <input type="text" name="price" value="${product.price}"><br>
    Contents: <textarea name="contents">${product.contents}</textarea><br>
    Transportation Info: <select name="transInfo">
        <option value="Air" ${product.transInfo == 'Air' ? 'selected' : ''}>Air</option>
        <option value="Ground" ${product.transInfo == 'Ground' ? 'selected' : ''}>Ground</option>
        <option value="Sea" ${product.transInfo == 'Sea' ? 'selected' : ''}>Sea</option>
    </select><br>
    <input type="submit" value="Save">
</form>
<a href="list">Back to List</a>
</body>
</html> 