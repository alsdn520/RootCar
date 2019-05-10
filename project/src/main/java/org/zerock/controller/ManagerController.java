package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller  //@Controller사용해서 스프링 컨트롤러 클래스 등록 이거 연결해주는 쪽은  servlet-context.xml 36번째줄 보면 알꺼

public class ManagerController {

	//index.jsp메인화면 
	@RequestMapping("/manager")
	public String manager() {
		return "manager/blog-archive";
		//메인화면 뷰페이지 경로가 /WEB-INF/views /index.jsp
	}
}
	