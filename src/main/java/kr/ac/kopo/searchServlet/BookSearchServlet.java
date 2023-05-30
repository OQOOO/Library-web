package kr.ac.kopo.searchServlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.dao.LibraryBooksDAO;
import kr.ac.kopo.vo.BookVO;

/**
 * Servlet implementation class BookSearchServlet
 */
@WebServlet("/BookSearchServlet")
public class BookSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String publisher = request.getParameter("publisher");
		
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
		System.out.println("bookSearchServlet¿¡¼­ Ãâ·ÂµÊ : " + bookList);
		request.setAttribute("booksInfo", bookList);
		request.setAttribute("userSelect", selectList);
		request.getRequestDispatcher("BookSearch.jsp").forward(request, response);
	}

}
