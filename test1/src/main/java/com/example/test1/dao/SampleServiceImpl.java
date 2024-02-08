package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.SampleMapper;
import com.example.test1.mapper.StudentMapper;
import com.example.test1.model.Emp;
import com.example.test1.model.Student;

@Service
public class SampleServiceImpl implements SampleService{

	@Autowired
	SampleMapper sampleMapper;

	@Override
	public List<Student> searchStuList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sampleMapper.selectStuList(map);
	}

	@Override
	public void editStu(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		sampleMapper.updateStu(map);
	}

	@Override
	public void removeStu(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		sampleMapper.deleteStu(map);
	}

	@Override
	public void addStu(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		sampleMapper.insertStu(map);
	}

	@Override
	public Student searchId(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		Student s = sampleMapper.selectId(map);
		return s;
	}
	
	
}
