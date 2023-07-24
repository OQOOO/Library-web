package kr.ac.kopo.controller.spring;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.dao.BoardDAO;
import kr.ac.kopo.mapper.SqlMapper;
import kr.ac.kopo.vo.BoardVO;

@Controller
public class ViewController {
	
	private final SqlMapper sqlMapper;
	
	@Autowired
    public ViewController(SqlMapper sqlMapper) {
        this.sqlMapper = sqlMapper;
    }

	@RequestMapping("/GoAdminBoard.sp")
	public String goAdminBoard(Model model) {
		BoardDAO dao = new BoardDAO();
		
		List<BoardVO> postList = dao.boardView();
		model.addAttribute("postList", postList);
		return "/admin/AdminBoardPage";
	}
	
	@RequestMapping("/GoAdminPost.sp")
	public String goAdminPost(Model model, int seq) {
		BoardDAO dao = new BoardDAO();

		dao.addViews(seq);
		BoardVO vo = dao.postView(seq);
		model.addAttribute("vo", vo);
		
		List<BoardVO> commentList = sqlMapper.getCommentList(seq);
		model.addAttribute("commentList", commentList);
		
		return "/admin/AdminPostPage";
	}
	
	@RequestMapping("/ViewPost.sp")
	public String viewPost(Model model, int seq) {
		BoardDAO dao = new BoardDAO();
		dao.addViews(seq);
		BoardVO vo = dao.postView(seq);
		
		List<BoardVO> commentList = sqlMapper.getCommentList(seq);
		model.addAttribute("commentList", commentList);
		
		
		model.addAttribute("vo", vo);
		
		return "/userBoard/Post";
	}
	
	@RequestMapping("/InsertComment.sp")
	public String insertComment(HttpSession session, Model model, String content, int seq) {
		String uid = (String) session.getAttribute("id");
		BoardVO vo = new BoardVO();
		System.out.println("test");
		vo.setSeq(seq);
		vo.setUserId(uid);
		vo.setContent(content);
		sqlMapper.insertComment(vo);
		
		return "redirect:/GoAdminPost.sp?seq="+seq; 
	}
	
	@RequestMapping("/delComment.sp")
	public String delComment(Model model, int seq, int commentId) {
		sqlMapper.delComment(commentId);
		
		return "redirect:/GoAdminPost.sp?seq="+seq;
	}
	
	@RequestMapping("/delPostByAdmin.sp")
	public String delPostByAdmin(Model model, int seq) {
		BoardDAO dao = new BoardDAO();
		dao.deleteBoard(seq);
		
		return "redirect:/GoAdminBoard.sp";		
	}
}
