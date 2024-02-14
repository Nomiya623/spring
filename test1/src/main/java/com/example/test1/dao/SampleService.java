package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import com.example.test1.model.Emp;
import com.example.test1.model.Student;

public interface SampleService {
	List<Student> searchStuList(HashMap<String, Object> map); // 학생 목록
	
	void editStu(HashMap<String, Object> map); // 학생 정보 수정
	
	void addStu(HashMap<String, Object> map); // 학생 추가
	
	Student searchId(HashMap<String, Object> map); // 아이디 중복 체크
}
