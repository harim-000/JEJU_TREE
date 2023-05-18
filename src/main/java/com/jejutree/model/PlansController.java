package com.jejutree.model;

import java.io.IOException;
import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jejutree.plans_model.*;
		
@Controller
public class PlansController {
	
    @Autowired
    private HttpSession session;
	
    @Inject
    private UserPlansDAO dao;
		
    @RequestMapping("plans_insert_ok.go")
    public void insertOk(UserPlansDTO dto, HttpServletResponse response) throws IOException {
		
    	String userId = (String) session.getAttribute("user_id");
    	dto.setUserId(userId);
        int check = this.dao.insertPlans(dto);
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
		
        if (check > 0) {
            out.println("<script>");
            out.println("alert('플랜 등록 성공!!!')");
            out.println("location.href='tmap.go'");
            out.println("</script>");
        } else {
            out.println("<script>");
            out.println("alert('플랜 등록 실패!!!')");
            out.println("history.back()");
            out.println("</script>");
        }
        
        out.close();
    
    }	
    
}