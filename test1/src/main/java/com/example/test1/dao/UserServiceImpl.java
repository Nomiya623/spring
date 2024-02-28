package com.example.test1.dao;

import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.UserMapper;
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
			// 아이디가 없는 경우
			resultMap.put("result", "fail");
			resultMap.put("message", "아이디가 존재하지 않습니다.");
		} else {
			// 아이디가 있는 경우
			String pwd = (String) map.get("pwd");
			// 원래는 db접속(mybatis)해서 검색해야 됨(보안상 이유)
			if(user.getPwd().equals(pwd)) {
				// 로그인 성공
				resultMap.put("result", "success");
				resultMap.put("message", user.getUserName() + "님 환영합니다!");
				session.setAttribute("userId", user.getUserId());
				session.setAttribute("userName", user.getUserName());
				session.setAttribute("userStatus", user.getStatus());
			} else {
				// 패스워드가 다른 경우
				resultMap.put("result", "fail");
				resultMap.put("message", "비밀번호가 일치하지 않습니다.");
			}
		}
		
		return resultMap;
	}
	
	@Override
	public void resetPassword(String phoneNumber, String newPassword) {
		 // 핸드폰 번호를 통해 사용자 정보를 조회합니다.
        HashMap<String, Object> paramMap = new HashMap<>();
        paramMap.put("phone", phoneNumber);
        User user = userMapper.selectUserByPhoneNumber(paramMap);

        // 사용자가 존재하면, 비밀번호를 업데이트합니다.
        if (user != null) {
            HashMap<String, Object> updateMap = new HashMap<>();
            updateMap.put("userId", user.getUserId());
            updateMap.put("newPassword", newPassword); // 새 비밀번호 설정
            userMapper.updatePassword(updateMap);
        } else {
            // 해당 핸드폰 번호를 가진 사용자가 없는 경우 처리 로직
            // 예: 로깅, 예외 처리 등
        }
		
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
		if(user == null) {
			resultMap.put("message", "사용 가능한 아이디 입니다. \n사용하시겠습니까?");
			resultMap.put("result", "success");
		} else {
			resultMap.put("message", "이미 사용중인 아이디 입니다.");
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
	
	
	
	//인중 코드 요청
	@Override
	public HashMap<String, Object> sendAuthCodeToPhoneNumber(String phoneNumber) {
		HashMap<String, Object> resultMap = new HashMap<>();
	    
	    // 인증 코드 생성 (예: 6자리 숫자)
	    String authCode = String.format("%06d", new Random().nextInt(999999));
	    
	    // TODO: 실제 SMS 서비스를 통해 phoneNumber로 authCode를 전송하는 로직 구현
	    // 예시: smsService.sendSMS(phoneNumber, "Your auth code is: " + authCode);
	    
	    // 인증 코드 저장 (예시로 HashMap을 사용하지만, 실제로는 데이터베이스를 사용해야 함)
	    // 이 예시에서는 단순화를 위해 세션을 사용합니다. 실제 환경에서는 보안을 고려해야 합니다.
	    session.setAttribute(phoneNumber + "_authCode", authCode);
	    
	    resultMap.put("message", "인증 코드가 전송되었습니다.");
	    resultMap.put("result", "success");
	    return resultMap;
	}
	//인증코드 검증
	@Override
	public boolean verifyAuthCode(String phoneNumber, String authCode) {
		// 세션에서 저장된 인증 코드 가져오기
	    String savedAuthCode = (String) session.getAttribute(phoneNumber + "_authCode");
	    
	    // 인증 코드 비교
	    if (savedAuthCode != null && savedAuthCode.equals(authCode)) {
	        // 인증 코드 일치
	        session.removeAttribute(phoneNumber + "_authCode"); // 인증 완료 후 코드 삭제
	        return true;
	    } else {
	        // 인증 코드 불일치
	        return false;
	    }
	}

	
	
	
	
}