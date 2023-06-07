package kr.ac.kopo.controller.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.dao.LibraryBooksDAO;
import kr.ac.kopo.vo.BookVO;

public class BookReturnController implements Controller{
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String isbn = request.getParameter("isbn");
		String re = "GetRentalBooks.do?rePage=RentBooksPage";
		
		LibraryBooksDAO dao = new LibraryBooksDAO();
		BookVO vo = dao.searchBookWithIsbn(isbn);
		
		if (vo.getRentUserId() == null || !vo.getRentUserId().equals(id)) {
			System.out.println("�뿩���� ���� �����Դϴ�.");
			re = "./bookRental/RentBooksPage.jsp";
		}
		
		dao.returnBook(isbn);
		System.out.println("�ݳ��� �Ϸ�Ǿ����ϴ�.");
		return re;
	}

}
