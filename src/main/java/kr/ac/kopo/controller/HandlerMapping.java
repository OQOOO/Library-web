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
		System.out.println("�ڵ鷯 ���� ���� ����");
		mappings = new HashMap<>();
		//mappings.put("/key", new Controller��ӹ�����ü);
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
