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
	 	String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String publisher = request.getParameter("publisher");
		
		// ����Ͻ� ���� ����
		LibraryBooksDAO dao = new LibraryBooksDAO();
		BookVO vo = new BookVO();
		vo.setBookName(title);
		vo.setWriter(writer);
		vo.setPublisher(publisher);
		
		List<String> selectList = new ArrayList<>();
		if(title != "") {
			selectList.add(title);
		}
		if(writer !="") {
			selectList.add(writer);
		}
		if(publisher !="") {
			selectList.add(publisher);
		}
		
		List<BookVO> bookList = dao.searchBooks(vo);
		
		// ��� ����
		request.setAttribute("booksInfo", bookList);
		request.setAttribute("userSelect", selectList);
		
		// ��� ��ȯ
		return "BookSearch.jsp";
	}
}
