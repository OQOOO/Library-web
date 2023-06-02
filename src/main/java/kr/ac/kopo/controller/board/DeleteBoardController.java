package kr.ac.kopo.controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.dao.BoardDAO;

public class DeleteBoardController implements Controller{
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		int seq = Integer.parseInt(request.getParameter("postSeq"));
		new BoardDAO().deleteBoard(seq);
		return "BoardView.do";
	}

}
