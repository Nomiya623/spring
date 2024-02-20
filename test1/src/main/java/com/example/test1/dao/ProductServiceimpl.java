package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.ProductMapper;
import com.example.test1.model.Product;

@Service
public class ProductServiceimpl implements ProductService{

	@Autowired
	ProductMapper productMapper;
	
	@Autowired
	HttpSession session;

	@Override
	public HashMap<String, Object> searchProductList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Product> list = productMapper.selectProductList(map);
		resultMap.put("list", list);
		resultMap.put("result", "success");
		return resultMap;
	}

	@Override
	public HashMap<String, Object> searchProductInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Product product =  productMapper.selectProductInfo(map);
		resultMap.put("info", product);
		resultMap.put("result", "success");
		return resultMap;
	}

	@Override
	public HashMap<String, Object> addProduct(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		productMapper.insertProduct(map);
		resultMap.put("result", "success");
		return resultMap;
	}

	@Override
	public HashMap<String, Object> editProduct(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		productMapper.updateProduct(map);
		resultMap.put("result", "success");
		return resultMap;
	}

	@Override
	public HashMap<String, Object> removeProduct(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		productMapper.deleteProduct(map);
		resultMap.put("result", "success");
		return resultMap;
	}
}
