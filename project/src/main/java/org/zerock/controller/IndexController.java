package org.zerock.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.MemberVO;

@Controller  //@Controller사용해서 스프링 컨트롤러 클래스 등록 이거 연결해주는 쪽은  servlet-context.xml 36번째줄 보면 알꺼

public class IndexController {

	//메인화면//메인화면 뷰페이지 경로가 /WEB-INF/views /index.jsp
	@RequestMapping("/indexx")
	public String index() {return "indexx";}
	
	//회사소개 화면//메인화면 뷰페이지 경로가 /WEB-INF/views /welcome_company.jsp
	@RequestMapping("/welcome_company")
	public String welcome_company() {return "company/welcome_company";}
	
	//팀 화면 //메인화면 뷰페이지 경로가 /WEB-INF/views /team.jsp
	@RequestMapping("/team")
	public String team() {return "company/team";}
	
	//관리자 로그인 폼//메인화면 뷰페이지 경로가 /WEB-INF/views /admin/admin_index.jsp
	@RequestMapping("/admin_index") 
	public String admin_index(){return "admin/admin_index";}
	
	//마이페이지 /메인화면 뷰페이지 경로가 /WEB-INF/views /company/my_page.jsp
	@RequestMapping("/my_page") 
	public String my_page(){return "company/mypage/my_page";}
	
	

	
	//게시판 부분 //메인화면 뷰페이지 경로가 /WEB-INF/views/custom.jsp
	@RequestMapping("/custom")
	public String custom(MemberVO mb,HttpServletResponse response,HttpServletRequest request ,HttpSession session)throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();//세션객체 생성
		String mem_id=(String)session.getAttribute("mem_id");

			return "company/custom";    
		
	}//custom()
	
}//IndexController()
