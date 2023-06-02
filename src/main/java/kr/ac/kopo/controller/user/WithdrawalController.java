package kr.ac.kopo.controller.user;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.dao.RentBooksDAO;
import kr.ac.kopo.dao.UserDAO;
import kr.ac.kopo.vo.BookVO;
import kr.ac.kopo.vo.UserVO;

public class WithdrawalController implements Controller{
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		UserDAO dao = new UserDAO();
		UserVO vo = new UserVO();
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		RentBooksDAO bookDao = new RentBooksDAO();
		List<BookVO> bookLi = new ArrayList<>();
		
		// 유저 정보 vo
		vo.setId(id);

		// 대여한 책 목록
		bookLi = bookDao.getUserRentData(id);
		
		// 만약 빌려간 책이 있다면
		if(0 < bookLi.size()) {
			request.setAttribute("isBookRent", "대여중인 도서가 있어 탈퇴가 불가능합니다.");
			return "MyPage.jsp";
		}
		return "./myPages/PwCheckWithdrawal.jsp";
	}

}
