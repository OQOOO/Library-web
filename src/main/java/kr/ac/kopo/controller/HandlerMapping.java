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
import kr.ac.kopo.controller.pageMove.GoAdminAddBookPage;
import kr.ac.kopo.controller.pageMove.GoAdminBookManagementPage;
import kr.ac.kopo.controller.pageMove.GoAdminMainPage;
import kr.ac.kopo.controller.pageMove.GoAdminRemoveBookPageController;
import kr.ac.kopo.controller.pageMove.GoAdminUserBookManagementPageController;
import kr.ac.kopo.controller.pageMove.GoAdminUserManagementPage;
import kr.ac.kopo.controller.pageMove.GoLoginPageController;
import kr.ac.kopo.controller.pageMove.GoMyPageController;
import kr.ac.kopo.controller.pageMove.GoPwCheckPageController;
import kr.ac.kopo.controller.pageMove.GoSearchBookPageController;
import kr.ac.kopo.controller.pageMove.GoSingupPageController;
import kr.ac.kopo.controller.pageMove.IndexMainController;
import kr.ac.kopo.controller.user.*;

public class HandlerMapping {
	private Map<String, Controller> mappings;
	
	public HandlerMapping() {
		System.out.println("�ڵ鷯 ���� ���� ����");
		mappings = new HashMap<>();
		
		// �ܼ� ������ �̵�
		mappings.put("/IndexMain.do", new IndexMainController()); // ���������� �Ǵ� ����������
		mappings.put("/SearchBookPage.do", new GoSearchBookPageController());
		mappings.put("/MyPage.do", new GoMyPageController());
		mappings.put("/LoginPage.do", new GoLoginPageController());
		mappings.put("/SingupPage.do", new GoSingupPageController());

		mappings.put("/PwCheckPage.do", new GoPwCheckPageController());
		mappings.put("/UserInfo.do", new UserInfoController());
		
		
		// ����
		mappings.put("/test", new Test());
		mappings.put("/Login.do", new LoginController());
		mappings.put("/Logout.do", new LogoutController());
		mappings.put("/PasswordCheck.do", new PasswordCheckController());
		mappings.put("/ViewUserInfo.do", new UserInfoController());
		mappings.put("/Singup.do", new SingupController());
		mappings.put("/UserDateUpdate.do", new UserDataUpdateController());
		mappings.put("/Withdrawal.do", new WithdrawalController());
		mappings.put("/UserDataRemove.do", new UserDataRemoveController());
		
		// å ����, �ݳ�,
		mappings.put("/BookSearch.do", new BookSearchController());
		mappings.put("/BookRent.do", new BookRentController());
		mappings.put("/BookReturn.do", new BookReturnController());
		
		mappings.put("/GetRentalBooks.do", new GetRentalBookListController());
		
		// ����
		mappings.put("/BoardView.do", new BoardViewController());
		mappings.put("/InsertBoard.do", new BoardInsertController());
		mappings.put("/InsertBoard2.do", new BoardInsertController2());
		mappings.put("/PostView.do", new PostViewController());
		mappings.put("/DeleteBoard.do", new DeleteBoardController());
		mappings.put("/UpdateBoard.do", new UpdateBoardController());
		mappings.put("/UpdateBoard2.do", new UpdateBoardController2());
		
		
		//////////////////////////////////////////////////////////////
		// ������ ������
		//////////////////////////////////////////////////////////////
		
		// ������ �̵�
		mappings.put("/BookManagementPage.do", new GoAdminBookManagementPage());
		mappings.put("/AdminMainPage.do", new GoAdminMainPage());
		mappings.put("/AdminAddBookPage.do", new GoAdminAddBookPage());
		mappings.put("/AdminRemoveBookPage.do", new GoAdminRemoveBookPageController());
		
		mappings.put("/AdminUserManagementPage.do", new GoAdminUserManagementPage());
		
		// ���� ����
		mappings.put("/AdminBookSearch.do", new AdminBookSearchController());
		mappings.put("/AddBook.do", new AdminAddBookController());
		mappings.put("/AdminRemoveBook.do", new AdminRemoveBookController());
		
		
		// ���� ����
		mappings.put("/AdminUserSearch.do", new AdminUserSearchController());
		mappings.put("/AdminUserRemove.do", new AdminUserRemoveController());
		mappings.put("/AdminSetUserAdmin.do", new AdminUserSetAdminController());
		
		mappings.put("/AdminUserBookManagementPage.do", new GoAdminUserBookManagementPageController());
		mappings.put("/BookReturnAdmin.do", new BookReturnAdminController());

		
	}
	
	public Controller getController(String path) {
		return mappings.get(path);
	}
	
}
