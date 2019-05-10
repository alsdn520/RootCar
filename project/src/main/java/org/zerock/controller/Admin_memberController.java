package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.zerock.service.Admin_MemberService;

@Controller

public class Admin_memberController {

	@Autowired
	private Admin_MemberService admin_MemberService;
	
/*	//관리자 회원목록
	@RequestMapping("/admin_member_list")
	public String admin_mem_list(Model listM
								, HttpServletRequest request 
								, HttpServletResponse response
								, @ModelAttribute AdminVO m)throws Exception {
		
		response.setContentType("text/html/charset=UTF-8");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		//세션 객체 생성 
		String admin_id=(String)session.getAttribute("admin_id");//관리자 세션아이디를 구함 
		
		if(admin_id == null) {
			out.println("<script>");
			out.println("alert('다시 로그인하세요');");
			out.println("location='admin_index';");
			out.println("</script>");
		}else {
			
		}
		return null;
	}//admin_member_list
	*/
}
