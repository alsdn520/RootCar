package org.zerock.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

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
import org.zerock.domain.BbsVO;
import org.zerock.domain.ReplyVO;
import org.zerock.service.BbsService;
import org.zerock.service.ReplyService;

import com.oreilly.servlet.MultipartRequest;

@Controller
public class BbsController {

	@Autowired
	private BbsService bbsService;
	
	@Autowired
	private ReplyService replyService;

	/*자료실 글쓰기 폼*/
	@RequestMapping("/bbs_write")
	public String bbs_write(Model m,HttpServletResponse response,HttpServletRequest request,HttpSession session) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();//세션객체 생성
		String mem_id=(String)session.getAttribute("mem_id");
		//세션 아이디를 구함 
		if(mem_id ==null) {
			out.println("<script>");
			out.print("alert('다시 로그인 하세요');");
			out.println("location='indexx';");
			out.println("</script>");
		}else {
			int page=1;
			if(request.getParameter("page")!=null) {
				page=Integer.parseInt(request.getParameter("page"));
				//get으로 전달된 번호값을 정수 숫자로 바꿔서 저장
			}
			m.addAttribute("page",page);
		}
		return "company/bbs/bbs_write"; //WEB-INF/views/bbs/bbs_write.jsp
	} //bbs_write()

	
	
	
	/*자료실 저장*/
	@RequestMapping("/bbs_write_ok")
	public String bbs_write_ok(@ModelAttribute BbsVO b,HttpServletResponse response,HttpServletRequest request,HttpSession session) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();//세션객체 생성
		String mem_id=(String)session.getAttribute("mem_id");
		//세션 아이디를 구함 
		if(mem_id ==null) {
			out.println("<script>");
			out.print("alert('다시 로그인 하세요');");
			out.println("location='indexx';");
			out.println("</script>");
		}else {
			String saveFolder=request.getRealPath("/resources/upload1"); //이진파일 업로드 서버경로
			MultipartRequest multi=null; //이지파일 업로드 참조변수
			int fileSize=5*1024*1024; //이진파일 업로드 최대크기

			multi=new MultipartRequest(request,saveFolder,fileSize,"UTF-8"); //이진파일 받을 객체생성
			String bbs_id=multi.getParameter("bbs_id");
			String bbs_name=multi.getParameter("bbs_name");
			String bbs_title=multi.getParameter("bbs_title");
			String bbs_pwd=multi.getParameter("bbs_pwd");
			String bbs_cont=multi.getParameter("bbs_cont");

			File UpFile=multi.getFile("bbs_file");//첨부한 파일을 가져옴
			if(UpFile != null) { //첨부한 파일이 있는 경우
				String fileName=UpFile.getName(); //첨부한파일명
				Calendar c=Calendar.getInstance(); //칼렌더는 추상클래스로 new로 객체생성 못함. 년월일 시분초값을 반환
				int year=c.get(Calendar.YEAR); //년도값
				int month=c.get(Calendar.MONTH)+1; //월값,+1을한 이유는 1월이 0으로 반환되기 때문임.
				int date=c.get(Calendar.DATE); //일값
				String homedir=saveFolder+"/"+year+"-"+month+"-"+date; //오늘날짜 폴더경로 저장
				File path1=new File(homedir);
				if(!(path1.exists())) { //오늘날짜 폴더경로가없으면
					path1.mkdir(); //오늘날짜 폴더를 생성
				}
				Random r=new Random(); //난수를 발생시키는 클래스
				int random=r.nextInt(100000000); //0이상 1억 미만 사이의 임의의 정수 숫자 난수를 발생시킴
				
				/*파일 확장자 구함*/
				int index=fileName.lastIndexOf("."); //첨부한 파일의 마침표 위치번호를 구함
				String fileExtendsion=fileName.substring(index+1); //마침표 이후부터 마지막문자 즉 첨부한 파일확장자를 구함
				String refileName="bbs"+year+month+date+random+"."+fileExtendsion; //새로운 이진파일명을 저장
				String fileDBName="/"+year+"-"+month+"-"+date+"/"+refileName;//디비에 저장될 레코드
				UpFile.renameTo(new File(homedir+"/"+refileName)); //새롭게 생성된 폴더에 바뀌어진 이진파일로 업로드
				b.setBbs_file(fileDBName);
			}else { //파일을 첨부하지 않을때
				String fileDBName="";
				b.setBbs_file(fileDBName);//mybatis에서는 디비 레코드값으로 null을 저장못함.빈공백을 저장	
			}

			b.setBbs_id(bbs_id);
			b.setBbs_name(bbs_name); 
			b.setBbs_title(bbs_title);
			b.setBbs_pwd(bbs_pwd); b.setBbs_cont(bbs_cont);

			this.bbsService.insertBbs(b);//자료실 저장
			return "redirect:/custom_board";//자료실 목록 매핑으로 이동
		}
		return null;
	} //bbs_write_ok

	
	
	
	/*고객게시판*/
	@RequestMapping("/custom_board")
	public String custom(@ModelAttribute BbsVO b,HttpServletResponse response,HttpServletRequest request,HttpSession session,Model m)throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();//세션객체 생성
		String mem_id=(String)session.getAttribute("mem_id");
		//세션 아이디를 구함 
		if(mem_id ==null) {
			out.println("<script>");
			out.print("alert('로그인 후 이용해주세요');");
			out.println("location='member_login';");
			out.println("</script>");
		}else {
			/* 페이징->쪽나누기 */
			int page=1;
			int limit=15; //한페이지 보여지는 목록개수
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));	  
			} //get으로 전달된 쪽번호가 있다면 정수 숫자로 바꿔서 쪽번호 저장

			//검색어와 검색필드
			String find_field=request.getParameter("find_field");
			String find_name=request.getParameter("find_name");
			b.setFind_field(find_field);
			b.setFind_name("%"+find_name+"%"); //%는 오라클 검색연산자로 하나이상의 임의의 문자와 대응

			int totalCount=this.bbsService.getRowCount(b);//총레코드개수,검색 전후 레코드개수			
			/*페이징->시작행,끝행 번호*/
			b.setStartrow((page-1)*15+1);
			b.setEndrow(b.getStartrow()+limit-1);

			List<BbsVO> blist=this.bbsService.getBbsList(b);//목록
	

			//페이징 연산			
			//총페이지 수
			int maxpage=(int)((double)totalCount/limit+0.95);
			//시작페이지->1,11,21..
			int startpage=(((int)((double)page/10+0.9))-1)*10+1;
			//마지막 페이지
			int endpage=maxpage;
			if(endpage>startpage+10-1) 
				endpage=startpage+10-1;

			m.addAttribute("blist",blist); //blist 키이름에 목록 저장
			m.addAttribute("listcount",totalCount); //listcount키이름에 레코드개수 저장
			m.addAttribute("page",page);
			m.addAttribute("startpage",startpage);
			m.addAttribute("endpage",endpage);
			m.addAttribute("maxpage",maxpage);
			m.addAttribute("find_field",find_field);
			m.addAttribute("find_name",find_name);
			
			return "./company/bbs/custom_board"; 
			//return null;
		}
		return null;
	}//custom_board()

	/*자료실 내용보기+수정폼+삭제폼*/
	@RequestMapping("/bbs_cont")
	public ModelAndView bbs_cont(@RequestParam("bbs_no") int bbs_no,@RequestParam("state") String state,
			@RequestParam("page") int page,@ModelAttribute BbsVO b,
			@ModelAttribute ReplyVO rv,HttpServletResponse response,HttpServletRequest request,HttpSession session) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();//세션객체 생성
		String mem_id=(String)session.getAttribute("mem_id");
		//세션 아이디를 구함 
		if(mem_id ==null) {
			out.println("<script>");
			out.print("alert('다시 로그인 하세요');");
			out.println("location='indexx';");
			out.println("</script>");
		}else {
			List<ReplyVO> r_list=new ArrayList<>();
			if(state.equals("cont")) { //내용보기일때만 조회수 증가(aop를 통한 트랜잭션 적용)
				int reply_no=0;
				if(request.getParameter("reply_no") != null) {
					reply_no=Integer.parseInt(request.getParameter("reply_no"));
				}
				b=this.bbsService.getBbsCont(bbs_no);
				r_list=this.replyService.getReplyList(bbs_no);
				rv=this.replyService.getReplyCont(reply_no); //수정을 위해 댓글 내용 가져오기
				
			}else { //답변폼,수정폼,삭제폼일때는 조회수 증가 안함->트랜잭션 적용안함
				b=this.bbsService.getBbsCont2(bbs_no);
			}
			//System.out.println(r_list.size());
			ModelAndView cm=new ModelAndView();
			cm.addObject("b",b);
			cm.addObject("page",page);

			if(state.equals("cont")) { //내용보기
				cm.addObject("user_id",mem_id);
				cm.addObject("r_list",r_list);
				cm.addObject("rv",rv);
				cm.setViewName("./company/bbs/bbs_cont");
			}else if(state.equals("reply")) { //답변폼
				cm.setViewName("./company/bbs/bbs_reply");
			}else if(state.equals("edit")) { //수정폼
				cm.setViewName("./company/bbs/bbs_edit");
			}else if(state.equals("del")) { //삭제폼
				cm.setViewName("./company/bbs/bbs_del");
			}
			return cm;
		}
		return null;
	} //bbs_cont()
	
	//수정완료
	@RequestMapping("/bbs_edit_ok")
	public ModelAndView bbs_edit_ok(HttpServletRequest request,HttpServletResponse response,@ModelAttribute BbsVO b,HttpSession session) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();//세션객체 생성
		String mem_id=(String)session.getAttribute("mem_id");
		//세션 아이디를 구함 
		if(mem_id ==null) {
			out.println("<script>");
			out.print("alert('다시 로그인 하세요');");
			out.println("location='indexx';");
			out.println("</script>");
		}else {
			String saveFolder=request.getRealPath("/resources/upload1"); //이진파일 업로드 서버경로
			int fileSize=5*1024*1024; //이진파일 최대크기

			MultipartRequest multi=null; //이진파일을 받을 참조변수
			multi=new MultipartRequest(request,saveFolder,fileSize,"UTF-8");

			int bbs_no=Integer.parseInt(multi.getParameter("bbs_no")); //히든으로 전달된 자료실번호를 받아서 정수숫자로 바꿔서 저장
			//System.out.println(bbs_no);
			int page=1;

			if(multi.getParameter("page")!=null) {
				page=Integer.parseInt(multi.getParameter("page"));
			}

			String bbs_name=multi.getParameter("bbs_name");
			String bbs_title=multi.getParameter("bbs_title");
			String bbs_pwd=multi.getParameter("bbs_pwd");
			String bbs_cont=multi.getParameter("bbs_cont");

			BbsVO db_pwd=this.bbsService.getBbsCont2(bbs_no); //오라클로부터 비번을 가져옴.
			if(!db_pwd.getBbs_pwd().equals(bbs_pwd)) {
				out.println("<script>");
				out.println("alert('비번이 다릅니다!');");
				out.println("history.back();");
				out.println("</script>");
			}else {
				File UpFile=multi.getFile("bbs_file");
				if(UpFile!=null) {
					String fileName=UpFile.getName();
					File DelFile=new File(saveFolder+db_pwd.getBbs_file()); //삭제할 파일 객체 생성
					if(DelFile.exists()) {
						DelFile.delete(); //기존파일 삭제
					}
					Calendar c=Calendar.getInstance();
					int year=c.get(Calendar.YEAR); //년도값
					int month=c.get(Calendar.MONTH)+1; //월값
					int date=c.get(Calendar.DATE); //일
					String homedir=saveFolder+"/"+year+"-"+month+"-"+date;
					File path1=new File(homedir);
					if(!(path1.exists())) {
						path1.mkdir();
					}
					Random r=new Random();
					int random=r.nextInt(100000000);

					/* 확장자 구함 */
					int index=fileName.lastIndexOf(".");
					String fileExtension=fileName.substring(index+1); //확장자
					String refileName="bbs"+year+month+date+random+"."+fileExtension;
					UpFile.renameTo(new File(homedir+"/"+refileName));
					String fileDBName="/"+year+"-"+month+"-"+date+"/"+refileName;
					b.setBbs_file(fileDBName);
				}else {
					String fileDBName="";
					if(db_pwd.getBbs_file()!=null) {
						b.setBbs_file(db_pwd.getBbs_file());
					}else {
						b.setBbs_file(fileDBName);
					}
				}
				b.setBbs_no(bbs_no); b.setBbs_name(bbs_name);
				b.setBbs_title(bbs_title);
				b.setBbs_cont(bbs_cont);
				this.bbsService.editBbs(b); //자료실 수정

				ModelAndView em=new ModelAndView("redirect:/bbs_cont");
				em.addObject("bbs_no",bbs_no);
				em.addObject("state","cont");
				em.addObject("page",page);
				return em; //bbs_cont?bbs_no=번호?state=cont&page=쪽번호 3개의 인자값이 get 방식으로 전달
			} //if else
		}
		return null;
	} //bbs_edit_ok()

	/*자료실 삭제 완료*/
	@RequestMapping("/bbs_del_ok")
	public String bbs_del_ok(BbsVO b,@RequestParam("page") int page,
									 @RequestParam("del_pwd") String del_pwd, 
									 HttpServletResponse response,HttpServletRequest request,HttpSession session) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();//세션객체 생성
		String mem_id=(String)session.getAttribute("mem_id");//세션 아이디를 구함 
		if(mem_id ==null) {
			out.println("<script>");
			out.print("alert('다시 로그인 하세요');");
			out.println("location='indexx';");
			out.println("</script>");
		}else {
			String up=request.getRealPath("/resources/upload1"); //이진파일 서버경로
			BbsVO db_pwd=this.bbsService.getBbsCont2(b.getBbs_no()); //오라클로부터 비번을 가져옴
			if(!db_pwd.getBbs_pwd().equals(del_pwd)) { 
				out.println("<script>");
				out.println("alert('비번이 다릅니다!');");
				out.println("history.back();");
				out.println("</script>");
			}else {
				if(b.getBbs_step()==0) { //원본글일 경우
					this.bbsService.delBbs2(b.getBbs_ref()); //게시글 글그룹 기준으로 레코드 삭제
					
					if(db_pwd.getBbs_file()!=null) { //기존 첨부파일이 있는 경우
						File file=new File(up+db_pwd.getBbs_file()); //삭제할 파일 객체 생성
						file.delete(); //기존 첨부된 파일을 폴더로부터 삭제
					}
				}else { //답변글일 경우
					this.bbsService.delBbs(b.getBbs_no()); //게시글 번호를 기준으로 레코드 삭제					
				}
				return "redirect:/custom_board?page="+page;
			}
		}
		return null;
	} //bbs_del_ok

	/*답변저장*/
	@RequestMapping("/bbs_reply_ok")
	public String bbs_reply_ok(BbsVO b,@RequestParam("page") int page,HttpServletResponse response,HttpServletRequest request,HttpSession session) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();//세션객체 생성
		String mem_id=(String)session.getAttribute("mem_id");
		//세션 아이디를 구함 
		if(mem_id ==null) {
			out.println("<script>");
			out.print("alert('다시 로그인 하세요');");
			out.println("location='indexx';");
			out.println("</script>");
		}else {
			this.bbsService.replyBbs(b); //답변저장
			//System.out.println(b.getBbs_id());
			return "redirect:/custom_board?page="+page; 
			//return null;
		}
		return null;
	} //bbs_reply_ok()
	
	
	
	//댓글저장 댓글저장 댓글저장 댓글저장 댓글저장 댓글저장 댓글저장 댓글저장 댓글저장 댓글저장 댓글저장 댓글저장 댓글저장 
	//↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
	
	
	/*댓글저장*/
		@RequestMapping("/reply_ok")
		public String reply_ok (ReplyVO rv,HttpServletResponse response,HttpServletRequest request,HttpSession session,@RequestParam("page") int page) throws Exception {
		//ReplyVO의 변수명과 네임피라미터 이름이 같으면 rv 객체에 댓글 내용이 저장된다.
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			session=request.getSession();//세션객체 생성
			String mem_id=(String)session.getAttribute("mem_id"); //세션 아이디를 구함

			if(mem_id ==null) {
				out.println("<script>");
				out.print("alert('다시 로그인 하세요');");
				out.println("location='indexx';");
				out.println("</script>");
			}else {
				this.replyService.replyinsert(rv);
			
				return "redirect:/bbs_cont?bbs_no="+rv.getBbs_no()+"&page="+page+"&state=cont";
			}
			return null;
		} //reply_ok()
		
		/*댓글수정*/
		@RequestMapping("/reply_edit")
		public String reply_edit(ReplyVO rv,HttpServletResponse response,HttpServletRequest request,HttpSession session,@RequestParam("page") int page) throws Exception {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			session=request.getSession();//세션객체 생성
			String mem_id=(String)session.getAttribute("mem_id"); //세션 아이디를 구함

			if(mem_id ==null) {
				out.println("<script>");
				out.print("alert('다시 로그인 하세요');");
				out.println("location='indexx';");
				out.println("</script>");
			}else {
				this.replyService.replyedit(rv);
			
				return "redirect:/bbs_cont?bbs_no="+rv.getBbs_no()+"&page="+page+"&state=cont";
			}
			return null;
		} //reply_edit()
		
		/*댓글삭제*/
		@RequestMapping("/reply_del")
		public String reply_del(@RequestParam("page") int page,
								@RequestParam("reply_no") int reply_no,
								@RequestParam("bbs_no") int bbs_no,HttpServletResponse response,HttpServletRequest request,HttpSession session) throws Exception {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			session=request.getSession();//세션객체 생성
			String mem_id=(String)session.getAttribute("mem_id"); //세션 아이디를 구함
			List<ReplyVO> rv=this.replyService.getReplyList(bbs_no);

			if(mem_id ==null) {
				out.println("<script>");
				out.print("alert('다시 로그인 하세요');");
				out.println("location='indexx';");
				out.println("</script>");
			}else {
				this.replyService.delReply(reply_no);
				
				return "redirect:/bbs_cont?bbs_no="+bbs_no+"&page="+page+"&state=cont";
			}
			return null;
		}
		
		
	//관리자 부분입니다 관리자 부분입니다 관리자 부분입니다 관리자 부분입니다 관리자 부분입니다 관리자 부분입니다 
	//↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
	/*관리자 게시판 목록*/
	@RequestMapping("/admin_custom")
	public String admin_custom(@ModelAttribute BbsVO b,HttpServletResponse response,HttpServletRequest request,HttpSession session,Model m) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();//세션객체 생성
		String admin_id=(String)session.getAttribute("admin_id");//세션 아이디를 구함 
		if(admin_id ==null) {
			out.println("<script>");
			out.print("alert('관리자님, 다시 로그인 해주세요!');");
			out.println("location='admin_index';");
			out.println("</script>");
		}else {
			//페이징->쪽나누기
			int page=1;
			int limit=15; //한페이지 보여지는 목록개수
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));	  
			} //get으로 전달된 쪽번호가 있다면 정수 숫자로 바꿔서 쪽번호 저장

			//검색어와 검색필드
			String find_field=request.getParameter("find_field");
			String find_name=request.getParameter("find_name");
			b.setFind_field(find_field);
			b.setFind_name("%"+find_name+"%"); //%는 오라클 검색연산자로 하나이상의 임의의 문자와 대응

			int totalCount=this.bbsService.getRowCount(b);//총레코드개수,검색 전후 레코드개수	 페이징->시작행,끝행 번호
			b.setStartrow((page-1)*15+1);
			b.setEndrow(b.getStartrow()+limit-1);

			List<BbsVO> blist=this.bbsService.getBbsList(b);//목록
			//페이징 연산
			//총페이지 수
			int maxpage=(int)((double)totalCount/limit+0.95);//시작페이지->1,11,21..
			int startpage=(((int)((double)page/10+0.9))-1)*10+1;
		

			//마지막 페이지
			int endpage=maxpage;
			if(endpage>startpage+10-1) 
				endpage=startpage+10-1;

			m.addAttribute("blist",blist); //blist 키이름에 목록 저장
			m.addAttribute("listcount",totalCount); //listcount키이름에 레코드개수 저장
			m.addAttribute("page",page);
			m.addAttribute("startpage",startpage);
			m.addAttribute("endpage",endpage);
			m.addAttribute("maxpage",maxpage);
			m.addAttribute("find_field",find_field);
			m.addAttribute("find_name",find_name);

			return "admin/bbs/admin_bbs_list"; 
			//return null;
		}
		return null;
	}//admin_custom()
	
	/*관리자페이지 게시판 내용보기
	    자료실 내용보기+수정폼+삭제폼*/
	@RequestMapping("/admin_bbs_cont")
	public ModelAndView admin_bbs_cont(@RequestParam("bbs_no") int bbs_no,
									   @RequestParam("state") String state,
									   @RequestParam("page") int page,
									   @ModelAttribute BbsVO b,
									   @ModelAttribute ReplyVO rv,HttpServletResponse response,HttpServletRequest request,HttpSession session) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();//세션객체 생성
		String admin_id=(String)session.getAttribute("admin_id");
		//세션 아이디를 구함 
		if(admin_id ==null) {
			out.println("<script>");
			out.print("alert('관리자님, 다시 로그인 해주세요!');");
			out.println("location='admin_index';");
			out.println("</script>");
		}else {
			List<ReplyVO> r_list=new ArrayList<>();
			if(state.equals("cont")) { //내용보기일때만 조회수 증가(aop를 통한 트랜잭션 적용)
				int reply_no=0;
				if(request.getParameter("reply_no") != null) {
					reply_no=Integer.parseInt(request.getParameter("reply_no"));
				}
				b=this.bbsService.getBbsCont(bbs_no);
				r_list=this.replyService.getReplyList(bbs_no);
				rv=this.replyService.getReplyCont(reply_no); //수정을 위해 댓글 내용 가져오기
				
			}else { //답변폼,수정폼,삭제폼일때는 조회수 증가 안함->트랜잭션 적용안함
				b=this.bbsService.getBbsCont2(bbs_no);
			}
			//System.out.println(r_list.size());
			ModelAndView cm=new ModelAndView();
			cm.addObject("b",b);
			cm.addObject("page",page);

			if(state.equals("cont")) { //내용보기
				cm.addObject("r_list",r_list);
				cm.addObject("rv",rv);
				cm.setViewName("admin/bbs/admin_bbs_cont");
			}else if(state.equals("edit")) { //수정
				cm.setViewName("admin/bbs/admin_bbs_edit");
			}else if(state.equals("reply")) { //답변폼
				cm.setViewName("admin/bbs/admin_bbs_reply");
			}else if(state.equals("del")) { //삭제폼
				cm.setViewName("bbs/bbs_del");
			}
			return cm;
		}
		return null;
	} //admin_bbs_cont()
	
	/*관리자 댓글 저장*/
	@RequestMapping("/admin_reply_ok")
	public String admin_bbs_reply_ok(ReplyVO rv,@RequestParam("page") int page,HttpServletResponse response,HttpServletRequest request,HttpSession session) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();//세션객체 생성
		String admin_id=(String)session.getAttribute("admin_id");
		//세션 아이디를 구함 
		if(admin_id ==null) {
			out.println("<script>");
			out.print("alert('관리자님, 다시 로그인 해주세요!');");
			out.println("location='admin_index';");
			out.println("</script>");
		}else {
			this.replyService.replyinsert(rv);
			
			return "redirect:/admin_bbs_cont?bbs_no="+rv.getBbs_no()+"&page="+page+"&state=cont";
		}
		return null;
	} //bbs_reply_ok()
	
	/*관리자 댓글수정*/
	@RequestMapping("/admin_reply_edit")
	public String admin_reply_edit(ReplyVO rv,HttpServletResponse response,HttpServletRequest request,HttpSession session,
			@RequestParam("page") int page) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();//세션객체 생성
		String admin_id=(String)session.getAttribute("admin_id"); //세션 아이디를 구함

		if(admin_id ==null) {
			out.println("<script>");
			out.print("alert('관리자님, 다시 로그인 해주세요!');");
			out.println("location='admin_index';");
			out.println("</script>");
		}else {
			this.replyService.replyedit(rv);

			return "redirect:/admin_bbs_cont?bbs_no="+rv.getBbs_no()+"&page="+page+"&state=cont";
		}
		return null;
	} //admin_reply_edit()

	/*관리자 댓글삭제*/
	@RequestMapping("/admin_reply_del")
	public String admin_reply_del(HttpServletResponse response,HttpServletRequest request,HttpSession session,
			@RequestParam("page") int page,@RequestParam("reply_no") int reply_no,@RequestParam("bbs_no") int bbs_no) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();//세션객체 생성
		String admin_id=(String)session.getAttribute("admin_id"); //세션 아이디를 구함
		List<ReplyVO> rv=this.replyService.getReplyList(bbs_no);

		if(admin_id ==null) {
			out.println("<script>");
			out.print("alert('관리자님, 다시 로그인 해주세요!');");
			out.println("location='admin_index';");
			out.println("</script>");
		}else {
			this.replyService.delReply(reply_no);

			return "redirect:/admin_bbs_cont?bbs_no="+bbs_no+"&page="+page+"&state=cont";
		}
		return null;
	}//admin_reply_del()
	
	
	/*관리자 게시글 수정*/
	@RequestMapping("/admin_bbs_edit_ok")
	public ModelAndView admin_bbs_edit_ok(@ModelAttribute BbsVO b,
										  @RequestParam("page") int page,
										  @RequestParam("bbs_no") int bbs_no,
										  @RequestParam("bbs_name") String bbs_name,
										  @RequestParam("bbs_title") String bbs_title,
										  @RequestParam("bbs_cont") String bbs_cont,HttpServletRequest request,HttpServletResponse response,HttpSession session) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();//세션객체 생성
		String admin_id=(String)session.getAttribute("admin_id");
		//세션 아이디를 구함 
		if(admin_id ==null) {
			out.println("<script>");
			out.print("alert('관리자님, 다시 로그인 해주세요!');");
			out.println("location='admin_index';");
			out.println("</script>");
		}else {
			if(request.getParameter("page")!=null) {
				page=Integer.parseInt(request.getParameter("page"));
			}
			String bbs_file="";
			b.setBbs_no(bbs_no); b.setBbs_name(bbs_name);
			b.setBbs_title(bbs_title);
			b.setBbs_cont(bbs_cont);
			b.setBbs_file(bbs_file);
				
			this.bbsService.editBbs(b); //자료실 수정

			ModelAndView em=new ModelAndView("redirect:/admin_bbs_cont");
			em.addObject("bbs_no",bbs_no);
			em.addObject("state","cont");
			em.addObject("page",page);
				
			return em; //admin_bbs_cont?bbs_no=번호?state=cont&page=쪽번호 3개의 인자값이 get 방식으로 전송

		}
		return null;
	} //bbs_edit_ok()

	/*관리자페이지 게시판 삭제*/
	@RequestMapping("/admin_bbs_del_ok")
		public String admin_bbs_del_ok(BbsVO b,@RequestParam("page") int page,
											   @RequestParam("bbs_no") int bbs_no,
																			HttpServletResponse response,HttpServletRequest request,HttpSession session) throws Exception {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			session=request.getSession();//세션객체 생성
			String admin_id=(String)session.getAttribute("admin_id");
			//세션 아이디를 구함 
			if(admin_id ==null) {
				out.println("<script>");
				out.print("alert('관리자님, 다시 로그인 해주세요!');");
				out.println("location='admin_index';");
				out.println("</script>");
			}else {
				System.out.println(bbs_no);
				
					
						String up=request.getRealPath("/resources/upload1"); //이진파일 서버경로
						List<BbsVO> db_file=this.bbsService.getBbsDB_file(bbs_no);					
						if(db_file!=null) { //기존 첨부파일이 있는 경우
							for(BbsVO bbs_file:db_file) {
								File file=new File(up+bbs_file.getBbs_file()); //삭제할 파일 객체 생성
								file.delete(); //기존 첨부된 파일을 폴더로부터 삭제
							}
						}
						this.bbsService.adminDel(bbs_no); //글그룹 기준으로 레코드 삭제
					}
				return "redirect:/admin_custom?page="+page;
		} //admin_bbs_del_ok

}
