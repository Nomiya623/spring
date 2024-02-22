package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import com.example.test1.model.Code;
import com.example.test1.model.Emp;
import com.example.test1.model.Student;

public interface CodeService {

	List<Code> searchCodeList(HashMap<String, Object> map); // 학생 목록
}
