package com.example.test1.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test1.dao.UserService;
import com.google.gson.Gson;

@Controller
public class UserController {

	@Autowired
	UserService userService;
	
	@Autowired
	HttpSession session;
	
	
	@RequestMapping("/main.do") 
    public String main(Model model) throws Exception{
		String status = (String)session.getAttribute("userStatus");
		if(status.equals("A")) {
			return "redirect:boardList.do";
		}
		
        return "/main"; 
    }
	
	
	@RequestMapping("/login.do") 
    public String login(Model model) throws Exception{
		System.out.println("test");
        return "/login"; 
    }
	
	@RequestMapping("/join.do") 
    public String join(Model model) throws Exception{
		System.out.println("test");
        return "/join"; 
    }
	
	@RequestMapping("/user/edit.do") 
    public String edit(Model model) throws Exception{
		System.out.println(session.getAttribute("userId"));
        return "/user-edit"; 
    }
	
	@RequestMapping(value = "/login.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchBbsList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.searchUser(map);
		return new Gson().toJson(resultMap);
	}
	
	// 인증 코드 요청
    @RequestMapping(value = "/request-auth-code", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String requestAuthCode(@RequestParam("phoneNumber") String phoneNumber) {
        HashMap<String, Object> resultMap = userService.sendAuthCodeToPhoneNumber(phoneNumber);
        return new Gson().toJson(resultMap);
    }
    // 인증 코드 검증
    @RequestMapping(value = "/verify-auth-code", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String verifyAuthCode(@RequestParam("phoneNumber") String phoneNumber, @RequestParam("authCode") String authCode) {
        boolean isVerified = userService.verifyAuthCode(phoneNumber, authCode);
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap.put("verified", isVerified);
        session.setAttribute("isVerified", isVerified); // 인증 성공 시 세션에 저장
        return new Gson().toJson(resultMap);
    }
   
    //비밀번호 재설정 요펑처리
    @RequestMapping(value = "/password-reset.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String resetPassword(@RequestParam("phoneNumber") String phoneNumber, @RequestParam("newPassword") String newPassword) {
        HashMap<String, Object> resultMap = new HashMap<>();
        
        Boolean isVerified = (Boolean) session.getAttribute("isVerified");
        
        if (Boolean.TRUE.equals(isVerified)) {
            try {
                userService.resetPassword(phoneNumber, newPassword);
                resultMap.put("success", true);
                resultMap.put("message", "비밀번호가 성공적으로 재설정되었습니다.");
                session.removeAttribute("isVerified"); // 인증 정보 초기화
            } catch (Exception e) {
                resultMap.put("success", false);
                resultMap.put("message", "비밀번호 재설정 중 오류가 발생했습니다.");
            }
        } else {
            resultMap.put("success", false);
            resultMap.put("message", "휴대폰 번호 인증이 완료되지 않았습니다.");
        }
        
        return new Gson().toJson(resultMap);
    }
    
	
	//회원가입 요청처리
	@RequestMapping(value = "/join", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String userJoin(@RequestParam HashMap<String, Object> map) {
        HashMap<String, Object> resultMap = new HashMap<>();
        Boolean isVerified = (Boolean) session.getAttribute("isVerified");
        if (Boolean.TRUE.equals(isVerified)) {
            userService.addUser(map);
            resultMap.put("success", true);
            session.removeAttribute("isVerified"); // 인증 정보 초기화
        } else {
            resultMap.put("success", false);
            resultMap.put("message", "User not verified");
        }
        return new Gson().toJson(resultMap);
    }
	
	@RequestMapping(value = "/join.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String userJoin(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		userService.addUser(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/check.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String check(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.checkUser(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/selectUser.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String selectUser(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.searchEditUser(map);
		return new Gson().toJson(resultMap);
	}
}
