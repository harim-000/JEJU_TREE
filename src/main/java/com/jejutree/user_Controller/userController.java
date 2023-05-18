package com.jejutree.user_Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jejutree.Login.JoinEmailService;
import com.jejutree.kakaoController.kakaoLoginService;
import com.jejutree.user_model.UserDAO;
import com.jejutree.user_model.UserDTO;
@Controller
public class userController {
   @Autowired
   private UserDAO dao;
   @Autowired
   private kakaoLoginService ks;
   @Autowired
   private JoinEmailService emailService;
   
   @RequestMapping("user_join.go")
   public String go_user_join() {
      return "login/user_join";
   }
   @RequestMapping("user_join_ok.go")
   public void user_join_ok(HttpServletResponse response,UserDTO dto ) throws Exception{
      
      int check = this.emailService.insertUser(dto);
      
      response.setContentType("text/html; charset=UTF-8");
      
      PrintWriter out = response.getWriter();
      
  
      
      if(check > 0) {
         out.println("<script>");
         out.println("alert('회원가입이 완료 되었습니다.')");
         out.println("window.close()");
         out.println("location.href='MainPage.go'");
         out.println("</script>");
      }else {
         out.println("<script>");
         out.println("alert('가입 실패 유캔트 회원가입 실패~~~')");
         out.println("history.back()");
         out.println("</script>");
      }
      
   }
   
   @RequestMapping("registerEmail.go")
   public String registerEmail(HttpServletResponse response, UserDTO dto) throws IOException {
	  
	   return "login/emailcheck";
	  
	   
   }
   
    @RequestMapping(value={"/logout.go","/normal_logout.go"})
       public String logout(HttpSession session,HttpServletRequest request,HttpServletResponse response) {
      if(request.getServletPath().equals("/normal_logout.go")) {
         session.invalidate();
         return "redirect:/";
      }else if(request.getServletPath().equals("/logout.go")){
         HashMap<String, Object> hashMap = (HashMap<String, Object>) session.getAttribute("KakaoInfo"); 
         String access_Token = (String)hashMap.get("kakaoToken");
           if(access_Token != null && !"".equals(access_Token)){
               ks.kakaoLogout(access_Token);
               session.removeAttribute("KakaoInfo");
               session.invalidate();
               Cookie cookie = new Cookie("kakaoCookie", null);
               cookie.setMaxAge(0); // 쿠키 유효기간을 0으로 설정하여 즉시 만료시킴
               cookie.setPath("/"); // 쿠키의 경로 설정
               response.addCookie(cookie);
           }else{
               System.out.println("access_Token is null");
           }
           return "redirect:/";
      }      
      return "redirect:/";
    }
    @RequestMapping("user_login.go")
    public void userLoginok(@RequestParam("user_id") String user_id,@RequestParam("user_pwd") String user_pwd,HttpSession session, HttpServletResponse response) throws Exception {
    	response.setContentType("text/html; charset=UTF-8");
        
        PrintWriter out = response.getWriter();
        
       UserDTO user_dto = dao.getuser(user_id);
       int check = dao.emailAuthFail(user_id);
       if (user_dto==null) {
    	   out.println("<script>");
           out.println("alert('회원정보 없음~~~')");
           out.println("history.back()");
           out.println("</script>");
       }
       if(user_dto==null && check == 1) {
    	   System.out.println("로그인 실패");
    	   out.println("<script>");
           out.println("alert('로그인 실패~~~')");
           out.println("history.back()");
           out.println("</script>");
           
       }else if(check == 0 && user_dto!=null) {
    	   out.println("<script>");
           out.println("alert('이메일 인증 필요~~~')");
           out.println("history.back()");
           out.println("</script>");
       } else if(!user_dto.getUser_pwd().equals(user_pwd)  && check == 1  && user_dto!=null) {
    	   out.println("<script>");
           out.println("alert('회원정보 틀림~~~')");
           out.println("history.back()");
           out.println("</script>");
    	   
       } else {
    	 System.out.println("로그인 성공");
         session.setAttribute("user_id", user_dto.getUser_id());
         out.println("<script>");
         out.println("alert('로그인 성공')");
         out.println("location.href='MainPage.go'");
         out.println("</script>");
       }
    }
}