package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.SampleMapper;
import com.example.test1.mapper.StudentMapper;
import com.example.test1.mapper.UserMapper;
import com.example.test1.model.Emp;
import com.example.test1.model.Student;
import com.example.test1.model.User;

@Service
public class UserServiceImpl implements UserService{
	
	
	@Autowired
	UserMapper userMapper;
	
	@Autowired
	HttpSession session;
	
	@Override
	public HashMap<String, Object> searchUser(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		User user = userMapper.selectUser(map);
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		if(user == null) {
//			아이디가 없는 경우
			resultMap.put("result", "fail");
			resultMap.put("message", "아이디가 존재하지 않습니다");
		} else {
//			아이기 있는 경우
			String pwd  = (String)map.get("pwd");
//			원래 db접속해서 확인해야 함(보안상)
			if(user.getPwd().equals(pwd)) {
//				로그인 성공
				resultMap.put("result", "success");
				resultMap.put("message", user.getUsername() + "아이디가 존재하지 않습니다");
				session.setAttribute("userId", user.getUserid());
				session.setAttribute("userName", user.getUsername());
			} else {
//				패스워드가 다를 경우
				resultMap.put("result", "fail");
				resultMap.put("message", "비밀번호가 일치하지 않습니다");
			}
		}
		return resultMap;
	}

	@Override
	public void addUser(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		userMapper.insertUser(map);
		
	}

	@Override
	public HashMap<String, Object> checkUser(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		User user = userMapper.selectUser(map);
		
		 if (user == null) {
	           resultMap.put("message", "사용가능한 아이디입니다.");
	           resultMap.put("result", "success");
	        } else {
	        	String pwd = (String) map.get("pwd");
	        		
	        	resultMap.put("message", "이미 사용중인 아이디입니다.");
	        	resultMap.put("result", "fail");
	        }
		return resultMap;
	}

	@Override
	public HashMap<String, Object> searchEditUser(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		User user = userMapper.selectUser(map);
		resultMap.put("user", user);
		return resultMap;
		}


	}

	

