package com.team.delivery.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.team.delivery.DTO.StoreDTO;
import com.team.delivery.mappers.iMenuStore;
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
	private final iMenuStore ims;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String home(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		
		if(session.getAttribute("userid")==null) {
			model.addAttribute("userinfo","");
		}else {

			int cntStore = ims.cntStore((String)session.getAttribute("userid"));
			model.addAttribute("cntStore",cntStore);

			StoreDTO sVO = ims.selStore((String)session.getAttribute("userid"));
			model.addAttribute("sVO",sVO);

			model.addAttribute("userinfo",session.getAttribute("userid"));
			model.addAttribute("mName",session.getAttribute("mName"));
			model.addAttribute("userType",session.getAttribute("userType"));
			model.addAttribute("mAddress",session.getAttribute("mAddress"));
			model.addAttribute("mDetailaddress",session.getAttribute("mDetailaddress"));
			model.addAttribute("mExtraaddress",session.getAttribute("mExtraaddress"));

		}
		
		
		return "Main"
				+ "";
	}
	
	
	
}
