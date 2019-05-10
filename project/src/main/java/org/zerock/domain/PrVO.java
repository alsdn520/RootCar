package org.zerock.domain;

public class PrVO {
   private String pr_name;
   private int pr_no;//번호
   private String pr_location;//위치
   private String pr_car;//차종
   private int pr_price;//가격
   private String pr_cont;//설명
   private String pr_file;//사진 이진파일
   private String pr_date;
   //페이징(쪽나누기)관련변수
      private int startrow;//시작행번호
      private int endrow;//끝행번호
      private String find_field;//검색필드
      private String find_name;//검색어
      private String pr_car_Activation;//활성화
      
      
   
   public String getPr_car_Activation() {
         return pr_car_Activation;
      }
      public void setPr_car_Activation(String pr_car_Activation) {
         this.pr_car_Activation = pr_car_Activation;
      }
   public String getFind_field() {
         return find_field;
      }
      public void setFind_field(String find_field) {
         this.find_field = find_field;
      }
      public String getFind_name() {
         return find_name;
      }
      public void setFind_name(String find_name) {
         this.find_name = find_name;
      }
   public int getStartrow() {
         return startrow;
      }
      public void setStartrow(int startrow) {
         this.startrow = startrow;
      }
      public int getEndrow() {
         return endrow;
      }
      public void setEndrow(int endrow) {
         this.endrow = endrow;
      }
   public String getPr_date() {
      return pr_date;
   }
   public void setPr_date(String pr_date) {
      this.pr_date = pr_date.substring(0, 10);
   }
   
   public String getPr_name() {
      return pr_name;
   }
   public void setPr_name(String pr_name) {
      this.pr_name = pr_name;
   }
   public int getPr_no() {
      return pr_no;
   }
   public void setPr_no(int pr_no) {
      this.pr_no = pr_no;
   }
   public String getPr_location() {
      return pr_location;
   }
   public void setPr_location(String pr_location) {
      this.pr_location = pr_location;
   }
   public String getPr_car() {
      return pr_car;
   }
   public void setPr_car(String pr_car) {
      this.pr_car = pr_car;
   }
   public int getPr_price() {
      return pr_price;
   }
   public void setPr_price(int pr_price) {
      this.pr_price = pr_price;
   }
   public String getPr_cont() {
      return pr_cont;
   }
   public void setPr_cont(String pr_cont) {
      this.pr_cont = pr_cont;
   }
   public String getPr_file() {
      return pr_file;
   }
   public void setPr_file(String pr_file) {
      this.pr_file = pr_file;
   }
/*   public int getStartrow() {
      return startrow;
   }
   public void setStartrow(int startrow) {
      this.startrow = startrow;
   }
   public int getEndrow() {
      return endrow;
   }
   public void setEndrow(int endrow) {
      this.endrow = endrow;
   } */
   
   
   
   
   
   
   
   
   
   
   
   

}