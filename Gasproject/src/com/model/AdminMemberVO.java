package com.model;

public class AdminMemberVO {
   
   private String admin_no;
   private String admin_id;
   private String admin_pw;
   private String admin_name;
   private String admin_tel;
   private String admin_email;
   private String admin_job;
   private String loc_no;
   private String user_no;
   
   public AdminMemberVO(String admin_no, String admin_id, String admin_pw, String admin_name, String admin_tel,
         String admin_email, String admin_job, String loc_no, String user_no) {
      super();
      this.admin_no = admin_no;
      this.admin_id = admin_id;
      this.admin_pw = admin_pw;
      this.admin_name = admin_name;
      this.admin_tel = admin_tel;
      this.admin_email = admin_email;
      this.admin_job = admin_job;
      this.loc_no = loc_no;
      this.user_no = user_no;
   }

   
//
   public AdminMemberVO(String admin_no, String admin_name) {
      super();
      this.admin_no = admin_no;
      this.admin_name = admin_name;
   }


//로그인 생성자
   public AdminMemberVO(String admin_no, String admin_id, String admin_email, String admin_tel,  String admin_job, String loc_no) {
      super();
      this.admin_no = admin_no;
      this.admin_id = admin_id;
      this.admin_email = admin_email;
      this.admin_tel = admin_tel;
      this.admin_job = admin_job;
      this.loc_no = loc_no;
   }

//업데이트 생성자
   public AdminMemberVO(String admin_pw,String admin_name, String admin_tel, String admin_email, String admin_job, String loc_no, String admin_id) {
      super();
      this.admin_pw = admin_pw;
      this.admin_name = admin_name;
      this.admin_tel = admin_tel;
      this.admin_email = admin_email;
      this.admin_job = admin_job;
      this.loc_no = loc_no;
      this.admin_id = admin_id;
      
   }

   public String getAdmin_no() {
      return admin_no;
   }

   public void setAdmin_no(String admin_no) {
      this.admin_no = admin_no;
   }

   public String getAdmin_id() {
      return admin_id;
   }

   public void setAdmin_id(String admin_id) {
      this.admin_id = admin_id;
   }

   public String getAdmin_pw() {
      return admin_pw;
   }

   public void setAdmin_pw(String admin_pw) {
      this.admin_pw = admin_pw;
   }

   public String getAdmin_name() {
      return admin_name;
   }

   public void setAdmin_name(String admin_name) {
      this.admin_name = admin_name;
   }

   public String getAdmin_tel() {
      return admin_tel;
   }

   public void setAdmin_tel(String admin_tel) {
      this.admin_tel = admin_tel;
   }

   public String getAdmin_email() {
      return admin_email;
   }

   public void setAdmin_email(String admin_email) {
      this.admin_email = admin_email;
   }

   public String getAdmin_job() {
      return admin_job;
   }

   public void setAdmin_job(String admin_job) {
      this.admin_job = admin_job;
   }

   public String getLoc_no() {
      return loc_no;
   }

   public void setLoc_no(String loc_no) {
      this.loc_no = loc_no;
   }

   public String getUser_no() {
      return user_no;
   }

   public void setUser_no(String user_no) {
      this.user_no = user_no;
   }
   
   
   
   
}