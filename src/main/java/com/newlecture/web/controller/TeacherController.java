package com.newlecture.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/teacher/*")
public class TeacherController {

	@RequestMapping("index")
	public String index(){
		
		return "teacher.index";
	}
}
