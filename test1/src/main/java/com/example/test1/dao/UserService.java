package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import com.example.test1.model.Student;
import com.example.test1.model.User;

public interface UserService {
	HashMap<String, Object> searchUser(HashMap<String, Object> map);
	
	void addUser (HashMap<String, Object> map);
	
	HashMap<String, Object> checkUser(HashMap<String, Object> map);
	HashMap<String, Object> searchEditUser(HashMap<String, Object> map);
}
