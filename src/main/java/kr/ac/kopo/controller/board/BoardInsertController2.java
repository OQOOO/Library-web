package kr.ac.kopo.controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.dao.BoardDAO;
import kr.ac.kopo.vo.BoardVO;

public class BoardInsertController2 implements Controller{
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		BoardDAO dao = new BoardDAO();
		BoardVO vo = new BoardVO();
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		vo.setTitle(request.getParameter("title"));
		vo.setUserId(id);
		vo.setContent(request.getParameter("content"));
		dao.insertBoard(vo);
		
		return "BoardView.do";
	}

}
