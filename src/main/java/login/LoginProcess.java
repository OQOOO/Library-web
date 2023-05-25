package login;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		// 데이터베이스에서 id, pw 가져와 비교?
		String iptId = request.getParameter("id");
		String iptPw = request.getParameter("pw");
		
		String existingId = "idid";
		String existingPw = "pwpw";
		
		String loginPagePath = "/Library/LoginPage.jsp?";
		

        if(iptId.equals(existingId) && iptPw.equals(existingPw)) {
        	// 세션에 저장
			session.setAttribute("id", iptId);
			response.sendRedirect("/Library/MainPage.jsp");
        	isLogin = true;
        }

		// 에러페이지로 이동
        boolean isId = true;
		if(isLogin == false) {
			if(!iptId.equals(existingId)) {
				loginPagePath += "id=false";
				isId= false;
			}
			if(isId == false) {
				loginPagePath += "&";
			}
			if(!iptPw.equals(existingPw)) {
				loginPagePath += "pw=false";
			}
			response.sendRedirect(loginPagePath);
			
		}
		
	}

}
