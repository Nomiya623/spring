package com.example.test1.dao;


import java.util.HashMap;
import java.util.List;

import com.example.test1.model.Product;

public interface ProductService {
	HashMap<String, Object> getProductList(HashMap<String, Object> map);
	HashMap<String, Object> getProduct(HashMap<String, Object> map);
    HashMap<String, Object> addProduct(HashMap<String, Object> map);
    HashMap<String, Object> editProduct(HashMap<String, Object> map);
	HashMap<String, Object> removeProduct(HashMap<String, Object> map);
	HashMap<String, Object> getProductDetail(HashMap<String, Object> map);
}