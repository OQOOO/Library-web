package kr.ac.kopo.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.dao.UserDAO;

public class UserDataRemoveController implements Controller{
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		UserDAO dao = new UserDAO();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");		
		
		dao.userDataRemove(id);
		session.removeAttribute("id");
		
		return "Index.jsp";
	}

}
