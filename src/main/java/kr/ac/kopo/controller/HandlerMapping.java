package kr.ac.kopo.controller;

import java.util.HashMap;
import java.util.Map;

import kr.ac.kopo.controller.board.BoardInsertController;
import kr.ac.kopo.controller.board.BoardInsertController2;
import kr.ac.kopo.controller.board.BoardViewController;
import kr.ac.kopo.controller.board.DeleteBoardController;
import kr.ac.kopo.controller.board.PostViewController;
import kr.ac.kopo.controller.board.UpdateBoardController;
import kr.ac.kopo.controller.board.UpdateBoardController2;
import kr.ac.kopo.controller.book.*;
import kr.ac.kopo.controller.user.*;

public class HandlerMapping {
	private Map<String, Controller> mappings;
	
	public HandlerMapping() {
		System.out.println("핸들러 매핑 실행 성공");
		mappings = new HashMap<>();
		//mappings.put("/key", new Controller상속받은객체);
		mappings.put("/test", new Test());
		mappings.put("/BookSearch.do", new BookSearchController());
		mappings.put("/Login.do", new LoginController());
		mappings.put("/Logout.do", new LogoutController());
		mappings.put("/PasswordCheck.do", new PasswordCheckController());
		mappings.put("/ViewUserInfo.do", new UserInfoController());
		mappings.put("/Singup.do", new SingupController());
		mappings.put("/UserInfo.do", new UserInfoController());
		mappings.put("/UserDateUpdate.do", new UserDataUpdateController());
		
		// 책 대출, 반납,
		mappings.put("/BookRent.do", new BookRentController());
		mappings.put("/BookReturn.do", new BookReturnController());
		
		mappings.put("/GetRentalBooks.do", new GetRentalBookListController());
		mappings.put("/Withdrawal.do", new WithdrawalController());
		mappings.put("/UserDataRemove.do", new UserDataRemoveController());
		
		// 보드
		mappings.put("/BoardView.do", new BoardViewController());
		mappings.put("/InsertBoard.do", new BoardInsertController());
		mappings.put("/InsertBoard2.do", new BoardInsertController2());
		mappings.put("/PostView.do", new PostViewController());
		mappings.put("/DeleteBoard.do", new DeleteBoardController());
		mappings.put("/UpdateBoard.do", new UpdateBoardController());
		mappings.put("/UpdateBoard2.do", new UpdateBoardController2());
		
		
	}
	
	public Controller getController(String path) {
		return mappings.get(path);
	}
	
}
