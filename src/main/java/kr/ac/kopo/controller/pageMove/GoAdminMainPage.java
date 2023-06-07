package kr.ac.kopo.controller.pageMove;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;

public class GoAdminMainPage implements Controller{
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return "/AdminMainPage.jsp";
	}

}
