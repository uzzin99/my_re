package com.team.delivery.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.team.delivery.DTO.StoreDTO;
import com.team.delivery.DTO.boardDTO;
import com.team.delivery.mappers.iBoard;
import com.team.delivery.mappers.iComments;
import com.team.delivery.mappers.iMenuStore;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;


/**
 * Handles requests for the application home page.
 */
@Controller
@Slf4j
@RequiredArgsConstructor
public class HomeController {
	private final iMenuStore ims;
	private final iBoard brd;
	private final iComments cmt;

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
	@ResponseBody
	@RequestMapping("/randImg")
	public String doSelImg(HttpServletRequest req, Model model) {
		ArrayList<StoreDTO> sVO=ims.selRandStore();

		JSONArray ja=new JSONArray();
		for(int i=0;i<sVO.size();i++) {
			StoreDTO list=sVO.get(i);
			JSONObject jo=new JSONObject();
			jo.put("Sseqno",list.getSSeqno());
			jo.put("Simg",list.getSImg());
			ja.add(jo);
		}
		System.out.println("ja.toJSONString()="+ja.toJSONString());
		return ja.toJSONString();
	}
	@ResponseBody
	@RequestMapping(value = "/smBD", method = RequestMethod.POST)
	public String showSmallBoard(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		ArrayList<boardDTO> bDTO=brd.selBDTitle("",1,8);
		JSONArray ja=new JSONArray();
		for(int i=0;i<bDTO.size();i++) {
			boardDTO list=bDTO.get(i);
			JSONObject jo=new JSONObject();
			jo.put("cntCmt",cmt.cntCmt(list.getBSeqno()));
			jo.put("title",list.getTitle());
			jo.put("seqno",list.getBSeqno());
			jo.put("date",list.getBDate());
			jo.put("views",list.getViews());
			ja.add(jo);
		}
		System.out.println("ja.toJSONString()="+ja.toJSONString());
		return ja.toJSONString();
	}
	@ResponseBody
	@RequestMapping(value = "/smQA", method = RequestMethod.POST)
	public String showSmallQABoard(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		ArrayList<boardDTO> bDTO=brd.smallQnA(1,8);
		JSONArray ja=new JSONArray();
		for(int i=0;i<bDTO.size();i++) {
			boardDTO list=bDTO.get(i);
			JSONObject jo=new JSONObject();
			jo.put("cntCmt",cmt.cntCmt(list.getBSeqno()));
			jo.put("title",list.getTitle());
			jo.put("seqno",list.getBSeqno());
			jo.put("date",list.getBDate());
			jo.put("views",list.getViews());
			ja.add(jo);
		}
		System.out.println("ja.toJSONString()="+ja.toJSONString());
		return ja.toJSONString();
	}
	

}
