package com.example.test1.dao;


import java.util.HashMap;
import java.util.List;

import com.example.test1.model.Product;

public interface ProductService {
    HashMap<String, Object> addProduct(HashMap<String, Object> map);
    HashMap<String, Object> editProduct(HashMap<String, Object> map);
    void deleteProduct(String itemNo);
    Product getProductByItemNo(String itemNo);
    List<Product> getAllProducts();
	HashMap<String, Object> removeProduct(HashMap<String, Object> map);
	HashMap<String, Object> getProductDetail(HashMap<String, Object> map);
}