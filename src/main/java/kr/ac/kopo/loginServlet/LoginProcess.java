package kr.ac.kopo.loginServlet;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.dao.UserDAO;
import kr.ac.kopo.vo.UserVO;

/**
 * Servlet implementation class LoginProcess
 */
@WebServlet("/LoginProcess")
public class LoginProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginProcess() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		boolean isLogin = false;
		
		UserDAO dao = new UserDAO();
		UserVO vo = new UserVO();
		
		
		// �����ͺ��̽����� id, pw ������ ��?
		vo.setId(request.getParameter("id"));
		vo.setPassword(request.getParameter("pw"));
		
		String loginPagePath = "/Library/LoginPage.jsp?";
		
        if(dao.userLogIn(vo) != null) {
        	// ���ǿ� ����
			session.setAttribute("id", vo.getId());
			response.sendRedirect("/Library/MainPage.jsp");
        	isLogin = true;
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
        	response.sendRedirect(loginPagePath);
        }

		// ������������ �̵�
//        boolean isId = true;
//		if(isLogin == false) {
//			if(!iptId.equals(existingId)) {
//				isId= false;
//			}
//			if(isId == false) {
//				loginPagePath += "&";
//			}
//			if(!iptPw.equals(existingPw)) {
//			}
//			response.sendRedirect(loginPagePath);
//			
//		}
		
	}

}
