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
		
		// ������, ���� ��Ʈ ������ ���� ���� ����
		LibraryBooksDAO dao = new LibraryBooksDAO();
		
		if (!dao.isbnChack(isbn)) {
			dao.returnBook(isbn);
			dao.bookRemove(isbn);
		} else {
			System.out.println("AdminRemoveBookController���� ��µ� : ��������");
			request.setAttribute("isbnErrer", "�������� �ʴ� ISBN�Դϴ�.");
			re = "AdminRemoveBookPage.do";
		}
		
		return re;
	}

}
