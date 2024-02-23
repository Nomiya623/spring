package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.BBSMapper;

import com.example.test1.model.BBS;

@Service
public class BBSServiceImpl implements BBSService{

	@Autowired
	BBSMapper bbsMapper;

	@Override
	public List<BBS> searchBBSList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return bbsMapper.selectBBSList(map);
	}

	@Override
	public HashMap<String, Object> editBBS(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		bbsMapper.updateBBS(map);
		return map;
		
	}

	@Override
	public HashMap<String, Object> addBBS(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		bbsMapper.insertBBS(map);
		return map;
	}

	@Override
	public HashMap<String, Object> removeBBS(HashMap<String, Object> map) {
		bbsMapper.removeBBS(map);
		return map;
		
	}
	
	
	}


	
