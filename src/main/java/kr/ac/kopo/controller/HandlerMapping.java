package kr.ac.kopo.controller;

import java.util.HashMap;
import java.util.Map;

import kr.ac.kopo.biz.book.*;
import kr.ac.kopo.biz.user.LoginController;
import kr.ac.kopo.biz.user.LogoutController;
import kr.ac.kopo.biz.user.PasswordCheckController;
import kr.ac.kopo.biz.user.UserInfoController;

public class HandlerMapping {
	private Map<String, Controller> mappings;
	
	public HandlerMapping() {
		System.out.println("핸들러 매핑 실행 성공");
		mappings = new HashMap<>();
		//mappings.put("/key", new Controller상속받은객체);
		mappings.put("/test", new Test());
		mappings.put("/BookSearch.do", new BookSearchController());
		mappings.put("/Login.do", new LoginController());
		mappings.put("/Logout.do", new LogoutController());
		mappings.put("/PasswordCheck.do", new PasswordCheckController());
		mappings.put("/ViewUserInfo.do", new UserInfoController());
	}
	
	public Controller getController(String path) {
		return mappings.get(path);
	}
	
}
