package com.example.test1.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test1.dao.SampleService;
import com.example.test1.dao.UserService;
import com.example.test1.model.Student;
import com.google.gson.Gson;

@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping("/login.do") 
    public String stuInfo(Model model) throws Exception{
		
        return "/login"; 
    }
	
	
	@RequestMapping(value = "/login.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchUser(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.searchUser(map);
		return new Gson().toJson(resultMap);
	}
	
	
	
}