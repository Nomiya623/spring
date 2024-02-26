package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import com.example.test1.model.Code;
import com.example.test1.model.Emp;
import com.example.test1.model.Student;

public interface CodeService {

	List<Code> searchCodeList(HashMap<String, Object> map); // 학생 목록
	
	List<Code> searchSiList(HashMap<String, Object> map);
	List<Code> searchGuList(HashMap<String, Object> map);
	List<Code> searchDongList(HashMap<String, Object> map);
	
	
}
