package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.CodeMapper;
import com.example.test1.model.Code;

@Service
public class CodeServiceImpl implements CodeService{

	@Autowired
	CodeMapper codeMapper;

	@Override
	public List<Code> searchCodeList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List<Code> codeList = null;
		try {
			codeList = codeMapper.selectCodeList(map);
		} catch(Exception e){
			System.out.println(e.getMessage());
		}
		return codeList;
	}

	@Override
	public List<Code> searchSiList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List<Code> siList = null;
		try {
			siList = codeMapper.selectSiList(map);
		} catch(Exception e){
			System.out.println(e.getMessage());
		}
		return siList;
	}

	@Override
	public List<Code> searchGuList(HashMap<String, Object> map) {
		List<Code> guList = null;
		try {
			guList = codeMapper.selectGuList(map);
		} catch(Exception e){
			System.out.println(e.getMessage());
		}
		return guList;
	}

	@Override
	public List<Code> searchDongList(HashMap<String, Object> map) {
		List<Code> dongList = null;
		try {
			dongList = codeMapper.selectDongList(map);
		} catch(Exception e){
			System.out.println(e.getMessage());
		}
		return dongList;
	}
	
	
}
