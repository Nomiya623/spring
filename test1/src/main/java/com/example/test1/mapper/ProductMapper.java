package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Board;
import com.example.test1.model.Comment;
import com.example.test1.model.Product;
import com.example.test1.model.User;

@Mapper
public interface ProductMapper {
    List<Product> selectAllProducts();
    Product selectProductByItemNo(String itemNo);
    void insertProduct(Product product);
    void updateProduct(Product product);
    void deleteProductByItemNo(String itemNo);
}