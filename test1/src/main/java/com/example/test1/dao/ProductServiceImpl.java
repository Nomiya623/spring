package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.ProductMapper;
import com.example.test1.model.Board;
import com.example.test1.model.Comment;
import com.example.test1.model.Product;


@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    ProductMapper productMapper;

	@Override
	public HashMap<String, Object> getProductList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<Product> productList = productMapper.selectProductList(map);
			resultMap.put("list", productList);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> getProduct(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HashMap<String, Object> addProduct(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HashMap<String, Object> editProduct(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HashMap<String, Object> removeProduct(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HashMap<String, Object> getProductDetail(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
