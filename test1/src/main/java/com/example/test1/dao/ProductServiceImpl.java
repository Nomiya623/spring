package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.ProductMapper;
import com.example.test1.model.Product;


@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductMapper productMapper;

    @Override
    public void addProduct(Product product) {
        productMapper.insertProduct(product);
    }

    @Override
    public void editProduct(Product product) {
        productMapper.updateProduct(product);
    }

    @Override
    public void deleteProduct(String itemNo) {
        productMapper.deleteProduct(itemNo);
    }

    @Override
    public Product getProductByItemNo(String itemNo) {
        return productMapper.selectProductByItemNo(itemNo);
    }

    @Override
    public List<Product> getAllProducts() {
        return productMapper.selectAllProducts();
    }

	@Override
	public HashMap<String, Object> addProduct(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		 productMapper.insertProduct(product);
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
