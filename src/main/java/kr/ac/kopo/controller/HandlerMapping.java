package kr.ac.kopo.controller;

import java.util.HashMap;
import java.util.Map;

import kr.ac.kopo.controller.book.*;
import kr.ac.kopo.controller.user.*;

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
		mappings.put("/Singup.do", new SingupController());
	}
	
	public Controller getController(String path) {
		return mappings.get(path);
	}
	
}
