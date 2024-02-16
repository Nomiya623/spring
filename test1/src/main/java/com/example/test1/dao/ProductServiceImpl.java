package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.BoardMapper;
import com.example.test1.mapper.ProductMapper;
import com.example.test1.model.Board;
import com.example.test1.model.Comment;
import com.example.test1.model.Product;
import com.example.test1.model.User;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    ProductMapper productMapper;

    @Override
    public List<Product> findAllProducts() {
        return productMapper.selectAllProducts();
    }

    @Override
    public Product findProductByItemNo(String itemNo) {
        return productMapper.selectProductByItemNo(itemNo);
    }

    @Override
    public void addProduct(Product product) {
        productMapper.insertProduct(product);
    }

    @Override
    public void editProduct(Product product) {
        productMapper.updateProduct(product);
    }

    @Override
    public void removeProductByItemNo(String itemNo) {
        productMapper.deleteProductByItemNo(itemNo);
    }
}