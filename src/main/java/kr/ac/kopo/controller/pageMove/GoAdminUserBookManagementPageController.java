package kr.ac.kopo.controller.pageMove;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.dao.RentBooksDAO;
import kr.ac.kopo.vo.BookVO;

public class GoAdminUserBookManagementPageController implements Controller{
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String id = request.getParameter("userId");
		request.setAttribute("userId", id);
		
		RentBooksDAO dao = new RentBooksDAO();
		List<BookVO> voList = dao.getUserRentData(id);
		request.setAttribute("bookList", voList);
		
		return "/admin/AdminUserBookManagementPage.jsp";
	}
}
