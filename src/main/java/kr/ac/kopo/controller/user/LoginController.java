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
		
		String re = "/LoginPage.jsp?";
		
		
		UserVO vo2 = dao.userLogIn(vo);
		if(vo2 != null) {
        	// ���ǿ� ����
			session.setAttribute("id", vo2.getId());
			
			if(vo2.getAdminRight() == 1) {
				session.setAttribute("admin", "1");
				re = "/AdminMainPage.jsp";
			} else {
				re = "/MainPage.jsp";
				
			}

        } else {
        	// ���������� ��� �Է������� �α��� ���н�
        	if (vo.getId() != "" && vo.getPassword() !="") {
        		
        		// "�ش� ������ �������� �ʽ��ϴ�" ���
        		re += "login=false";
        		
        		// ���������� ��� �Է����� �ʾ����� �Է����� �������� ���
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
