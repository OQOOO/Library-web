package kr.ac.kopo.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.dao.LibraryBooksDAO;
import kr.ac.kopo.dao.RentBooksDAO;
import kr.ac.kopo.dao.UserDAO;

public class AdminUserRemoveController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("userId");
		System.out.println(id);
		
		UserDAO userDao = new UserDAO();
		LibraryBooksDAO bookDao = new LibraryBooksDAO();
		RentBooksDAO rentDao = new RentBooksDAO();
		
		userDao.userDataRemove(id);
		bookDao.returnBookWithId(id);
		rentDao.returnBook(id);
		
		
		request.setAttribute("select", request.getParameter("adminSelect"));
		request.setAttribute("value", request.getParameter("adminInput"));
		
		
		return "AdminUserSearch.do?re=cont";
	}

}
