package com.jejutree.searchController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.jejutree.search_model.SearchDAO;
import com.jejutree.search_model.SearchDTO;

@Controller
public class searchController {
	
	@Autowired
	private SearchDAO dao;
	
	@RequestMapping("search_insertok.go")
	public void insertOk(SearchDTO dto, @RequestParam("search_keyword") String keyword, @RequestParam("kakao") String KakaoId, @RequestParam("normal") String id, HttpServletResponse response) throws IOException
	{
		if(KakaoId.isEmpty()) {
			System.out.println("현재 로그인된  일반 아이디"+id);
						
			dto.setUser_id(id);			
			dto.setSearch_term(keyword);			
		} else {
			System.out.println("현재 로그인된  일반 아이디"+KakaoId);
			
			dto.setUser_id(KakaoId);			
			dto.setSearch_term(keyword);			
		}
		
	int check = this.dao.insertSearch(dto);
	response.setContentType("text/html; charset=UTF-8");
	PrintWriter out = response.getWriter();
	
		if(check > 0) {
			out.println("<script>");
			out.println("alert('검색어 추가 성공!!!')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('검색어 추가 실패~~~')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	
	@RequestMapping(value = "recent_search_list.go", method = RequestMethod.POST)
	@ResponseBody
	public void getRecentSearchList(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Gson gson = new Gson();
		HashMap<String, List<SearchDTO>> map = new HashMap<String, List<SearchDTO>>();
		List<SearchDTO> list = this.dao.getKeywordList();
	    String keyword = "key";
	    map.put(keyword, list);
	    System.out.println(list);
	    System.out.println(map);
	    String jsonString = gson.toJson(map);
	    System.out.println(jsonString);
	    PrintWriter out = response.getWriter();
	    if(jsonString.isEmpty()) {
	    	out.print("none");
	    } else {
	    	out.print(jsonString);
	    }
	}
	
	@RequestMapping("sidebar2.go")
	public String sidebar2() {
		return "include/sidebar2";
	}
	
}