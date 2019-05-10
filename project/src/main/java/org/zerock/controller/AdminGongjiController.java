package org.zerock.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.zerock.domain.GongjiVO;
import org.zerock.service.GongjiService;

@Controller
public class AdminGongjiController {

	@Autowired
	private GongjiService gongjiService;
	
	//목록보기
	@RequestMapping("gongji_list")
	public String gongji_list(@ModelAttribute GongjiVO g,HttpServletRequest request,Model m) throws Exception {
		//@ModelAttribute GongjiVO g:g 객체 생성효과가 발생한다.
		
		/* 페이징->쪽나누기 */
		int page=1;
		int limit=7; //한페이지 보여지는 목록개수
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));	  
		} //get으로 전달된 쪽번호가 있다면 정수 숫자로 바꿔서 쪽번호 저장

		//검색어와 검색필드
		String find_field=request.getParameter("find_field");
		String find_name=request.getParameter("find_name");
		g.setFind_field(find_field);
		g.setFind_name("%"+find_name+"%"); //%는 오라클 검색연산자로 하나이상의 임의의 문자와 대응

		int totalCount=this.gongjiService.getRowCount(g);//총레코드개수,검색 전후 레코드개수		
		//System.out.println("totalCount="+totalCount);		
		/*페이징->시작행,끝행 번호*/
		g.setStartrow((page-1)*7+1);
		g.setEndrow(g.getStartrow()+limit-1);

		List<GongjiVO> glist=this.gongjiService.getGongjiList(g);//목록
		//System.out.println(blist.size());

		/* 페이징 연산 */
		//총페이지 수
		int maxpage=(int)((double)totalCount/limit+0.95);
		//시작페이지->1,11,21..
		int startpage=(((int)((double)page/10+0.9))-1)*10+1;
		//System.out.println(startpage);

		//마지막 페이지
		int endpage=maxpage;
		if(endpage>startpage+10-1) 
			endpage=startpage+10-1;

		m.addAttribute("glist",glist); //blist 키이름에 목록 저장
		m.addAttribute("listcount",totalCount); //listcount키이름에 레코드개수 저장
		m.addAttribute("page",page);
		m.addAttribute("startpage",startpage);
		m.addAttribute("endpage",endpage);
		m.addAttribute("maxpage",maxpage);
		m.addAttribute("find_field",find_field);
		m.addAttribute("find_name",find_name);

		return "./company/gongji/gongji_list"; 

	} //gongji_list()


	//공지사항 내용보기
	@RequestMapping("/gongji_cont")
	public ModelAndView gongji_cont(@RequestParam("gongji_no") int gongji_no,@RequestParam("page") int page,@ModelAttribute GongjiVO g,
			HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=UTF-8");

		List<GongjiVO> g_list=new ArrayList<>();
		g=this.gongjiService.getGongjiCont(gongji_no);

		//System.out.println(r_list.size());
		ModelAndView cm=new ModelAndView();
		cm.addObject("g",g);
		cm.addObject("page",page);
		cm.addObject("g_list",g_list);
		cm.setViewName("./company/gongji/gongji_cont");

		return cm;

	} //gongji_cont()

	//관리자 부분입니다 관리자 부분입니다 관리자 부분입니다 관리자 부분입니다 관리자 부분입니다 관리자 부분입니다 
	//관리자 부분입니다 관리자 부분입니다 관리자 부분입니다 관리자 부분입니다 관리자 부분입니다 관리자 부분입니다 
	//관리자 부분입니다 관리자 부분입니다 관리자 부분입니다 관리자 부분입니다 관리자 부분입니다 관리자 부분입니다 
	//↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
	//공지사항 글쓰기 폼
	@RequestMapping("/admin_gongji_write")
	public String g_write(Model m,HttpServletResponse response,HttpServletRequest request,HttpSession session) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();//세션객체 생성
		String admin_id=(String)session.getAttribute("admin_id");
		//세션 아이디를 구함 
		if(admin_id ==null) {
			out.println("<script>");
			out.print("alert('다시 로그인 하세요');");
			out.println("location='admin_index';");
			out.println("</script>");
		}else {
			int page=1;
			if(request.getParameter("page")!=null) {
				page=Integer.parseInt(request.getParameter("page"));
				//get으로 전달된 번호값을 정수 숫자로 바꿔서 저장
			}
			m.addAttribute("page",page);
		}
		return "admin/admin_gongji_write"; //WEB-INF/views/gongji/admin_g_write.jsp
	} //admin_gongji_write()
	
	//공지사항 저장
	@RequestMapping("/admin_gongji_write_ok")
	public String g_write_ok(@ModelAttribute GongjiVO g,HttpServletResponse response,HttpServletRequest request,HttpSession session) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();//세션객체 생성
		String admin_id=(String)session.getAttribute("admin_id");
		//세션 아이디를 구함 
		if(admin_id ==null) {
			out.println("<script>");
			out.print("alert('다시 로그인 하세요');");
			out.println("location='admin_index';");
			out.println("</script>");
		}else {
			this.gongjiService.insertGongji(g);
			
			return "redirect:/admin_gongji_list";//관리자 공지사항 목록 매핑으로 이동
		}
		return null;
	} //admin_gongji_write_ok
	
	//목록보기
	@RequestMapping("/admin_gongji_list")
	public String admin_gongji_list(@ModelAttribute GongjiVO g,HttpServletResponse response,HttpServletRequest request,HttpSession session,
			Model m) throws Exception {
		//@ModelAttribute GongjiVO g:g 객체 생성효과가 발생한다.
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();//세션객체 생성
		String admin_id=(String)session.getAttribute("admin_id");
		//세션 아이디를 구함 
		if(admin_id ==null) {
			out.println("<script>");
			out.print("alert('다시 로그인 하세요');");
			out.println("location='admin_index';");
			out.println("</script>");
		}else {
			/* 페이징->쪽나누기 */
			int page=1;
			int limit=7; //한페이지 보여지는 목록개수
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));	  
			} //get으로 전달된 쪽번호가 있다면 정수 숫자로 바꿔서 쪽번호 저장
			
			//검색어와 검색필드
			String find_field=request.getParameter("find_field");
			String find_name=request.getParameter("find_name");
			g.setFind_field(find_field);
			g.setFind_name("%"+find_name+"%"); //%는 오라클 검색연산자로 하나이상의 임의의 문자와 대응
			  
			int totalCount=this.gongjiService.getRowCount(g);//총레코드개수,검색 전후 레코드개수		
			//System.out.println("totalCount="+totalCount);		
			/*페이징->시작행,끝행 번호*/
			g.setStartrow((page-1)*7+1);
			g.setEndrow(g.getStartrow()+limit-1);
					
			List<GongjiVO> glist=this.gongjiService.getGongjiList(g);//목록
			//System.out.println(blist.size());
					
			/* 페이징 연산 */
			//총페이지 수
			int maxpage=(int)((double)totalCount/limit+0.95);
			//시작페이지->1,11,21..
			int startpage=(((int)((double)page/10+0.9))-1)*10+1;
			//System.out.println(startpage);

			//마지막 페이지
			int endpage=maxpage;
			if(endpage>startpage+10-1) 
				endpage=startpage+10-1;
					
			m.addAttribute("glist",glist); //blist 키이름에 목록 저장
			m.addAttribute("listcount",totalCount); //listcount키이름에 레코드개수 저장
			m.addAttribute("page",page);
			m.addAttribute("startpage",startpage);
			m.addAttribute("endpage",endpage);
			m.addAttribute("maxpage",maxpage);
			m.addAttribute("find_field",find_field);
			m.addAttribute("find_name",find_name);
			     
			return "admin/admin_gongji_list"; 
			
		}
		return null;
	} //admin_gongji_list()
	
	//공지사항 내용보기+수정폼+삭제폼
	@RequestMapping("/admin_gongji_cont")
	public ModelAndView admin_gongji_cont(@RequestParam("gongji_no") int gongji_no,@RequestParam("state") String state,
			@RequestParam("page") int page,@ModelAttribute GongjiVO g,HttpServletResponse response,HttpServletRequest request,HttpSession session) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();//세션객체 생성
		String admin_id=(String)session.getAttribute("admin_id");
		//세션 아이디를 구함 
		if(admin_id ==null) {
			out.println("<script>");
			out.print("alert('다시 로그인 하세요');");
			out.println("location='admin_index';");
			out.println("</script>");
		}else {
			List<GongjiVO> g_list=new ArrayList<>();
			if(state.equals("cont")) { //내용보기일때만 조회수 증가(aop를 통한 트랜잭션 적용)
				g=this.gongjiService.getGongjiCont(gongji_no);
			}else { //답변폼,수정폼,삭제폼일때는 조회수 증가 안함->트랜잭션 적용안함
				g=this.gongjiService.getGongjiCont2(gongji_no);
			}
			//System.out.println(r_list.size());
			ModelAndView cm=new ModelAndView();
			cm.addObject("g",g);
			cm.addObject("page",page);

			if(state.equals("cont")) { //내용보기
				cm.addObject("g_list",g_list);
				cm.setViewName("admin/admin_gongji_cont");
			}else if(state.equals("edit")) { //수정폼
				cm.setViewName("admin/admin_gongji_edit");
			}else if(state.equals("del")) { //삭제폼
				cm.setViewName("admin/admin_gongji_del");
			}
			return cm;
		}
		return null;
	} //admin_gongji_cont()
	
	//관리자페이지 공지 수정 완료
	@RequestMapping("/admin_gongji_edit_ok")
	public String admin_gongji_edit_ok(@ModelAttribute GongjiVO g,HttpServletResponse response,HttpServletRequest request,HttpSession session) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();//세션객체 생성
		String admin_id=(String)session.getAttribute("admin_id");
		//세션 아이디를 구함 
		if(admin_id ==null) {
			out.println("<script>");
			out.print("alert('다시 로그인 하세요');");
			out.println("location='admin_index';");
			out.println("</script>");
		}else {
			int page=1;
			if(request.getParameter("page")!=null) {
				page=Integer.parseInt(request.getParameter("page"));
			}

			GongjiVO db_pwd=this.gongjiService.getGongjiCont(g.getGongji_no()); //오라클로부터 비번을 가져옴
			if(!db_pwd.getGongji_pwd().equals(g.getGongji_pwd())) {
				out.println("<script>");
				out.println("alert('비번이 다릅니다!');");
				out.println("history.back();");
				out.println("</script>");
			}else {
				this.gongjiService.editGongji(g); //수정
				return "redirect:/admin_gongji_cont?gongji_no="+g.getGongji_no()+"&page="+page+"&state=cont"; //?뒤에 3개의 인자값이 get 방식으로 전달
			}
		}
		return null;
	} //admin_gongji_edit_ok()

	//관리자페이지 공지 완료
	@RequestMapping("/admin_gongji_del_ok")
	public String admin_gongji_del_ok(GongjiVO g,@RequestParam("page") int page,@RequestParam("del_pwd") String del_pwd,
			HttpServletResponse response,HttpServletRequest request,HttpSession session) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();//세션객체 생성
		String admin_id=(String)session.getAttribute("admin_id");
		//세션 아이디를 구함 
		if(admin_id ==null) {
			out.println("<script>");
			out.print("alert('다시 로그인 하세요');");
			out.println("location='admin_index';");
			out.println("</script>");
		}else {
			GongjiVO db_pwd=this.gongjiService.getGongjiCont(g.getGongji_no()); //오라클로부터 비번을 가져옴
			if(!db_pwd.getGongji_pwd().equals(del_pwd)) {
				out.println("<script>");
				out.println("alert('비번이 다릅니다!');");
				out.println("history.back();");
				out.println("</script>");
			}else {
				this.gongjiService.delGongji(g); //삭제
				return "redirect:/admin_gongji_list";
			}
		}
		return null;
	} //admin_gongji_del_ok()
}
