package kr.ac.kopo.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.dao.UserDAO;
import kr.ac.kopo.vo.UserVO;

public class LoginController implements Controller{
@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		
		UserDAO dao = new UserDAO();
		UserVO vo = new UserVO();
		
		// 데이터베이스에서 id, pw 가져와 비교?
		vo.setId(request.getParameter("id"));
		vo.setPassword(request.getParameter("pw"));
		
		String re = "/LoginPage.jsp?";
		
		
		UserVO vo2 = dao.userLogIn(vo);
		if(vo2 != null) {
        	// 세션에 저장
			session.setAttribute("id", vo2.getId());
			
			if(vo2.getAdminRight() == 1) {
				session.setAttribute("admin", "1");
				re = "/AdminMainPage.jsp";
			} else {
				re = "/MainPage.jsp";
				
			}

        } else {
        	// 계정정보를 모두 입력했으나 로그인 실패시
        	if (vo.getId() != "" && vo.getPassword() !="") {
        		
        		// "해당 계정이 존재하지 않습니다" 출력
        		re += "login=false";
        		
        		// 계정정보를 모두 입력하지 않았을때 입력하지 않은정보 출력
        	} else {

        		re += "bId=" + vo.getId() + "&";
        		if (vo.getId() == "") {
        			re += "id=false";
        			if(vo.getPassword() == "") {
        				re += "&";
        			}
        		}
        		if(vo.getPassword() == "") {
        			re += "pw=false";        		
        		}
        	}
        }		
		return re;
	
	}
}
