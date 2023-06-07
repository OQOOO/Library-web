package kr.ac.kopo.controller.book;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.dao.LibraryBooksDAO;
import kr.ac.kopo.vo.BookVO;

public class BookSearchController implements Controller{
 @Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
	 
	 // ������ �޾ƿ���
	 	String title = null;
		String writer = null;
		String publisher = null;
		
		
		List<String> selectList = new ArrayList<>();
		
		// ���� �뿩 �� ������
		if (request.getParameter("re").equals("bookRentCon")) {
			selectList.add((String)request.getAttribute("bookName"));
			selectList.add((String)request.getAttribute("writer"));
			selectList.add((String)request.getAttribute("publisher"));
			
			title = (String)request.getAttribute("bookName");
			writer = (String)request.getAttribute("writer");
			publisher = (String)request.getAttribute("publisher");
			System.out.println("test");
			
		// �Ϲ� �˻��� ������	
		} else {
			
			title = request.getParameter("title");
			writer = request.getParameter("writer");
			publisher = request.getParameter("publisher");
			
			selectList.add(title);
			selectList.add(writer);
			selectList.add(publisher);
		}
		
		
		//
		LibraryBooksDAO dao = new LibraryBooksDAO();
		BookVO vo = new BookVO();
		vo.setBookName(title);
		vo.setWriter(writer);
		vo.setPublisher(publisher);
		
		
		List<BookVO> bookList = dao.searchBooks(vo);
		
		// ��� ����
		request.setAttribute("booksInfo", bookList);
		request.setAttribute("userSelect", selectList);
		
		// ��� ��ȯ
		return "/bookRental/BookSearch.jsp";
	}
}
