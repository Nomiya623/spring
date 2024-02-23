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

import com.example.test1.dao.BBSService;

import com.example.test1.model.BBS;
import com.example.test1.model.Code;
import com.example.test1.model.Student;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

@Controller
public class BBSController {
	
	@Autowired
	BBSService bbsService;
	
	@RequestMapping("/bbsList.do") 
    public String main(Model model) throws Exception{

        return "/bbs-list";
    }
	
	@RequestMapping("/bbsView.do") 
    public String bbsView(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
        return "/bbs-view";
    }
	@RequestMapping("/bbsInsert.do") 
    public String bbsInsert(Model model) throws Exception{

        return "/bbs-insert";
    }
	@RequestMapping("/bbsEdit.do") 
    public String bbsEdit(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
        return "/bbs-edit";
    }
	@RequestMapping(value = "/bbsList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchBbsList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		List<BBS> list = bbsService.searchBBSList(map);
		resultMap.put("list", list);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	@RequestMapping(value = "/bbsView.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String bbsView(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = bbsService.searchBBSInfo(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/bbsInsert.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String bbsInsert(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = bbsService.addBBS(map);
		return new Gson().toJson(resultMap);
	}
		
		@RequestMapping(value = "/bbsEdit.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String bbsEdit(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			resultMap = bbsService.updateBBS(map);
			return new Gson().toJson(resultMap);
		}
		
		@RequestMapping(value = "/bbsRemove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String bbsRemove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			resultMap = bbsService.deleteBBS(map);
			return new Gson().toJson(resultMap);
		}
		

}