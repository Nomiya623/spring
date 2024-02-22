package com.example.test1.controller;

import java.io.File;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.test1.dao.BoardService;
import com.example.test1.dao.CodeService;
import com.example.test1.model.Code;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;
	
	@Autowired
	CodeService codeService;
	
	@RequestMapping("/boardList.do") 
    public String main(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map ) throws Exception{
		map.put("kind", "board");
		
		List<Code> codeList = codeService.searchCodeList(map);
		request.setAttribute("boardList", new Gson().toJson(codeList));
        return "/board-list"; 
    }
	
	@RequestMapping("/boardInsert.do") 
    public String insert(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("kind", map.get("kind"));
		map.put("kind", "board");
		
		List<Code> codeList = codeService.searchCodeList(map);
		request.setAttribute("boardList", new Gson().toJson(codeList));
        return "/board-insert"; 
    }
	
	@RequestMapping("/boardUpdate.do") 
    public String boardUpdate(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
        return "/board-update"; 
    }
	
	@RequestMapping("/boardView.do") 
    public String boardView(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
        return "/board-view"; 
    }
	
	@RequestMapping("/userDetail.do") 
    public String userDetail(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
        return "/user-detail"; 
    }
	
	@RequestMapping("/fileEx.do") 
    public String add(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
        return "/upload"; 
    }
	
	@RequestMapping(value = "/boardList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
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
	
	@RequestMapping(value = "/boardRemove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardRemove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		if(map.containsKey("boardNoList")) {
			String json = map.get("boardNoList").toString(); //Object 형으로 받고 있기 때문에 오류, 문자열으로 리턴
			ObjectMapper mapper = new ObjectMapper();
			List<Object> list = mapper.readValue(json, new TypeReference<List<Object>>(){});
			map.put("list", list);
		}
		
		resultMap = boardService.removeBoard(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/boardInsert.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardinsert(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.addBoard(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/boardUpdate.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardUpdate(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.editBoard(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/boardComment.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardComment(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.addComment(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/editComment.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String editComment(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.editComment(map);
		return new Gson().toJson(resultMap);
	}
	 
	@RequestMapping(value = "/userDetail.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String userDetail(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.searchUserDetail(map);
		return new Gson().toJson(resultMap);
	}
	// controller
	@RequestMapping("/fileUpload.dox")
	    public String result(@RequestParam("file1") MultipartFile multi, @RequestParam("boardNo") int boardNo, HttpServletRequest request,HttpServletResponse response, Model model)
	    {
	        String url = null;
	        String path="c:\\img";
	        try {
	 
	            //String uploadpath = request.getServletContext().getRealPath(path);
	            String uploadpath = path;
	            String originFilename = multi.getOriginalFilename();
	            String extName = originFilename.substring(originFilename.lastIndexOf("."),originFilename.length());
	            long size = multi.getSize();
	            String saveFileName = genSaveFileName(extName);
	            
	            System.out.println("uploadpath : " + uploadpath);
	            System.out.println("originFilename : " + originFilename);
	            System.out.println("extensionName : " + extName);
	            System.out.println("size : " + size);
	            System.out.println("saveFileName : " + saveFileName);
	            String path2 = System.getProperty("user.dir");
	            System.out.println("Working Directory = " + path2 + "\\src\\webapp\\img");
	            if(!multi.isEmpty())
	            {
	                File file = new File(path2 + "\\src\\main\\webapp\\img", saveFileName);
	                multi.transferTo(file);
	                
	                HashMap<String, Object> map = new HashMap<String, Object>();
	                map.put("fileName", saveFileName);
	                map.put("path", "../img/");
	                map.put("orgName", originFilename);
	                map.put("fileSize", size);
	                map.put("etc", extName);
	                map.put("boardNo", boardNo);
	                
	                // insert 쿼리 실행
	               // testService.addBoardImg(map);
	                boardService.addBoardFile(map);
	                
	                model.addAttribute("filename", multi.getOriginalFilename());
	                model.addAttribute("uploadPath", file.getAbsolutePath());
	                
	                return "redirect:boardList.do";
	            }
	        }catch(Exception e) {
	            System.out.println(e);
	        }
	        return "redirect:boardList.do";
	    }
	    
	    // 현재 시간을 기준으로 파일 이름 생성
	    private String genSaveFileName(String extName) {
	        String fileName = "";
	        
	        Calendar calendar = Calendar.getInstance();
	        fileName += calendar.get(Calendar.YEAR);
	        fileName += calendar.get(Calendar.MONTH);
	        fileName += calendar.get(Calendar.DATE);
	        fileName += calendar.get(Calendar.HOUR);
	        fileName += calendar.get(Calendar.MINUTE);
	        fileName += calendar.get(Calendar.SECOND);
	        fileName += calendar.get(Calendar.MILLISECOND);
	        fileName += extName;
	        
	        return fileName;
	    }
}