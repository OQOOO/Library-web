package kr.ac.kopo.controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.dao.BoardDAO;
import kr.ac.kopo.vo.BoardVO;

public class UpdateBoardController implements Controller{
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		BoardDAO dao = new BoardDAO();
		int seq = Integer.parseInt(request.getParameter("seq"));
		BoardVO vo = dao.postView(seq);
		request.setAttribute("vo", vo);
		
		return "./userBoard/UpdateBoard.jsp";
	}
}
