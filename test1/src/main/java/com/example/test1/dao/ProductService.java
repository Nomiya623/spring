package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import com.example.test1.model.Product;

public interface ProductService {
    List<Product> findAllProducts();
    Product findProductByItemNo(String itemNo);
    void addProduct(Product product);
    void editProduct(Product product);
    void removeProductByItemNo(String itemNo);
}