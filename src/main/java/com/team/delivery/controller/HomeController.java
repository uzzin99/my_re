package com.team.delivery.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 * Handles requests for the application home page.
 */
@Controller
@Slf4j
@RequiredArgsConstructor
public class HomeController {
	

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String home(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		
		if(session.getAttribute("userid")==null) {
			model.addAttribute("userinfo","");
		}else {
			model.addAttribute("userinfo",session.getAttribute("userid"));
			model.addAttribute("userType",session.getAttribute("userType"));
		}
		
		
		return "Main"
				+ "";
	}
	
	
	
}
