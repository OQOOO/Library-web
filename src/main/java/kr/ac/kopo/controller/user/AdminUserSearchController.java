package kr.ac.kopo.controller.user;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.dao.UserDAO;
import kr.ac.kopo.vo.UserVO;

public class AdminUserSearchController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		String select = request.getParameter("userSelect");
		String input = request.getParameter("searchValue");
		
		String req = request.getParameter("re");
		if (req.equals("page")) {
			select = request.getParameter("userSelect");
			input = request.getParameter("searchValue");
		} else {
			select = (String)request.getAttribute("select");
			input = (String)request.getAttribute("value");
		}
		
		
		UserDAO dao = new UserDAO();
		List<UserVO> userList = new ArrayList<>();
		
		switch (select) {
		case "id":
			userList = dao.searchMembersWithId(input);
			break;
		case "name":
			userList = dao.searchMembersWithName(input);
			break;
		case "email":
			userList = dao.searchMembersWithEmail(input);
			break;
		case "phoneNum":
			userList = dao.searchMembersWithPhoneNum(input);
			break;
		default:
			break;
		}
		
		request.setAttribute("adminSelect", select);
		request.setAttribute("adminInput", input);
		request.setAttribute("UsersInfo", userList);
		
		return "AdminUserManagementPage.do";
	}
}
