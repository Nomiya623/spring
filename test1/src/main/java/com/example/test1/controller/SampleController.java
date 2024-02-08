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
import com.example.test1.model.Student;
import com.google.gson.Gson;

@Controller
public class SampleController {

	@Autowired
	SampleService sampleService;
	
	@RequestMapping("/stu-list.do") 
    public String stuInfo(Model model) throws Exception{
		
        return "/stu-list"; 
    }
	
	@RequestMapping(value = "/stu/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchStuList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Student> list = sampleService.searchStuList();
		resultMap.put("list", list);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/stu/edit.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String edit(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		System.out.println(map.get("stuNo"));
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		sampleService.editStu(map);
		
		return new Gson().toJson(resultMap);
	}
	
	
	@RequestMapping(value = "/stu/remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String remove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		System.out.println(map.get("stuNo"));
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		sampleService.removeStu(map);
		
		return new Gson().toJson(resultMap);
	}
}