package com.jejutree.MypageController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jejutree.Login.JoinEmailService;
import com.jejutree.kakaoController.kakaoLoginService;
import com.jejutree.user_model.UserDAO;
import com.jejutree.user_model.UserDTO;
import com.mysql.cj.Session;

@Controller
public class MypageController {
	@Autowired
	private UserDAO dao;
	@Autowired
     private JoinEmailService emailService;
	
	
	@RequestMapping("mypage.go")
	public String mypage() {
		return "mypage/mypage";
	}
	
	@RequestMapping("userprofile.go")
	public String userprofile(HttpSession session, Model model) {
		String KakaoInfo = (String) session.getAttribute("KakaoInfo");
	     String user_id = (String) session.getAttribute("user_id");
	     UserDTO dto = new UserDTO();
		if (KakaoInfo != null || user_id != null) {
			if(user_id != null) {
				dto.setUser_id(user_id);
				dto = this.dao.getuser(user_id);
				
			} else if(KakaoInfo != null) {
				dto.setUser_id(KakaoInfo);
				dto = this.dao.getuser(KakaoInfo);
			} 
		}
		
		
		
		model.addAttribute("UserInfo", dto);
		
		return "mypage/userprofile";
	}
	
	@RequestMapping("updateUser.go")
	public String updateUser(UserDTO dto, HttpServletResponse response, Model model, HttpSession session) throws Exception {
	  int id = dto.getId();
	  System.out.println(id);
	  String pwdCheck = dao.checkPwd(id);
	  String emailCheck = dao.emailCheck(id);
	  System.out.println(pwdCheck);
	  System.out.println(dto.getUser_pwd());
	  
	  response.setContentType("text/html; charset=UTF-8");
	  PrintWriter out = response.getWriter();
	  System.out.println(!emailCheck.equals(dto.getUser_email()));
	  if(!emailCheck.equals(dto.getUser_email())) {
			String newKey = emailService.emailChangeForm(dto);
			dto.setMailKey(newKey);
			dao.updateMail(dto);
			System.out.println(dao.updateMail(dto));
			System.out.println("회원 아이디"+dto.getId());
			System.out.println("회원 새 이메일"+dto.getUser_email());
			model.addAttribute("id", id);
			session.setAttribute("updateDto", dto);
			return "mypage/emailChangeForm";
	  } else {
		  if(pwdCheck.equals(dto.getUser_pwd())) {
			
				int check = this.dao.updateMember(dto);
				System.out.println(dto.getUser_phone());
				if(check > 0) {
				model.addAttribute("UserInfo", dto);
				out.println("<script>");
				out.println("alert('회원정보 수정 성공')");
				out.println("location.href='userprofile.go'");
				out.println("</script>");
				}else {
				out.println("<script>");
				out.println("alert('회원정보 수정 실패')");
				out.println("history.back()");
				out.println("</script>");
				}
			} else {
				out.println("<script>");
				out.println("alert('비밀번호 틀림')");
				out.println("history.back()");
				out.println("</script>");
			}
	  }
	  return null;
	}
	
	@RequestMapping("emailChange.go")
	public void CheckEmail(HttpServletResponse response, Model model, HttpSession session, @RequestParam("id") int id, @RequestParam("emailKey") String key) throws Exception {
		UserDTO dto = this.dao.getuserById(id);
		System.out.println("사용자 아이디");
		System.out.println("입력키"+key);
		System.out.println("db변한 키"+dto.getMailKey());
		
		response.setContentType("text/html; charset=UTF-8");
	      PrintWriter out = response.getWriter();
	      if(key.equals(dto.getMailKey())) {
	    	  UserDTO updateDTO=(UserDTO) session.getAttribute("updateDto");
	    	 this.dao.updateMember(updateDTO);
	    	 model.addAttribute("UserInfo", updateDTO);
	         out.println("<script>");
	         out.println("alert('이메일 인증이 완료 되었습니다.')");
	         out.println("location.href='userprofile.go'");
	         out.println("</script>");
	      }else {
	         out.println("<script>");
	         out.println("alert('이메일 인증번호가 틀렸습니다.')");
	         out.println("history.back()");
	         out.println("</script>");
	      }
		session.removeAttribute("updateDto");
	}
	
	
}
