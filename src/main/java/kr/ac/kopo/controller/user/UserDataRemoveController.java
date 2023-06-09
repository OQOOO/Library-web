package kr.ac.kopo.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.dao.UserDAO;
import kr.ac.kopo.vo.UserVO;

public class UserDataRemoveController implements Controller{
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String re = "/Index.jsp";
		
		UserDAO dao = new UserDAO();
		UserVO vo = new UserVO();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");		
		String pw = request.getParameter("password");
		
		vo.setId(id);
		vo.setPassword(pw);
		
		Object isPwRight = dao.userLogIn(vo);
		
		if (isPwRight == null) {
			
			request.setAttribute("passwordErrer", "비밀번호가 올바르지 않습니다.");
			re = "/myPages/PwCheckWithdrawal.jsp";
			
		} else {
			
			dao.userDataRemove(id);
			session.removeAttribute("id");
			
		}
		
		
		return re;
	}

}
