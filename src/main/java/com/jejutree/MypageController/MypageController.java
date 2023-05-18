package com.jejutree.MypageController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {
    
	@RequestMapping("mypage.go")
	public String mypage() {
		return "mypage/mypage";
	}
	
	@RequestMapping("userprofile.go")
	public String userprofile() {
		return "mypage/userprofile";
	}
	
}
