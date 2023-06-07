package kr.ac.kopo.controller.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.dao.LibraryBooksDAO;

public class AdminRemoveBookController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String isbn = request.getParameter("isbn");
		String re = "/admin/AdminBookManagementPage.jsp";
		
		// 도서관, 유저 랜트 데이터 동시 삭제 진행
		LibraryBooksDAO dao = new LibraryBooksDAO();
		
		if (!dao.isbnChack(isbn)) {
			dao.returnBook(isbn);
			dao.bookRemove(isbn);
		} else {
			System.out.println("AdminRemoveBookController에서 출력됨 : 삭제실패");
			request.setAttribute("isbnErrer", "존재하지 않는 ISBN입니다.");
			re = "AdminRemoveBookPage.do";
		}
		
		return re;
	}

}
