package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import com.example.test1.model.Student;

public interface SampleService {

	List<Student> searchStuList(); //학생목록
	void editStu(HashMap<String, Object> map);//학생정보 수정
	
	void removeStu(HashMap<String, Object> map);
}
