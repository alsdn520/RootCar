package org.zerock.controller;

import java.io.PrintWriter;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.CarVO;
import org.zerock.domain.MemberVO;
import org.zerock.domain.PrVO;
import org.zerock.service.Admin_carService;
import org.zerock.service.CarService;
import org.zerock.service.MemberService;

@Controller

public class Car_controller {

	     @Autowired
	     private CarService carService; 
	     @Autowired
	     private Admin_carService admin_carService;
	 	 @Autowired 
		 private MemberService memberService;
	     
 //초기에 예약창 들어가서 차종과 차위치 날짜 선택후 예약확인을 누르면 값을 넘겨줌 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
	     
	     @RequestMapping("/car_magazine_travel")
	     public String car_magazine_travel( @ModelAttribute MemberVO mb, 
			   							    @ModelAttribute PrVO pr, 
			   							  						      HttpServletResponse response, HttpServletRequest request , HttpSession session, Model m)throws Exception {//Model m키값을 쌍으로 저장
	     response.setContentType("text/html;charset=UTF-8");
	     PrintWriter out=response.getWriter();
	     session=request.getSession();
	     String mem_id=(String)session.getAttribute("mem_id");
	     pr.setPr_car_Activation("yes");                   //여기중요 
	     System.out.println( pr.getPr_car_Activation());   //여기중요
	     if(mem_id ==null) {
	         out.println("<script>");
	         out.print("alert('로그인 후 이용해주세요');");
	         out.println("location='member_login';");
	         out.println("</script>");
	     }else {
	    	 List<PrVO> imgList=this.admin_carService.getCarImgList();//최신 목록 3개 가져오기
	    	 
	    	 String[] lending_period= {"1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27"
	    			 ,"28","29","30","31"};
	    	 //대여기간 배열생성
	    	 List<PrVO> all_carlist=this.admin_carService.select_all_car(pr);
	         mb=this.carService.getMember(mem_id);
	        // System.out.println(all_carlist.size());
	     m.addAttribute("imgList", imgList);
	     m.addAttribute("all_carlist", all_carlist);
	     m.addAttribute("car_member_name", mb.getMem_name());
	     m.addAttribute("car_member_email", mb.getMem_email());
	     m.addAttribute("car_member_phone", mb.getMem_phone()+"-"+mb.getMem_phone02()+"-"+mb.getMem_phone03());
	     m.addAttribute("lending_period",lending_period);
	     return "company/car_magazine_travel";
	     }
	     return null;
}//car_magazine_travel()
	   
//위에서 넘겨준 값을 받아 값을 jsp에 찍어주고 값을 받은 jsp 에서 예약하기 눌러주면 car_magazine_travel_ok 맵핑으로 가서 값을 db에 저장 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
	      @RequestMapping("/car_magazine_travel_list")
	      public String car_magazine_travel_list( @ModelAttribute MemberVO mb, 
			   								      @ModelAttribute PrVO pr,
			   								   							@RequestParam("car_Activation") String car_Activation,
			   								   							@RequestParam("car_member_name") String car_member_name,
			   								   							@RequestParam("car_member_email") String car_member_email,
			   								   							@RequestParam("car_member_phone") String car_member_phone,
			   								   							@RequestParam("car_name") String car_name,
			   								   							@RequestParam("car_location") String car_location,
			   								   							@RequestParam("car_Start") String car_Start,
			   								   							@RequestParam("lending_period") int lending_period,
			   															HttpServletResponse response, HttpServletRequest request , HttpSession session, Model m)throws Exception {//Model m키값을 쌍으로 저장
	      response.setContentType("text/html;charset=UTF-8");
	      PrintWriter out=response.getWriter();
	      session=request.getSession();
	      String mem_id=(String)session.getAttribute("mem_id"); 
		  if(mem_id ==null) {
		     out.println("<script>");
		     out.print("alert('로그인 후 이용해주세요');");
		     out.println("location='indexx';");
		     out.println("</script>");
		  }else {
			 // System.out.println(car_name);
		  PrVO db_pr_price= this.admin_carService.db_pr_price_find(car_name);
		 // System.out.println(db_pr_price.getPr_price());
		  //System.out.println(lending_period);
		  //System.out.println(car_location);
			  
		  if(!db_pr_price.getPr_location().equals(car_location)) {
			  out.println("<script>");
			  out.println("alert('해당 위치에는 해당 차종이 존재하지 않습니다.');");
			  out.println("history.go(-1);");
			  out.println("</script>");
		  }else {
		  int rent_price=db_pr_price.getPr_price()*lending_period;  //대여가격 = 차종가격 * 대여기간 
			//System.out.println("대여가격 : "+rent_price);
			StringTokenizer st=new StringTokenizer(car_Start, "-");//날자값을 -기준으로 년 월 일을 분리한다 
			String year=st.nextToken();  //연도값
			String month=st.nextToken();  //월값
			String date=st.nextToken();  //일값
			
			
			int car_End=Integer.parseInt(year+month+date);
			//System.out.println(car_End+lending_period-1);
			
			int car_End2=car_End+lending_period-1;
			
		  m.addAttribute("car_End", car_End2);	
		  m.addAttribute("rent_price", rent_price);
	      m.addAttribute("car_Activation", car_Activation);
		  m.addAttribute("car_member_name", car_member_name); 
		  m.addAttribute("car_member_email", car_member_email);	
		  m.addAttribute("car_member_phone", car_member_phone);
		  m.addAttribute("car_name", car_name);
		  m.addAttribute("car_location", car_location);
		  m.addAttribute("car_Start", car_Start );
		  m.addAttribute("lending_period", lending_period);
		  
		  
		  return "company/car_magazine_travel_list"; 	
	      }
		 }
	      return null;
}//car_magazine_travel_list()
  

//예약 ok 여기서 db에 값저장됩니다 .↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓  
	   @RequestMapping("/car_magazine_travel_ok")
	   public String car_magazine_travel_ok(CarVO car,PrVO pr,
			   												  @RequestParam("car_common") int car_common,
			   												  @RequestParam("car_member_name") String car_member_name,
			   												  @RequestParam("car_member_email") String car_member_email,
															  @RequestParam("car_name") String car_name,
															  @RequestParam("car_location") String car_location,
														      @RequestParam("car_Activation") String car_Activation,
														      @RequestParam("rent_price") String rent_price,
														      @RequestParam("car_Start") String car_Start,
														      @RequestParam("car_End") String car_End,
														      @RequestParam("lending_period") String lending_period,
														      
													          HttpServletResponse response,HttpServletRequest request ,HttpSession session)throws Exception {
	       response.setContentType("text/html;charset=UTF-8");
	       PrintWriter out=response.getWriter();  
	       session=request.getSession();//세션객체 생성
	       String mem_id=(String)session.getAttribute("mem_id");
		   if(mem_id ==null) {
		      out.println("<script>");
		      out.print("alert('로그인 후 이용해주세요');");
		      out.println("location='indexx';");
		      out.println("</script>");
		   }else {
			   pr.setPr_car(car_name);
			   pr.setPr_car_Activation(car_Activation);
			   
			   System.out.println(pr.getPr_car());
			   System.out.println(pr.getPr_car_Activation());
	         this.carService.insertcar(car);//예약 정보 저장.
	         this.admin_carService.update_Activation(pr);//회원저장시 car_pr 활성화 컬럼 no로 
	                
	        	String to = car_member_email;//받는 사람 멜 주소
				String subject = "RooT, 회원님의 차량예약 안내입니다.";//메일 제목
				String mail_cont = 
						"<html>"
						+ "<body>"
						+ "<h2>"
						+ car_member_name
						+ " 님의 예약정보는 <hr/><b>" 
						+ "차 이름 : "+car_name+"<br/>위치 : "+car_location+"<br/>가격 : "+ rent_price+"<br/>대여일 : "+ car_Start+"<br/>반납일 : "+ car_End+"<br/>대여기간 : "+ lending_period+"<hr/>"
						+ "</b>"
						+ "</h2>"
						+ "</body>"
						+ "</html>";//메일 내용
				this.memberService.sendMail(to, subject, mail_cont);//실제 메일 발송		
				  
	         
	         return "redirect:indexx";//예약창 매핑으로 이동
	         } 
	         
	      return null;   
	}//car_magazine_travel_ok()
	   
	   
/*관리자 예약관리 리스트 */	   
	   @RequestMapping("/admin_cartravel_list")
		public String admin_main(HttpServletResponse response,HttpServletRequest request,HttpSession session, CarVO cr, Model cc)throws Exception{
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
				cr.setCar_common(2);
			
			
				List<CarVO> total_CarList1=this.carService.total_CarList(cr);
				System.out.println(total_CarList1.size());
				  cc.addAttribute("total_CarList1", total_CarList1);
					
				return "./admin/admin_cartravel_list";
				//return "redirect:./admin_main";     
				
			}
			return null;
		}//admin_main()
	

	
	
	
	
}