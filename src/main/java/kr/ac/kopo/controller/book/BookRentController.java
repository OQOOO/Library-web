package kr.ac.kopo.controller.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.dao.LibraryBooksDAO;

import kr.ac.kopo.vo.BookVO;


public class BookRentController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String isbn = request.getParameter("isbn");
		
		// 검색값 유지용
		String bookName = request.getParameter("bookName");
		String writer = request.getParameter("writer");
		String publisher = request.getParameter("publisher");
		request.setAttribute("bookName", bookName);
		request.setAttribute("writer", writer);
		request.setAttribute("publisher", publisher);
		
		//
		LibraryBooksDAO dao = new LibraryBooksDAO();
		BookVO vo = dao.searchBookWithIsbn(isbn);
		
		if (vo.getIsbn() == null) {
			System.out.println("존재하지 않는 도서.");
		}
		
		if (vo.getRentUserId() != null) {
			System.out.println("해당 도서는 이미 대여중.");
		}
		
		// isbn과 id 전송
		vo.setRentUserId(id);
		dao.rentBook(vo);
		System.out.println("대여가 완료되었습니다.");
		
		
		return "BookSearch.do?re=bookRentCon";
	}
}
