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
import org.zerock.domain.AdminVO;
import org.zerock.domain.PrVO;
import org.zerock.service.AdminService;
import org.zerock.service.Admin_aBoardService;
import org.zerock.service.Admin_carService;

import pwdconv.PwdChange;

@Controller //스프링에 관리자 컨트롤러 등록

public class AdminController {
   @Autowired
   private AdminService adminService;

   @Autowired
   private Admin_carService admin_carService;
   
   @Autowired
   private Admin_aBoardService admin_aBoardService;

      /*관리자 로그인 인증과 비번 암호화 */
      @RequestMapping("/admin_login_ok")
      public String admin_login_ok(AdminVO ab,HttpServletResponse response,HttpServletRequest request,HttpSession session)throws Exception{
         response.setContentType("text/html;charset=UTF-8");
         PrintWriter out=response.getWriter();
         session=request.getSession();//세션객체 생성

         ab.setAdmin_pwd(PwdChange.getPassWordToXEMD5String(ab.getAdmin_pwd()));//관리자비번 암호화
         
         
        // ab.setAdmin_name("관리자");//관리자 이름 저장
         // this.adminService.insertAdmin(ab);
         
         
         //관리자 아이디,비번,이름을 저장
         AdminVO admin_pwd=this.adminService.adminLogin(ab.getAdmin_id());
         
         
         //관리자 아이디에 대한 관리자 비번을 가져옴
         if(admin_pwd == null) {
            out.println("<script>");
            out.println("alert('관리자 정보가 없습니다!');");
            out.println("history.back();");
            out.println("</script>");
         }else {
            if(!admin_pwd.getAdmin_pwd().equals(
               ab.getAdmin_pwd())) {
               out.println("<script>");
               out.println("alert('관리자 비번이 다릅니다!');");
               out.println("history.back();");
               out.println("</script>");
            }else {//관리자 로그인 인증이 된경우
               session.setAttribute("admin_id",ab.getAdmin_id());//admin_id 세션키이름에 관리자 아이디 저장
               session.setAttribute("admin_name",admin_pwd.getAdmin_name());
               //admin_id 세션키이름에 관리자 아이디 저장
               session.setAttribute("admin_pwd",admin_pwd.getAdmin_pwd());
               return "redirect:/admin_main";//관리자 메인 매핑으로 이동
            }
         }
         return null;
      }//admin_login_ok()

    //관리자 메인 //뷰페이지 경로가//WEB-INF/views/admin/admin_main.jsp
	    @RequestMapping("/admin_main")
	    public String admin_main(HttpServletResponse response,HttpServletRequest request,
	    						HttpSession session, Model listab, @ModelAttribute AdminVO ab) throws Exception{
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
			}else {//관리자 로그인 이후 글목록페이지
				  int page=1;//쪽번호
					int limit=5;//한페이지에 보여지는 목록개수
					if(request.getParameter("page") != null) {
						page=Integer.parseInt(request.getParameter("page"));		
			     }
					String find_name=request.getParameter("find_name");//검색어
					String find_field=request.getParameter("find_field");//검색
					//필드
					ab.setFind_field(find_field);
					ab.setFind_name("%"+find_name+"%");
					//%는 오라클 와일드 카드 문자로서 하나이상의 임의의 문자와
					//매핑 대응

					int listcount=this.admin_aBoardService.getRowabCount(ab);
					//전체 레코드 개수 또는 검색전후 레코드 개수
					//System.out.println("총 게시물수:"+listcount+"개");

					ab.setStartrow((page-1)*5+1);//시작행번호
					ab.setEndrow(ab.getStartrow()+limit-1);//끝행번호

			     
			   List<AdminVO> ablist=this.admin_aBoardService.getAbList(ab);//목록
			 //총페이지수
				int maxpage=(int)((double)listcount/limit+0.95);
				//현재 페이지에 보여질 시작페이지 수(1,11,21)
				int startpage=(((int)((double)page/10+0.9))-1)*10+1;
				//현재 페이지에 보여줄 마지막 페이지 수(10,20,30)
				int endpage=maxpage;
				if(endpage > startpage+10-1) endpage=startpage+10-1;

				listab.addAttribute("ablist",ablist);
				//blist 키이름에 값 저장
				listab.addAttribute("page",page);
				listab.addAttribute("startpage",startpage);
				listab.addAttribute("endpage",endpage);
				listab.addAttribute("maxpage",maxpage);
				listab.addAttribute("listcount",listcount);	
				listab.addAttribute("find_field",find_field);
				listab.addAttribute("find_name", find_name);
			   
				
				return "./admin/admin_main";
				//return "redirect:./admin_main";
				  
			          
			  }
			   return null;
			     }//admin_main()
       
       
       
       
       
       
       //글쓰기
	    //글쓰기
	    //글쓰기
	    //글쓰기
	    //글쓰기
	    @RequestMapping("/admin_ab_write")
	    public ModelAndView admin_prlist_edit(@ModelAttribute AdminVO ab ,
	          HttpServletRequest request,HttpServletResponse response,HttpSession session ) throws Exception {
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
	    	   int page=1;
	    	   if(request.getParameter("page") != null) {
	    	   page=Integer.parseInt(
	    	         request.getParameter("page"));   
	    	   }
	    	    ModelAndView cm=new ModelAndView("admin/admin_ab_write");
	    	    cm.addObject("page",page);
	    	    System.out.println(admin_id);
	    	    return cm;
	    	       }
	    	         return null;
	    	      }//admin_ab_write() 
	    
	    
	    //글쓰기저장
	  //글쓰기저장
	  //글쓰기저장
	  //글쓰기저장
	  //글쓰기저장
	  //관리자 게시판 저장
	    @RequestMapping("/admin_ab_write_ok")
	    public String admin_board_write_ok(
	          AdminVO ab,
	          HttpServletRequest request,
	          HttpServletResponse response)
	    throws Exception{
	 response.setContentType(
	       "text/html;charset=UTF-8");
	 PrintWriter out=response.getWriter();
	 HttpSession session=request.getSession();

	 String admin_id=
	 (String)session.getAttribute("admin_id");
	 //관리자 세션 아이디를 구함
	     if(admin_id == null) {
	        out.println("<script>");
	 out.println("alert('다시 로그인 하세요!');");
	         out.println("location='admin_index';");
	         out.println("</script>");
	     }else {
	 this.admin_aBoardService.insertabBoard(ab);//게시물저장
	 return "redirect:/admin_main";
	     }  
	       return null;
	    }//admin_ab_write_ok()
       
      //관리자 공지글 내용보기
      @RequestMapping("/admin_ab_cont")
      public ModelAndView admin_ab_cont(HttpServletResponse response,
            @RequestParam("admin_no") int admin_no,
      HttpServletRequest request)throws Exception{
      response.setContentType("text/html;charset=UTF-8");
      PrintWriter out=response.getWriter();
      HttpSession session=request.getSession();

      String admin_id=(String)session.getAttribute("admin_id");

      if(admin_id==null) {
        out.println("<script>");
        out.println("alert('다시 로그인 하세요!');");
         out.println("location='admin_index';");
         out.println("</script>");
     }else {
   AdminVO ab=this.admin_aBoardService.getAdmin_aBoardCont(admin_no);
   //디비로 부터 관리자 게시판내용을 가져옴.
   ModelAndView ablist=new ModelAndView("./admin/admin_ab_cont");
   ablist.addObject("ab",ab);
   return ablist;
     }
   return null;
    }//admin_board_cont()
       
      // 수정
      @RequestMapping("/admin_ab_edit")
      public ModelAndView admin_prlist_edit(@ModelAttribute AdminVO ab, @RequestParam("admin_no") int admin_no,
            HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
         response.setContentType("text/html;charset=UTF-8");
         PrintWriter out = response.getWriter();
         session = request.getSession();// 세션객체 생성
         String admin_id = (String) session.getAttribute("admin_id");
         
         if (admin_id == null) {
            out.println("<script>");
            out.print("alert('관리자님 다시 로그인 하세요');");
            out.println("location='admin_index';");
            out.println("</script>");
         } else {
            //System.out.println(admin_no);
            ab= this.admin_aBoardService.ab_editList(admin_no); // 번호를 기준 해당하는 리스트 목록을가져온다
           // System.out.println(ab);
            ModelAndView ablist_Edit = new ModelAndView("./admin/admin_ab_edit");
            ablist_Edit.addObject("ab_editList", ab);

            

            return ablist_Edit;
         }
         return null;
      } 
      
      // 수정완료
      @RequestMapping("/admin_ab_edit_ok")
      public ModelAndView admin_prlist_edit_ok(@ModelAttribute AdminVO ab,HttpServletRequest request,
    		   HttpServletResponse response, HttpSession session) throws Exception {

         response.setContentType("text/html;charset=UTF-8");
         PrintWriter out = response.getWriter();
         session = request.getSession();// 세션객체 생성
         String admin_id = (String) session.getAttribute("admin_id");

         if (admin_id == null) {
            out.println("<script>");
            out.print("alert('관리자님 다시 로그인 하세요');");
            out.println("location='admin_index';");
            out.println("</script>");
         } else {
            

            this.admin_aBoardService.ab_editlist_up(ab);// 자료실 수정

            ModelAndView ab_Edit = new ModelAndView("redirect:./admin_ab_cont");
            ab_Edit.addObject("admin_no", ab.getAdmin_no()); //redirect가 매핑이기때문에 전달받을 키값을 갖고와야한다.
            return ab_Edit;
         }
         return null;
      }// 게시판 수정
       
   // 관리자 게시판 삭제
  	@RequestMapping("/admin_ab_del")
  	public String admin_prlist_del(@ModelAttribute AdminVO ab, @RequestParam("admin_no") int admin_no,
  			HttpServletResponse response, HttpServletRequest request) throws Exception {
  		response.setContentType("text/html;charset=UTF-8");
  		PrintWriter out = response.getWriter();
  		HttpSession session = request.getSession();
  		String admin_id = (String) session.getAttribute("admin_id");
  		if (admin_id == null) {
  			out.println("<script>");
  			out.println("alert('다시 로그인 하세요!');");
  			out.println("location='admin_index';");
  			out.println("</script>");
  		} else {
  			
  			this.admin_aBoardService.ab_ablist_del(admin_no);// 게시물 삭제

  			
  			return "redirect:./admin_main";
  		}
  		return null;
  	}// admin_board_del()
       
       
       
       
       //로그아웃 //뷰페이지 경로가//WEB-INF/views/admin/admin_logout.jsp
       @RequestMapping("/admin_logout")
       public String admin_logut(HttpServletResponse response,HttpServletRequest request)throws Exception{
          response.setContentType("text/html;charset=UTF-8");
          PrintWriter out=response.getWriter();
          HttpSession session=request.getSession();//세션객체 생성
          
          session.invalidate();//세션만료
          
          out.println("<script>");
          out.print("alert('관리자 로그아웃 되었습니다');");
          out.println("location='indexx';");
          out.println("</script>");
          
          return null;
       }//admin_logut()
       
     //admin_pr.jsp메인화면 
          @RequestMapping("/admin_pr")
         public String admin_pr(Model m) {
             List<PrVO> imgList=this.admin_carService.getCarImgList();//최신 목록 3개 가져오기
            System.out.println("이미지 목록개수:"+imgList.size());
            String pr_car="코란도입니다.";
            int car_count=0;
            
            if(pr_car.equals("코란도입니다.")) {
             //car_count=this.admin_carService.getKoCount();
               car_count=1;   
            }else if(pr_car.equals("아반떼")) {
               
            }
            m.addAttribute("car_count", car_count);
            m.addAttribute("imgList",imgList);
            return "admin/admin_pr";
            //메인화면 뷰페이지 경로가 /WEB-INF/views /admin/addmember.jsp
          
          }
       
       
       
}//AdminController()
