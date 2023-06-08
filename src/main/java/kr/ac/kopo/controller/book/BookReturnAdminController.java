package kr.ac.kopo.controller.book;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.dao.LibraryBooksDAO;
import kr.ac.kopo.dao.RentBooksDAO;
import kr.ac.kopo.vo.BookVO;

public class BookReturnAdminController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("rentUserId");
		String isbn = request.getParameter("isbn");
		
		LibraryBooksDAO dao = new LibraryBooksDAO();
		dao.returnBook(isbn);
		request.setAttribute("userId", id);
		
		RentBooksDAO dao2 = new RentBooksDAO();
		List<BookVO> voList = dao2.getUserRentData(id);
		request.setAttribute("bookList", voList);
		
		return "/admin/AdminUserBookManagementPage.jsp";
	}

}
