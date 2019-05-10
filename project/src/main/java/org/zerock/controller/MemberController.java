package org.zerock.controller;

import java.io.PrintWriter;
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
import org.zerock.domain.MemberVO;
import org.zerock.domain.PrVO;
import org.zerock.service.MemberService;

@Controller

public class MemberController {

	@Autowired 
	private MemberService memberService;
	
    //회원가입 버튼 부분 //메인화면 뷰페이지 경로가 /WEB-INF/views /member/member_join.jsp
    @RequestMapping("/member_join")
	public String member_join(Model m) {return "member/member_join";}
    
    //회원 로그인 부분//메인화면 뷰페이지 경로가 /WEB-INF/views /member/member_login.jsp
    @RequestMapping("/member_login")
  	public String member_login() {return "member/member_login";}
    
    //회원 로그인 이후 메인창 //메인화면 뷰페이지 경로가 /WEB-INF/views /member/member_login_ok_index.jsp
    @RequestMapping("/member_login_ok_index")
  	public String member_login_ok_index() {return "member/member_login_ok_index";}
    
    //회원 로그인 이후 매거진/여행/렌트 창 //메인화면 뷰페이지 경로가 /WEB-INF/views /member/member_login_ok_car_magazine_travel.jsp
    @RequestMapping("/member_login_ok_car_magazine_travel")
  	public String member_login_ok_car_magazine_travel() {return "member/member_login_ok_car_magazine_travel";}
    
    //회원 로그인 이후 고객센터창 //메인화면 뷰페이지 경로가 /WEB-INF/views /member/member_login_ok_custom.jsp
    @RequestMapping("/member_login_ok_custom")
  	public String member_login_ok_custom() {return "member/member_login_ok_custom";}    
    
    
  //아이디 중복검색
  	@RequestMapping("/member_idcheck")
  	public String member_idcheck(@RequestParam("id") String id,HttpServletResponse response)throws Exception{
  		response.setContentType("text/html;charset=UTF-8");
  		PrintWriter out=response.getWriter();
  		MemberVO db_id=this.memberService.idcheck(id);//아이디 중복검색
        int re=-1;//중복 아이디가 없는경우 반환
        if(db_id != null) {//중복아이디가 있는 경우
      	re=1;
       }
       out.println(re);//값 반환
  	return null;
    }//member_idcheck()

     
  //회원 가입 ok 여기서 db에 값저장됩니다 .
    @RequestMapping("/member_join_ok")
   public String member_join_ok(MemberVO mb){
      System.out.println(mb.getMember_Activation()); 
      this.memberService.insertMember(mb);
      return "redirect:/indexx";//관리자 메인 매핑으로 이동
   }//admin_login_ok()
    
   //아이디 /비번찾기에서 아이디 찾기 폼
    @RequestMapping("/member_id_find")
    public String member_id_find(HttpServletRequest request) {
    	String[] phone = {"* * * *", "010", "011", "019" };
		request.setAttribute("phone", phone);
		return "member/member_id_find";
    }
    //아이디 검색후 나오는 정보를 보여주는 폼
    @RequestMapping("/member_id_find_ok")
    public ModelAndView member_id_find_ok(  @ModelAttribute  MemberVO mf,
    										@RequestParam("mem_name") String mem_name,
    										@RequestParam("mem_phone") String mem_phone,
    										@RequestParam("mem_phone02") String mem_phone02,
    										@RequestParam("mem_phone03") String mem_phone03, HttpServletRequest request,HttpServletResponse response) throws Exception {
    	
    	//↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓코드시작
    	
    	System.out.println(mem_phone);
    	System.out.println(mem_phone02);
    	System.out.println(mem_phone03);
    	System.out.println(mem_name);
    	mf.setMem_name(mem_name);
    	mf.setMem_phone(mem_phone);
		mf.setMem_phone02(mem_phone02);
		mf.setMem_phone03(mem_phone03);
    	
    	List<MemberVO> db_id_find=this.memberService.member_id_find(mf);
    	System.out.println(db_id_find.size());
    	
    	ModelAndView db_id_find_ok=new ModelAndView("member/member_id_find_ok");
    	db_id_find_ok.addObject("db_id_find",db_id_find);
		return db_id_find_ok;
    }
    
	// 비번검색 폼
	@RequestMapping("/member_pwd_find")
	public String member_pwd_find() {
		return "member/member_pwd_find";
	}
	
	// 비번검색 후 넘어온 값으로 이메일 전송
    @RequestMapping("/member_pwd_find_ok")
    public String member_pwd_find_ok( @ModelAttribute MemberVO mpf,
    										@RequestParam("mem_id") String mem_id,
    										@RequestParam("mem_name") String mem_name,
    										@RequestParam("mem_email") String mem_email, HttpServletResponse response,HttpServletResponse request) throws Exception {
    	
    	response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
    	//↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓코드시작
		mpf.setMem_id(mem_id);
		mpf.setMem_name(mem_name);
		mpf.setMem_email(mem_email);
		MemberVO db_pwd_find_ok = this.memberService.member_pwd_find(mpf);
    	
		if (db_pwd_find_ok == null) {
			out.println("<script>");
			out.println("alert('회원을 찾을수 없습니다!');");
			out.println("history.back();");
			out.println("</script>");
		} else {
			/* 임시비번 메일 발송 */
			String to = mpf.getMem_email();//받는 사람 멜 주소
			String subject = "RooT, 회원님의 비밀번호 안내입니다.";//메일 제목
			String mail_cont = 
					"<html>"
					+ "<body>"
					+ "<h1>"
					+ mpf.getMem_name() 
					+ " 님의 비밀번호는 <br/><b>" 
					+ db_pwd_find_ok.getMem_pwd()
					+ "</b> 입니다."
					+ "</h1>"
					+ "</body>"
					+ "</html>";//메일 내용
			this.memberService.sendMail(to, subject, mail_cont);//실제 메일 발송	
			
			out.println("<script>");
			out.println("alert('이메일이 발송되었습니다!');");
			out.println("location='member_login';");
			out.println("</script>");
			
			//return "redirect:./member_login";
    }
		return null;
}
    
    
    //회원 로그인 성공시 로그인이 성공한 메인창이동 
    @RequestMapping("/member_login_ok")
 	public String member_login_ok(PrVO pr ,MemberVO mb,HttpServletResponse response,HttpServletRequest request,HttpSession session)throws Exception{
    	response.setContentType("text/html;charset=UTF-8");
    	PrintWriter out=response.getWriter();
		session=request.getSession();//세션객체 생성
		System.out.println(pr.getPr_no());
 		MemberVO mem_pwd=this.memberService.selectMember_id(mb.getMem_id());
		//회원정보를 아이디 만 가져와서 mem_pwd 객체에 저장
		if(mem_pwd == null) {
			out.println("<script>");
			out.println("alert('아이디 정보가 없습니다!');");
			out.println("history.back();");
			out.println("</script>");
		}else {
			if(!mem_pwd.getMem_pwd().equals(mb.getMem_pwd())) {
				out.println("<script>");
				out.println("alert('아이디 비번이 다릅니다!');");
				out.println("history.back();");
				out.println("</script>");
			}else {//관리자 로그인 인증이 된경우
				session.setAttribute("mem_id",mb.getMem_id());//admin_id 세션키이름에 관리자 아이디 저장
				session.setAttribute("mem_pwd",mb.getMem_pwd());
				session.setAttribute("bbs_name",mem_pwd.getMem_name()); //bbs_name에 회원이름 저장
		        session.setAttribute("bbs_id",mem_pwd.getMem_id()); //bbs_id에 회원아이디 저장
				
				return "indexx";
			}
 	}
		return null;
}//admin_login_ok()
    
    //로그아웃
    @RequestMapping("/mem_logout")
    public String admin_logut(MemberVO logout_mb ,HttpServletResponse response,HttpServletRequest request)throws Exception{
    	response.setContentType("text/html;charset=UTF-8");
    	PrintWriter out=response.getWriter();
    	HttpSession session=request.getSession();//세션객체 생성
    	session.invalidate();//세션만료
    	
    	out.println("<script>");
    	out.print("alert('로그아웃 되었습니다');");
    	out.println("location='indexx';");
    	out.println("</script>");
    	
    	return null;
}//admin_logut()
    
    //로그아웃
    @RequestMapping("/my_page_delete_out")
    public String my_page_delete_out(MemberVO logout_mb ,HttpServletResponse response,HttpServletRequest request)throws Exception{
    	response.setContentType("text/html;charset=UTF-8");
    	PrintWriter out=response.getWriter();
    	HttpSession session=request.getSession();//세션객체 생성
    	session.invalidate();//세션만료
    	
    	out.println("<script>");
    	out.print("alert('탈퇴 되었습니다');");
    	out.println("location='indexx';");
    	out.println("</script>");
    	
    	return null;
}//admin_logut()
    
    
    //여기서부터 관리자 member 부분입니다  
    //여기서부터 관리자 member 부분입니다 
    
    //가입 회원목록 여기서 기준은 활성화 기준 like %Y
    //메인화면 뷰페이지 경로가 /WEB-INF/views /member/member_login_ok_custom.jsp
    @RequestMapping("/member_admin_list")
   	public ModelAndView member_admin_list(@ModelAttribute MemberVO mb ,HttpServletResponse response,HttpServletRequest request,HttpSession session) throws Exception{
	    response.setContentType("text/html;charset=UTF-8");
	 	PrintWriter out=response.getWriter();
	 	session=request.getSession();//세션객체 생성
	 	String admin_id=(String)session.getAttribute("admin_id");
	    //@member_admin_list MemberVO mb 라고 하면 mb객체생성 효가과 발생한다.  
	 	///페이징 -> 쪽나누기
	 	
	 	if(admin_id ==null) {
 		out.println("<script>");
 		out.print("alert('관리자님 다시 로그인 하세요');");
 		out.println("location='admin_index';");
 		out.println("</script>");
 		}else {	
 		int limit=5;//한페이지 보여지는 목록개수
 		int page=1;
 		if(request.getParameter("page") != null) {
 			page=Integer.parseInt(request.getParameter("page"));	  
 		}//get으로 전달된 쪽번호가 있다면 정수 숫자로//바꿔서 쪽번호 저장//검색어와 검색필드
 			 
 		String find_field= request.getParameter("find_field");
 		String find_name=request.getParameter("Search_id");
 		mb.setFind_field(find_field);
 		mb.setFind_name("%"+find_name+"%");//%는 오라클 검색연산자로 하나이상의 임의의문자와 대응
 			  
 		int totalCount=this.memberService.getRowCount(mb);//총레코드개수검색 전후 레코드개수							
 		/*페이징->시작행,끝행 번호*/
 		mb.setStartrow((page-1)*5+1);
 		mb.setEndrow(mb.getStartrow()+limit-1);		
 		List<MemberVO> mlist=this.memberService.search_list(mb); //보드 목록 가져오기 mb인자값이 들어가면서 최대 검색되는 목록수는 10개로 제한 
		/* 페이징 연산 */
		//총페이지 수
		int maxpage=(int)((double)totalCount/limit+0.95);//시작페이지->1,11,21..
		int startpage=
		(((int)((double)page/10+0.9))-1)*10+1;
		//마지막 페이지
		int endpage=maxpage;
		if(endpage>startpage+10-1) endpage=startpage+10-1;
		
		 	
 		ModelAndView listM=new ModelAndView("./admin/member_admin_list");
 		listM.addObject("mlist",mlist);//mlist키이름에 목록 저장
 	    listM.addObject("listcount",totalCount);//listcount키이름에 레코드개수 저장
 	    listM.addObject("page",page);
 	    listM.addObject("startpage",startpage);
 	    listM.addObject("endpage",endpage);
 	    listM.addObject("maxpage",maxpage);
 	    listM.addObject("find_name",find_name);//검색어	
     	return listM;
 		}
		return null;
}//member_admin_list()
    
    //블랙리스트 당한 회원 목록 여기서 기준은 활성화 기준 like %N
    //메인화면 뷰페이지 경로가 /WEB-INF/views /member/member_login_ok_custom.jsp
    @RequestMapping("/member_admin_member_Disable_list")
   	public ModelAndView member_admin_member_Disable_list(@ModelAttribute MemberVO mb ,HttpServletResponse response,HttpServletRequest request,HttpSession session) throws Exception{	
    response.setContentType("text/html;charset=UTF-8");
 	PrintWriter out=response.getWriter();
 	session=request.getSession();//세션객체 생성
 	String admin_id=(String)session.getAttribute("admin_id");
    //@member_admin_list MemberVO mb 라고 하면 mb객체생성 효가과 발생한다.  페이징 -> 쪽나누기
 		if(admin_id ==null) {
 			out.println("<script>");
 			out.print("alert('관리자님 다시 로그인 하세요');");
 			out.println("location='admin_index';");
 			out.println("</script>");
 		}else {
 			
 			int limit=5;//한페이지 보여지는 목록개수
 	 		int page=1;
 	 		if(request.getParameter("page") != null) {
 	 			page=Integer.parseInt(request.getParameter("page"));	  
 	 		}//get으로 전달된 쪽번호가 있다면 정수 숫자로//바꿔서 쪽번호 저장//검색어와 검색필드
 	 			 
 	 		String find_field= request.getParameter("find_field");
 	 		String find_name=request.getParameter("Search_id");
 	 		mb.setFind_field(find_field);
 	 		mb.setFind_name("%"+find_name+"%");//%는 오라클 검색연산자로 하나이상의 임의의문자와 대응
 	 			  
 	 		int totalCount=this.memberService.getRowCount(mb);//총레코드개수검색 전후 레코드개수							
 	 		/*페이징->시작행,끝행 번호*/
 	 		mb.setStartrow((page-1)*5+1);
 	 		mb.setEndrow(mb.getStartrow()+limit-1);		
 	 		List<MemberVO> mlist=this.memberService.search_list(mb); //보드 목록 가져오기 b인자값이 들어가면서 최대 검색되는 목록수는 10개로 제한 
 			/* 페이징 연산 */
 			//총페이지 수
 			int maxpage=(int)((double)totalCount/limit+0.95);//시작페이지->1,11,21..
 			int startpage=
 			(((int)((double)page/10+0.9))-1)*10+1;
 			//마지막 페이지
 			int endpage=maxpage;
 			if(endpage>startpage+10-1) endpage=startpage+10-1;
 			
 		String member_Activation_NO=request.getParameter("member_Activation");
 		List<MemberVO> dlist=this.memberService.getMember_DisableList(member_Activation_NO); //보드 목록 가져오기 b인자값이 들어가면서 최대 검색되는 목록수는 10개로 제한 	
 		ModelAndView DisableList=new ModelAndView("./admin/member_admin_member_Disable_list");
 		DisableList.addObject("dlistcount",totalCount);//listcount키이름에 레코드개수 저장
 		DisableList.addObject("dpage",page);
 		DisableList.addObject("dstartpage",startpage);
 		DisableList.addObject("dendpage",endpage);
 		DisableList.addObject("dmaxpage",maxpage);
 		DisableList.addObject("dfind_name",find_name);//검색어	
 		DisableList.addObject("dlist",dlist);
     	return DisableList;
 		}
		return null;
}//member_admin_member_Disable_list()
    
    //member_admin_edit블랙 리스트 수정하기위해 수정폼을 뜨게 한다
    @RequestMapping("/member_admin_member_Disable")
    public ModelAndView member_list_edit(@ModelAttribute MemberVO mb ,@RequestParam("select_box") String mem_id,HttpServletRequest request,HttpServletResponse response,HttpSession session ) throws Exception {
    	response.setContentType("text/html;charset=UTF-8");
    	PrintWriter out=response.getWriter();
 		session=request.getSession();//세션객체 생성
 		String admin_id=(String)session.getAttribute("admin_id");
 		if(admin_id ==null) {
 			out.println("<script>");
 			out.print("alert('관리자님 다시 로그인 하세요');");
 			out.println("location='admin_index';");
 			out.println("</script>");
 		}else {
 	 	mb= this.memberService.editList(mem_id); //활성화 를 해당하는 리스트 목록을가져온다 	
 	 	ModelAndView list_Edit=new ModelAndView("./admin/member_admin_member_Disable");
 	 	list_Edit.addObject("editList",mb);	
    	return list_Edit;	
 		}
		return null;
}//member_list_edit()
    
    //member_admin_edit_ok블랙 리스트 수정하기위해 수정완료 후 리스트 창 뜬다   
	@RequestMapping("/member_admin_member_Disable_ok")
    public ModelAndView member_admin_edit_ok(MemberVO mb ,@RequestParam("member_Activation") String member_Activation_NO,HttpServletRequest request,HttpServletResponse response,HttpSession session ) throws Exception {	
    	response.setContentType("text/html;charset=UTF-8");
    	PrintWriter out=response.getWriter();
 		session=request.getSession();//세션객체 생성
 		String admin_id=(String)session.getAttribute("admin_id");
 		if(admin_id ==null) {
 			out.println("<script>");
 			out.print("alert('관리자님 다시 로그인 하세요');");
 			out.println("location='admin_index';");
 			out.println("</script>");
 		}else {
 		this.memberService.edit_update(mb); //업데이xm
 		List<MemberVO> mlist=this.memberService.getMemberList(); //보드 목록 가져오기 b인자값이 들어가면서 최대 검색되는 목록수는 10개로 제한 
 		ModelAndView listM=new ModelAndView("redirect:./member_admin_list");
 		listM.addObject("mlist",mlist);
     	return listM;
 		}
 		return null;
}//member_admin_edit_ok()
    
	//블랙리스트 목록 삭제하기 
	@RequestMapping("/member_admin_member_Disable_delete") 
	public ModelAndView member_admin_member_Disable_delete(@RequestParam("mem_id") String delete_id ,HttpServletRequest request,HttpServletResponse response,HttpSession session ) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
    	PrintWriter out=response.getWriter();
 		session=request.getSession();//세션객체 생성
 		String admin_id=(String)session.getAttribute("admin_id");
 		if(admin_id ==null) {
 			out.println("<script>");
 			out.print("alert('관리자님 다시 로그인 하세요');");
 			out.println("location='admin_index';");
 			out.println("</script>");
 		}else {
 			System.out.println(delete_id);
 		this.memberService.member_delete(delete_id); //삭제
 		
 		List<MemberVO> mlist=this.memberService.getMemberList(); //보드 목록 가져오기 b인자값이 들어가면서 최대 검색되는 목록수는 10개로 제한 	
 		ModelAndView listM=new ModelAndView("redirect:./member_admin_member_Disable_list");
 		listM.addObject("mlist",mlist);
     	return listM;
	}
 	return null;
	}
	
	
	
	//여기서부터 마이페이지 부분입니다 여기서부터 마이페이지 부분입니다 여기서부터 마이페이지 부분입니다
	//↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
	@RequestMapping("/my_page_member_edit")
    public ModelAndView my_page_member_edit(MemberVO mb ,HttpServletRequest request,HttpServletResponse response,HttpSession session ) throws Exception {	
		response.setContentType("text/html;charset=UTF-8");
    	PrintWriter out=response.getWriter();
 		session=request.getSession();//세션객체 생성
 		String mem_id=(String)session.getAttribute("mem_id");
 		String mem_pwd=(String)session.getAttribute("mem_pwd");
 		System.out.println(mem_pwd);
 		if(mem_id ==null) {
 			out.println("<script>");
 			out.print("alert('회원님 다시 로그인 하세요');");
 			out.println("location='member_login';");
 			out.println("</script>");
 		}else {		
 			String[] phone= {"010","011","019"};
 			MemberVO login_ok_member = this.memberService.mypage_selectMember_id(mem_id);
 			ModelAndView my_page_edit=new ModelAndView("./company/mypage/my_page_member_edit");
 			my_page_edit.addObject("phone",phone);
 			my_page_edit.addObject("login_ok_member",login_ok_member);
 			return my_page_edit;
 		}
 		return null;
 		//회원 수정을 위해 수정창을 띄울때 로그인한 회원 정보를 가져온다 그리고 찍어낸다 
}//member_admin_edit_ok()
	@RequestMapping("my_page_member_edit_ok")
	public String my_page_member_edit_ok(MemberVO mb, HttpServletRequest request,HttpServletResponse response,HttpSession session)throws Exception {
		response.setContentType("text/html;charset=UTF-8");
    	PrintWriter out=response.getWriter();
 		session=request.getSession();//세션객체 생성
 		String mem_id=(String)session.getAttribute("mem_id");
 		if(mem_id ==null) {
 			out.println("<script>");
 			out.print("alert('회원님 다시 로그인 하세요');");
 			out.println("location='member_login';");
 			out.println("</script>");
 		}else {
 			MemberVO db_pwd=this.memberService.mypage_selectMember_id(mem_id);
 			if(!db_pwd.getMem_pwd().equals(mb.getMem_pwd())) {
 				out.println("<script>");
 	 			out.print("alert('비번이 다르므로 수정을 하지못합니다.');");
 	 			out.println("history.back();");
 	 			out.println("</script>"); 				
 			}else {
 				this.memberService.My_page_edit_update(mb);
 				return "redirect:./mem_logout";
 			}
 		}
		return null;
	}
//my_page_member_edit_ok수정완료 
	
	//회원 탈퇴 부분_폼 
    @RequestMapping("my_page_member_delete")
    public ModelAndView my_page_delete(MemberVO mb ,HttpServletRequest request,HttpServletResponse response,HttpSession session ) throws Exception  {
    	response.setContentType("text/html;charset=UTF-8");
    	PrintWriter out=response.getWriter();
 		session=request.getSession();//세션객체 생성
 		String mem_id=(String)session.getAttribute("mem_id");
 		//String mem_pwd=(String)session.getAttribute("mem_pwd");
 		////System.out.println(mem_pwd);
 		if(mem_id ==null) {
 			out.println("<script>");
 			out.print("alert('회원님 다시 로그인 하세요');");
 			out.println("location='member_login';");
 			out.println("</script>");
 		}else {
 			MemberVO login_ok_member = this.memberService.mypage_selectMember_id(mem_id);
 			ModelAndView my_page_delete=new ModelAndView("./company/mypage/my_page_member_delete");
 			my_page_delete.addObject("login_ok_member",login_ok_member);
 			return my_page_delete;
 		
 		}
    	
    	return null;
    }
  //회원 탈퇴 부분_OK
    @RequestMapping("my_page_member_delete_ok")
    public String my_page_member_delete_ok(MemberVO mb ,HttpServletRequest request,HttpServletResponse response,HttpSession session ) throws Exception  {
    	response.setContentType("text/html;charset=UTF-8");
    	PrintWriter out=response.getWriter();
 		session=request.getSession();//세션객체 생성
 		String mem_id=(String)session.getAttribute("mem_id");
 		if(mem_id ==null) {
 			out.println("<script>");
 			out.print("alert('회원님 다시 로그인 하세요');");
 			out.println("location='member_login';");
 			out.println("</script>");
 		}else {			
 			MemberVO db_pwd=this.memberService.mypage_selectMember_no(mb.getMem_no());
 			if(!db_pwd.getMem_pwd().equals(mb.getMem_pwd())) {
 				out.println("<script>");
 	 			out.print("alert('비번이 다르므로 삭제를 하지못합니다.');");
 	 			out.println("history.back();");
 	 			out.println("</script>"); 				
 			}else {
 			this.memberService.delete_ok_member(mb);
 			return "redirect:./my_page_delete_out";
 			}
 		}
    	return null;
    }
    
	    
	
	
	
  
}//MemberController()
