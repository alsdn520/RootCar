package org.zerock.controller;

import java.io.File;
import java.io.PrintWriter;
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
import org.zerock.domain.PrVO;
import org.zerock.service.Admin_carService;

import com.oreilly.servlet.MultipartRequest;

@Controller
public class Admin_carController {

   @Autowired
   private Admin_carService admin_carService;

   @RequestMapping("/car_pr_ok")//자료실 저장      
   public String car_pr_ok(
         @ModelAttribute PrVO p,
         HttpServletRequest request,
         HttpServletResponse response,
         Model m
         ) throws Exception{
   response.setContentType("text/html;charset=UTF-8");
   PrintWriter out=response.getWriter();
   HttpSession session=request.getSession();//세션객체 생성
   String admin_id=(String)session.getAttribute("admin_id");
   //세션 관리자 아이디를 구함

      if(admin_id == null) {
         out.println("<script>");
         out.println("alert('다시 로그인 하세요!');");
         out.println("location='admin_index';");
         out.println("</script>");
      }else {//관리자 로그인 이후 자료실 업로드
         //String saveFolder=
         //"D:\\Spring_Main_project\\Main_Project\\src\\main\\webapp\\resources\\upload";
         //이진파일 업로드 서버경로
         String saveFolder=request.getRealPath("/resources/upload");
         //System.out.println("업로드 실제경로:"+saveFolder);

         MultipartRequest multi=null;//이진파일 업로드 참조변수
         int fileSize=5*1024*1024;//이진파일 업로드 최대크기

         multi=new MultipartRequest(request,saveFolder,fileSize,"UTF-8");//이진파일 받을 객체생성
         String pr_name=multi.getParameter("pr_name");
         String pr_location=multi.getParameter("pr_location");
         String pr_car=multi.getParameter("pr_car");
         int pr_price=Integer.parseInt(multi.getParameter("pr_price"));
         String pr_cont=multi.getParameter("pr_cont");
         String pr_car_Activation=multi.getParameter("pr_car_Activation");

         String fileDBName=null;

         File UpFile=multi.getFile("pr_file");//첨부한 파일을 가져옴

         if(UpFile != null) {//첨부한 파일이 있는 경우
            String fileName=UpFile.getName();//첨부한파일명
            Calendar c=Calendar.getInstance();//칼렌더는 추상클래스로 new로 객체생성 못함.년월일 시분초값을 반환
            int year=c.get(Calendar.YEAR);//년도값
            int month=c.get(Calendar.MONTH)+1;//월값,+1을
            //한 이유는 1월이 0으로 반환되기 때문임.
            int date=c.get(Calendar.DATE);//일값
            String homedir=saveFolder+"/"+year+"-"+month+
                  "-"+date;//오늘날짜 폴더경로 저장
            File path1=new File(homedir);
            if(!(path1.exists())) {//오늘날짜 폴더경로가 없으면
               path1.mkdir();//오늘날짜 폴더를 생성
            }
            Random r=new Random();//난수를 발생시키는 클래스
            int random=r.nextInt(100000000);//0이상 1억미만 사이의 임의의 정수 숫자 난수를 발생시킴

            /*파일 확장자 구함*/
            int index=fileName.lastIndexOf(".");//첨부한파일의 마침표 위치번호를 구함
            String fileExtendsion=fileName.substring(index+1);//마침표 이후부터 마지막문자 즉 첨부한 파일확장자를 구함
            String refileName="bbs"+year+month+date+random+"."+fileExtendsion;//새로운 이진파일명을 저장
            fileDBName="/"+year+"-"+month+"-"+date+"/"+refileName;//디비에 저장될 레코드
            UpFile.renameTo(new File(homedir+"/"+refileName));//새롭게 생성된 폴더에 바뀌어진이진파일로 업로드
            p.setPr_file(fileDBName);
         }
         p.setPr_name(pr_name);
         p.setPr_location(pr_location); 
         p.setPr_car(pr_car);
         p.setPr_price(pr_price); p.setPr_cont(pr_cont);
         p.setPr_car_Activation(pr_car_Activation);
         this.admin_carService.pr_insert(p);//자료실 저장         

         return "redirect:/admin_pr";//자료실 목록매핑으로 이동
      }//if else
      return null;
   }///car_pr_ok() 메서드

   
   
   
   /*관리자 차 목록*/
   @RequestMapping("/admin_prlist")
   public String admin_prlist(
         Model listP,
         @ModelAttribute PrVO p,
         HttpServletRequest request,
         HttpServletResponse response)
   throws Exception{
response.setContentType(
      "text/html;charset=UTF-8");
PrintWriter out=response.getWriter();
HttpSession session=request.getSession();//세션객체를 구함
String admin_id=(String)session.getAttribute("admin_id");//세션 관리자 아이디를 구함
 
  if(admin_id == null) {
     out.println("<script>");
  out.println("alert('다시 로그인 하세요!');");
  out.println("location='admin_index';");
  out.println("</script>");
  }else {//관리자 로그인 이후 게시판 목록
     int page=1;//쪽번호
      int limit=5;//한페이지에 보여지는 목록개수
      if(request.getParameter("page") != null) {
         page=Integer.parseInt(request.getParameter("page"));      
     }
      String find_name=request.getParameter("find_name");//검색어
      String find_field=request.getParameter("find_field");//검색필드
      p.setFind_field(find_field);
      p.setFind_name("%"+find_name+"%");
      //%는 오라클 와일드 카드 문자로서 하나이상의 임의의 문자와
      //매핑 대응

      int listcount=this.admin_carService.getRowCount(p);
      //전체 레코드 개수 또는 검색전후 레코드 개수
      //System.out.println("총 게시물수:"+listcount+"개");

      p.setStartrow((page-1)*5+1);//시작행번호
      p.setEndrow(p.getStartrow()+limit-1);//끝행번호

     
   List<PrVO> plist=this.admin_carService.getPrList(p);//목록총페이지수
   int maxpage=(int)((double)listcount/limit+0.95);//현재 페이지에 보여질 시작페이지 수(1,11,21)
   int startpage=(((int)((double)page/10+0.9))-1)*10+1;//현재 페이지에 보여줄 마지막 페이지 수(10,20,30)
   int endpage=maxpage;
   if(endpage > startpage+10-1) endpage=startpage+10-1;

   listP.addAttribute("plist",plist);//plist 키이름에 값 저장
   listP.addAttribute("page",page);
   listP.addAttribute("startpage",startpage);
   listP.addAttribute("endpage",endpage);
   listP.addAttribute("maxpage",maxpage);
   listP.addAttribute("listcount",listcount);   
   listP.addAttribute("find_field",find_field);
   listP.addAttribute("find_name", find_name);
   
   
    return "./admin/admin_prlist";
     
          
  }
   return null;
     }//admin_prlist()
    
   
     
   
   
   //수정
    @RequestMapping("/admin_prlist_edit")
    public ModelAndView admin_prlist_edit(@ModelAttribute PrVO p ,@RequestParam("select_box") int pr_no,
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
       
         // System.out.println(pr_no);
        p= this.admin_carService.car_editList(pr_no); //아이디를 해당하는 리스트 목록을가져온다 
       
        
      
        
        ModelAndView plist_Edit=new ModelAndView("./admin/admin_prlist_edit");
        plist_Edit.addObject("car_editList",p);
           
       // System.out.println(p.getPr_name());
        
       return plist_Edit;
       }
       return null;
    }
    
    
    //수정완료
    @RequestMapping("/admin_prlist_edit_ok")
    public ModelAndView admin_prlist_edit_ok(@ModelAttribute PrVO p ,HttpServletRequest request,HttpServletResponse response,HttpSession session ) 
       throws Exception {
          
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
             String saveFolder=request.getRealPath("/resources/upload");//이진파일 업로드 서버 경로
         int fileSize=5*1024*1024;//이진파일 최대크기

         MultipartRequest multi=null;//이진파일 받을 참조변수
         multi=new MultipartRequest(request,saveFolder,fileSize,"UTF-8");
         int pr_no=Integer.parseInt(multi.getParameter("pr_no"));
         
         // int page=1;
         //if(multi.getParameter("page") != null) {
            // page=Integer.parseInt(multi.getParameter("page"));
         //}
         String pr_name=multi.getParameter("pr_name");
         String pr_location=multi.getParameter("pr_location");
         String pr_car=multi.getParameter("pr_car");
         int pr_price=Integer.parseInt(multi.getParameter("pr_price"));
         String pr_cont=multi.getParameter("pr_cont");
         String pr_car_Activation=multi.getParameter("pr_car_Activation");
         
         PrVO db_file=this.admin_carService.car_editList(pr_no);
         //디비로 부터 기존첨부파일명을 구함.       
         File UpFile=multi.getFile("pr_file");  //이개 새로운 파일 
         System.out.println(UpFile);
         System.out.println(db_file.getPr_file());//기존파일 찍어본거
         
         if(UpFile != null) {//첨부파일이 있는 경우
            String fileName=UpFile.getName();//첨부한 파일명
            File DelFile=new File(saveFolder+db_file.getPr_file());
            //삭제할 파일 객체를 생성
            if(DelFile.exists()) {
               DelFile.delete();//기존 이진파일을 삭제
            }
            Calendar c=Calendar.getInstance();
            int year=c.get(Calendar.YEAR);//년도값
            int month=c.get(Calendar.MONTH)+1;//월값
            int date=c.get(Calendar.DATE);
            String homedir=saveFolder+"/"+year+"-"+month+"-"+date;
            File path1=new File(homedir);
            if(!(path1.exists())) {
               path1.mkdir();
            }
            Random r=new Random();
            int random=r.nextInt(100000000);

            /*확장자 구함*/
            int index=fileName.lastIndexOf(".");
            String fileExtension=fileName.substring(index+1);//확장자
            String refileName="car"+year+month+date+random+"."+
                  fileExtension;
            String fileDBName="/"+year+"-"+month+"-"+date+"/"+refileName;
            UpFile.renameTo(new File(homedir+"/"+refileName));
            System.out.println(UpFile);
            
            p.setPr_file(fileDBName);
         }else {//파일을 첨부하지 않은 경우
            String fileDBName="";
            if(db_file.getPr_file() != null) {
               p.setPr_file(db_file.getPr_file());
            }else {
               p.setPr_file(fileDBName);
            }
         }
         p.setPr_no(pr_no);
         p.setPr_name(pr_name);
         p.setPr_location(pr_location); 
         p.setPr_car(pr_car);
         p.setPr_price(pr_price); p.setPr_cont(pr_cont);
         p.setPr_car_Activation(pr_car_Activation);
         
         this.admin_carService.car_editlist_up(p);//자료실 수정

         ModelAndView car_Edit=new ModelAndView("redirect:./admin_prlist"); 
         car_Edit.addObject("car_editlist_up",p);       
         return car_Edit;
      }
      return null;
}//게시판 수정
    
  //관리자 게시판 삭제
    @RequestMapping("/admin_prlist_del")
    public String admin_prlist_del(
          @ModelAttribute PrVO p ,
          @RequestParam("pr_no") int pr_no,
          HttpServletResponse response,
          HttpServletRequest request)
    throws Exception{
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
      String up=request.getRealPath("/resources/upload");      
     // System.out.println(up);
      PrVO db_file=this.admin_carService.car_editList(pr_no);
       //System.out.println(pr_no);
      //System.out.println(db_file.getPr_file());
      this.admin_carService.car_prlist_del(pr_no);//게시물 삭제
      
     if(db_file.getPr_file() != null) {
      //기존 첨부파일이 있는 경우
     File file=new File(up+db_file.getPr_file());//삭제할 파일객체 생성
     file.delete();//기존첨부된 파일을 폴더로부터 삭제     
   }
     return "redirect:./admin_prlist";
    }
       return null;
    }//admin_board_del()
}