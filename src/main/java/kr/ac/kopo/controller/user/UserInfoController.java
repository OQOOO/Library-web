package kr.ac.kopo.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.dao.UserDAO;
import kr.ac.kopo.vo.UserVO;

public class UserInfoController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		UserDAO dao = new UserDAO();
		UserVO vo = new UserVO();
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		vo = dao.getUserData(id);
		request.setAttribute("userInfo", vo);
		
		String re = (String)request.getParameter("re");
		
		switch (re) {
		case "pwCheck":
			return "/myPages/UserInfoPage.jsp";
		case "infoPage":
			return "/myPages/UserDataUpdate.jsp";
		default:
			return "/myPages/UserInfoPage.jsp";
		}
	}
}
