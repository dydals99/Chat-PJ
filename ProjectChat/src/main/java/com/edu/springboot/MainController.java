package com.edu.springboot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.edu.springboot.jdbc.IMemberService;
import com.edu.springboot.jdbc.MemberDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;

@Controller
public class MainController {
	@Autowired
	IMemberService dao;
	
	@RequestMapping("/")
	public String home(Model model, HttpSession session) {
		
		
		if(session.getAttribute("email")!=null) {

		
		}
		return "home";
		
	}
	@RequestMapping("login")
	public String login() {
		return "member/login";
	}
	@RequestMapping(value = "login_act", method = RequestMethod.POST)
	public String login_act(HttpServletRequest req, HttpSession session) {
		
		//파라미터로 받은 정보를 dto에 저장 
		MemberDTO dto = dao.login_act(req.getParameter("email"), req.getParameter("password"));
		ModelAndView mv = new ModelAndView();
		//dto에 아무런 정보가 없다면 아래와 같이
		if (dto == null) {
			System.out.println("회원정보 없음");
		} 
		//정보가 있다면 세션영역에 저장 후 home으로 이동
		else {
			session.setAttribute("siteUserInfo", dto);
		}
		return "home";
	}
	@RequestMapping("logout")
	public String logout(HttpServletRequest req, HttpSession session) {

		session.removeAttribute("siteUserInfo");
		session.invalidate();
		return "home";
	}
	@RequestMapping("signup")
	public String signup() {
		return "member/signup"; 
	}
	@RequestMapping(value = "signup_act", method = RequestMethod.POST)
	public String signup_act(HttpServletRequest req, HttpSession session, MemberDTO dto) {
		
		int result = dao.signup_act(dto);
		
		if(result==1) System.out.println("입력되었습니다.");
		
		return "member/login";
	}
	//채팅 
	@RequestMapping("chat")
	public ModelAndView chat(HttpSession session) { 
		
		MemberDTO dto = new MemberDTO();
		dto = (MemberDTO) session.getAttribute("siteUserInfo");
//		System.out.println(dto.getName());
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("userName", dto.getName());
		mv.setViewName("chat/chat");
		return mv;
	}
}  
