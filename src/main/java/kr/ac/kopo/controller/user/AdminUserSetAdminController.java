package kr.ac.kopo.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.dao.LibraryBooksDAO;
import kr.ac.kopo.dao.RentBooksDAO;
import kr.ac.kopo.dao.UserDAO;

public class AdminUserSetAdminController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		UserDAO dao = new UserDAO();
		LibraryBooksDAO bDao = new LibraryBooksDAO();
		RentBooksDAO rDao = new RentBooksDAO();
		
		String id = request.getParameter("userId");
		System.out.println("성공");
		//검색값유지용
		request.setAttribute("select", request.getParameter("adminSelect"));
		request.setAttribute("value", request.getParameter("adminInput"));
		
		bDao.returnBookWithId(id);
		rDao.returnBook(id);
		dao.giveAdminRights(id);
		
		return "AdminUserSearch.do?re=cont";
	}

}
