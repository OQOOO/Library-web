package kr.ac.kopo.controller.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.dao.BoardDAO;
import kr.ac.kopo.vo.BoardVO;

public class BoardViewController implements Controller{
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

		BoardDAO dao = new BoardDAO();
		List<BoardVO> postList = dao.boardView();
		request.setAttribute("postList", postList);
		return "/userBoard/Board.jsp";
	}
}
