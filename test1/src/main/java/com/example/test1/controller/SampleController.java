package com.example.test1.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test1.dao.CodeService;
import com.example.test1.dao.SampleService;
import com.example.test1.model.Code;
import com.example.test1.model.Student;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

@Controller
public class SampleController {
	
	@Autowired
	SampleService sampleService;
	
	@Autowired
	CodeService codeService;
	
	@RequestMapping("/stu-list.do") 
    public String stuInfo(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		map.put("kind", "dept");
		
		List<Code> codeList = codeService.searchCodeList(map);
		request.setAttribute("deptList", new Gson().toJson(codeList));
        return "/stu-list"; 
    }
	
	@RequestMapping("/stu-add.do") 
    public String add(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		
		map.put("kind", "dept");
		
		List<Code> codeList = codeService.searchCodeList(map);
		request.setAttribute("deptList", new Gson().toJson(codeList));
        return "/stu-add"; 
    }
	
	@RequestMapping(value = "/stu/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchBbsList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		String json = map.get("dept").toString(); //Object 형으로 받고 있기 때문에 오류, 문자열으로 리턴
		ObjectMapper mapper = new ObjectMapper();
		List<Object> deptList = mapper.readValue(json, new TypeReference<List<Object>>(){});
		map.put("deptList", deptList);
	
		List<Student> list = sampleService.searchStuList(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/stu/edit.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String edit(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		sampleService.editStu(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/stu/add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String add(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		sampleService.addStu(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/stu/check.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String check(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Student s = sampleService.searchId(map);
		resultMap.put("student", s);
		return new Gson().toJson(resultMap);
	}
}