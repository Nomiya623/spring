package com.example.test1.dao;

import java.util.HashMap;
// Service의 return 타입은 거의 무조건 HashMap이라고 생각하자
public interface ProductService {
	HashMap<String, Object> searchProductList(HashMap<String, Object> map); // 상품 목록
	HashMap<String, Object> searchProductInfo(HashMap<String, Object> map); // 상품 상세정보
	HashMap<String, Object> addProduct(HashMap<String, Object> map); // 상품 추가
	HashMap<String, Object> editProduct(HashMap<String, Object> map); // 상품 정보 수정
	HashMap<String, Object> removeProduct(HashMap<String, Object> map); // 상품 삭제	
}
