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

import com.example.test1.dao.StudentService;
import com.example.test1.model.Emp;
import com.example.test1.model.Student;
import com.google.gson.Gson;

@Controller
public class StudentController {

	@Autowired
	StudentService studentService;

	@RequestMapping("/student.do")
	public String main(Model model) throws Exception {

		return "/student-list"; // student-list.jsp
	}

	@RequestMapping("/test.do")
	public String test(Model model) throws Exception {

		return "/test"; // student-list.jsp
	}

	@RequestMapping("/first.do")
	public String first(Model model) throws Exception {

		return "/first"; 
	}

	@RequestMapping("/stuUpdate.do")
	public String stuUpdate(Model model) throws Exception {

		return "/stu-update";
	}
	@RequestMapping("/stuInfo.do")
	public String stuInfo(Model model) throws Exception {

		return "/stuInfo"; 
	}

//	데이터 호툴
	@RequestMapping(value = "/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchBbsList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		System.out.println("test!!!");
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Student> list = studentService.searchStudentList(map);
		resultMap.put("list", list);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}

	@RequestMapping(value = "/first.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String first(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Emp> e = (List<Emp>) studentService.firstService();
		resultMap.put("emp", e);
		resultMap.put("message", "success");
		return new Gson().toJson(resultMap);
	}

	@RequestMapping(value = "/stuInfo.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String stuInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		System.out.println("stu info");
		List<Student> s = studentService.stuInfo();
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		/* resultMap.put("list", s); */
		resultMap.put("stuInfo", s);
		resultMap.put("message", "success");
		return new Gson().toJson(resultMap);
	}

}