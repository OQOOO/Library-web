package kr.ac.kopo.controller.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.dao.LibraryBooksDAO;
import kr.ac.kopo.vo.BookVO;

public class AdminAddBookController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		LibraryBooksDAO dao = new LibraryBooksDAO();
		BookVO vo = new BookVO();
		
		String isbn = request.getParameter("isbn");
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String publisher = request.getParameter("publisher");
		boolean check = true;
		
		if(!isbn.matches("^\\d{13}$")) {
			request.setAttribute("isbnErrer", "올바른 ISBN 형식이 아닙니다.");
			check = false;
		}
		if(title.equals("")) {
			request.setAttribute("titleErrer", "제목을 입력하세요");
			check = false;
		}
		if(writer.equals("")) {
			request.setAttribute("writerErrer", "작가를 입력하세요");
			check = false;
		}
		if(publisher.equals("")) {
			request.setAttribute("publisherErrer", "출판사를 입력하세요");
			check = false;
		}

		String re = "/admin/AdminBookManagementPage.jsp";
		if (check) {
			vo.setIsbn(isbn);
			vo.setBookName(title);
			vo.setWriter(writer);
			vo.setPublisher(publisher);
			
			dao.bookRegistration(vo);
			System.out.println("AdminBookController에서 출력 : 도서 추가 컨트롤러 작동성공");
			
		} else {
			
			re = "/admin/AdminAddBookPage.jsp";
		}
		
		return re;
	}
}
