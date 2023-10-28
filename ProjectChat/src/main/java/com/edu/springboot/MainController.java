package com.edu.springboot;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import jakarta.servlet.http.HttpServletRequest;

@Controller
public class MainController {
	
	@RequestMapping("/")
	public String home() {
		return "home";
	}
	@RequestMapping("login")
	public String login() {
		return "login";
	}
	@RequestMapping("login_act")
	public String login_act(HttpServletRequest req) {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		
		return "home";
	}
	@RequestMapping("membership")
	public String membership() {
		return "membership";
	}
	@RequestMapping("membership_act")
	public String membership_act() {
		return "login";
	}
}
