package kr.ac.kopo.controller.pageMove;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;

public class GoAdminUserManagementPage implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		return "/admin/AdminUserManagementPage.jsp";
	}
}
