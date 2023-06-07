package kr.ac.kopo.controller.pageMove;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.controller.Controller;

public class IndexMainController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		if (session.getAttribute("id") != null) {
			if(session.getAttribute("admin") != null) {
				return "/AdminMainPage.jsp";
			}
			
			return "/MainPage.jsp";
			
		} else {
			return "/Index.jsp";
		}
		
	}

}
