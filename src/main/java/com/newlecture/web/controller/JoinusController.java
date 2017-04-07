package com.newlecture.web.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.newlecture.web.data.dao.MemberRoleDao;

@Controller
@RequestMapping("/joinus/*")
public class JoinusController {

	@Autowired
	private MemberRoleDao memberRoleDao;
	
	@RequestMapping("join")
	public String join(){
		return "joinus.join";
	}
	
	@RequestMapping("login")
	public String login(){
		return "joinus.login";
	}
	@RequestMapping("mypage")
	public String mypage(Principal principal){
		
		String memberId = principal.getName();
		
		String role = memberRoleDao.getDefaultRoleById(memberId);
		
		if(role.equals("ROLE_ADMIN"))
		return "redirect:../admin/index";
		else if(role.equals("ROLE_TEACHER"))
			return "redirect:../teacher/index";
		else
			return "redirect:../student/index";
	}
}
