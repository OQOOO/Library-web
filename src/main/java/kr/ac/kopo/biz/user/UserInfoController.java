package kr.ac.kopo.biz.user;

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
		
		return "UserInfoPage.jsp";
	}
}
