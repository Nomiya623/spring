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

import com.example.test1.dao.BoardService;
import com.google.gson.Gson;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;
	
	
	
	@RequestMapping("/boardList.do") 
    public String main(Model model) throws Exception{

        return "/board-list"; 
    }
	
	@RequestMapping("/boardView.do") 
    public String boardView(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
        return "/board-view"; 
    }
	
	
	@RequestMapping(value = "/boardList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchUser(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.searchBoardList(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/boardDetail.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardDetail(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.searchBoardInfo(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/boardDelete.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String deleteBoard(@RequestParam HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        try {
            boolean success = boardService.deleteBoard(Long.valueOf((String) map.get("boardNo")));
            
            if (success) {
                resultMap.put("success", true);
                resultMap.put("message", "게시글이 삭제되었습니다.");
            } else {
                resultMap.put("success", false);
                resultMap.put("message", "게시글 삭제에 실패했습니다.");
            }
        } catch (NumberFormatException e) {
            resultMap.put("success", false);
            resultMap.put("message", "유효하지 않은 게시글 번호입니다.");
        } catch (Exception e) {
            resultMap.put("success", false);
            resultMap.put("message", "게시글 삭제 중 오류가 발생했습니다.");
        }
        return new Gson().toJson(resultMap);
    }
	
}
