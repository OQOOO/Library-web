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
		
		// �����ͺ��̽����� id, pw ������ ��?
		vo.setId(request.getParameter("id"));
		vo.setPassword(request.getParameter("pw"));
		
		String loginPagePath = "LoginPage.jsp?";
		
		if(dao.userLogIn(vo) != null) {
        	// ���ǿ� ����
			session.setAttribute("id", vo.getId());
			return "MainPage.jsp";

        } else {
        	// ���������� ��� �Է������� �α��� ���н�
        	if (vo.getId() != "" && vo.getPassword() !="") {
        		
        		// "�ش� ������ �������� �ʽ��ϴ�" ���
        		loginPagePath += "login=false";
        		
        		// ���������� ��� �Է����� �ʾ����� �Է����� �������� ���
        	} else {

        		loginPagePath += "bId=" + vo.getId() + "&";
        		if (vo.getId() == "") {
        			loginPagePath += "id=false";
        			if(vo.getPassword() == "") {
        				loginPagePath += "&";
        			}
        		}
        		if(vo.getPassword() == "") {
        			loginPagePath += "pw=false";        		
        		}
        	}
        	return loginPagePath;
        }		
	
	}
}
