package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;


import com.example.test1.model.BBS;

public interface BBSService {
	List<BBS> searchBBSList(HashMap<String, Object> map); 
	
	HashMap<String, Object> editBBS(HashMap<String, Object> map);
	
	HashMap<String, Object> addBBS(HashMap<String, Object> map);
	
	HashMap<String, Object> removeBBS(HashMap<String, Object> map);
	
}
