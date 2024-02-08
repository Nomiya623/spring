package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Emp;
import com.example.test1.model.Student;

@Mapper
public interface SampleMapper {
	//학생 목록
	// update, removeStuList; import, addStuList;	
	

	List<Student> selectStuList(HashMap<String, Object> map);//학생목록
	
	void updateStu(HashMap<String, Object> map);//학생정보수정


	void deleteStu(HashMap<String, Object> map);
	
	void insertStu(HashMap<String, Object> map);
	
	Student selectId(HashMap<String, Object> map);
	
}

