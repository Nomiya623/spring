package com.example.test1.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test1.dao.BBSService;
import com.example.test1.dao.BoardService;
import com.google.gson.Gson;

@Controller
public class BBSController {
	
	@Autowired
	BBSService bbsService;
	
	@RequestMapping("/bbs-list.do") 
    public String bbsList(Model model) throws Exception{

        return "/bbs-list";
    }
	
	@RequestMapping("/bbs-insert.do") 
    public String bbsInsert(Model model) throws Exception{

        return "/bbs-insert";
    }
	
	@RequestMapping("/bbs-view.do") 
    public String bbsView(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
        return "/bbs-view";
    }

	@RequestMapping(value = "/bbs-list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String bbsList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = bbsService.searchBBSList(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/bbs-insert.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String bbsInsert(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = bbsService.addBBS(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/bbs-view.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String bbsView(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = bbsService.searchBBSInfo(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/bbs-remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String bbsRemove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = bbsService.removeBBS(map);
		return new Gson().toJson(resultMap);
	}

}