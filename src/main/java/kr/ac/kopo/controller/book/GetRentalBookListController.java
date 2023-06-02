package kr.ac.kopo.controller.book;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.dao.RentBooksDAO;
import kr.ac.kopo.vo.BookVO;

public class GetRentalBookListController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		RentBooksDAO dao = new RentBooksDAO();
		List<BookVO> bookList = dao.getUserRentData(id);
		request.setAttribute("bookList", bookList);
		String rePage = request.getParameter("rePage");
		if(rePage.equals("RentBooksPage")) {
			return "./bookRental/RentBooksPage.jsp";
		}
		return "./myPages/RentalBookList.jsp";
	}

}
