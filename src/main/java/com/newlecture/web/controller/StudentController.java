package com.newlecture.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/student/*")
public class StudentController {

	@RequestMapping("index")
	public String index(){
		
		return "student.index";
	}
}
