package kr.ac.kopo.biz.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.dao.UserDAO;
import kr.ac.kopo.vo.UserVO;

public class PasswordCheckController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		UserDAO dao = new UserDAO();
		UserVO vo = new UserVO();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String pw = request.getParameter("pw");
		vo.setId(id);
		vo.setPassword(pw);
		
		Object obj = null;
		obj = dao.userLogIn(vo);
		
		if(obj != null) {
			UserDAO dao1 = new UserDAO();
			UserVO vo1 = new UserVO();
			
			vo1 = dao1.getUserData(id);
			request.setAttribute("userInfo", vo1);
			
			return "UserInfoPage.jsp";
		} else {
			return "InputPasswordPage.jsp";
		}
	}
	
}
