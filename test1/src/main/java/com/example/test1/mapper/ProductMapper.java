package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Product;

@Mapper
public interface ProductMapper {
	List<Product> selectProductList(HashMap<String, Object> map); // 상품 목록
	Product selectProductInfo(HashMap<String, Object> map); // 상품 상세정보
	void insertProduct(HashMap<String, Object> map); // 상품 추가
	void updateProduct(HashMap<String, Object> map); // 상품 정보 수정
	void deleteProduct(HashMap<String, Object> map); // 상품 삭제
}

