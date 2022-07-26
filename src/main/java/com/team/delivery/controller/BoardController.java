package com.team.delivery.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.delivery.DTO.boardDTO;
import com.team.delivery.DTO.commentDTO;
import com.team.delivery.mappers.iBoard;
import com.team.delivery.mappers.iComments;

@Controller
@Slf4j
@RequiredArgsConstructor
public class BoardController {

	private final iBoard brd;
	private final iComments cmt;
		
		@RequestMapping(value = "/home", method = RequestMethod.GET)
		public String home(HttpServletRequest req, Model model) {
			HttpSession session = req.getSession();
			//session.setAttribute("userid", (String)session.getAttribute("userid"));
			model.addAttribute("userid", session.getAttribute("userid"));
			System.out.println(brd.selPage());
			model.addAttribute("page",brd.selPage());
			System.out.println(session.getAttribute("crtpage"));
			model.addAttribute("crtpage",session.getAttribute("crtpage"));
			
			return "board/Boardhome";
		}
		@ResponseBody
		@RequestMapping(value = "/selBrd", method = RequestMethod.POST,produces="application/text;charset=utf-8")
		public String doSel(HttpServletRequest req) {
			HttpSession session = req.getSession();
			int page=1;
			if(!(req.getParameter("page")==null)) {
				page = Integer.parseInt(req.getParameter("page"));
				session.setAttribute("crtpage", page);
				System.out.println(page);
			}
			int page1 = ((page-1)*10)+1;
			int page2 = page*10;
			ArrayList<boardDTO> arBrd=brd.selBrd(page1,page2);
			JSONArray ja=new JSONArray();
			for(int i=0;i<arBrd.size();i++) {
				boardDTO bdto = arBrd.get(i);
				JSONObject jo = new JSONObject();
				jo.put("seq",bdto.getBSeqno());
				jo.put("writer",bdto.getWriter());
				jo.put("date",bdto.getBDate());
				jo.put("title",bdto.getTitle());
				jo.put("views",bdto.getViews());
				ja.add(jo);
			}
			return ja.toJSONString();
		}
		@RequestMapping(value = "/show", method = RequestMethod.GET,produces="application/text;charset=utf-8")
		public String goShow(HttpServletRequest req, Model model) {
			int seq = Integer.parseInt(req.getParameter("seq"));
			HttpSession session = req.getSession();
			model.addAttribute("userid", session.getAttribute("userid"));
			model.addAttribute("seq",seq);
			return "board/showBoard";
		}
		@RequestMapping(value = "/viewUp", method = RequestMethod.GET,produces="application/text;charset=utf-8")
		public String doViewUp(HttpServletRequest req) {
			int seq = Integer.parseInt(req.getParameter("seq"));
			brd.viewUp(seq);
			return "";
		}
		@ResponseBody
		@RequestMapping(value = "/selBD", method = RequestMethod.POST,produces="application/text;charset=utf-8")
		public String doShow(HttpServletRequest req) {
			int seq = Integer.parseInt(req.getParameter("seq"));
			boardDTO bDTO=brd.showBrd(seq);
			JSONArray ja=new JSONArray();
			JSONObject jo = new JSONObject();
			jo.put("seq",bDTO.getBSeqno());
			jo.put("writer",bDTO.getWriter());
			jo.put("date",bDTO.getBDate());
			jo.put("content", bDTO.getContent());
			jo.put("title",bDTO.getTitle());
			jo.put("views",bDTO.getViews());
			ja.add(jo);
			return ja.toJSONString();
		}
		@RequestMapping(value = "/newpost", method = RequestMethod.GET,produces="application/text;charset=utf-8")
		public String doNewBoard(HttpServletRequest req, Model model) {
			return "board/newBoard";
		}
		@RequestMapping(value = "/addBoard", method = RequestMethod.POST,produces="application/text;charset=utf-8")
		public String doAddBD(HttpServletRequest req) {
			HttpSession session = req.getSession();
			String writer =(String) session.getAttribute("userid");
			String title = req.getParameter("title");
			String content = req.getParameter("editordata");
			System.out.println("����= "+content);
			brd.addBD(title, content, writer);
			return "redirect:/home";
		}
		@RequestMapping(value = "/delBD", method = RequestMethod.GET,produces="application/text;charset=utf-8")
		public String doDelBD(HttpServletRequest req) {
			int seq = Integer.parseInt(req.getParameter("seq"));
			brd.delBD(seq);
			return "redirect:/home";
		}
		@RequestMapping(value = "/upBD", method = RequestMethod.GET,produces="application/text;charset=utf-8")
		public String goUpdateBD(HttpServletRequest req, Model model) {
			int seq = Integer.parseInt(req.getParameter("seq"));
			boardDTO bDTO=brd.showBrd(seq);
			model.addAttribute("seq",bDTO.getBSeqno());
			model.addAttribute("writer",bDTO.getWriter());
			model.addAttribute("date",bDTO.getBDate());
			model.addAttribute("content",bDTO.getContent());
			model.addAttribute("title",bDTO.getTitle());
			return "board/updateBoard";
		}
		@RequestMapping(value = "/updateBoard", method = RequestMethod.POST,produces="application/text;charset=utf-8")
		public String doUpdateBD(HttpServletRequest req, Model model) {
			int seq = Integer.parseInt(req.getParameter("seq"));
			String content = req.getParameter("editordata");
			String title = req.getParameter("title");
			brd.updateBD(title, content,seq);
			return "redirect:/home";
		}
		@ResponseBody
		@RequestMapping(value = "/addDat", method = RequestMethod.POST,produces="application/text;charset=utf-8")
		public String doAddComments(HttpServletRequest req, Model model) {
			HttpSession session = req.getSession();
			int seq = Integer.parseInt(req.getParameter("seq"));
			String content = req.getParameter("content");
			String writer =(String) session.getAttribute("userid");
			cmt.addCmt(seq, content, writer);
			return "0";
		}
		@ResponseBody
		@RequestMapping(value = "/selCmt", method = RequestMethod.POST,produces="application/text;charset=utf-8")
		public String doSelComments(HttpServletRequest req, Model model) {
			int seq = Integer.parseInt(req.getParameter("seq"));
			ArrayList<commentDTO> arCDTO = cmt.selCmt(seq);
			JSONArray ja=new JSONArray();
			for(int i=0;i<arCDTO.size();i++) {
				commentDTO CDTO = arCDTO.get(i);
				JSONObject jo = new JSONObject();
				jo.put("seqCmt", CDTO.getCSeqno());
				jo.put("content",CDTO.getContent());
				jo.put("deep",CDTO.getDeep());
				jo.put("writer",CDTO.getWriter());
				jo.put("date",CDTO.getCDate());
				ja.add(jo);
			}
			return ja.toJSONString();
		}
		@ResponseBody
		@RequestMapping(value = "/delCmt", method = RequestMethod.POST,produces="application/text;charset=utf-8")
		public String doDelCmt(HttpServletRequest req) {
			int seq = Integer.parseInt(req.getParameter("seq"));
			int bdseq = Integer.parseInt(req.getParameter("bdseq"));
			cmt.delCmt(seq);
			return "0";
		}
		@ResponseBody
		@RequestMapping(value = "/addRep", method = RequestMethod.POST,produces="application/text;charset=utf-8")
		public String doAddReply(HttpServletRequest req, Model model) {
			HttpSession session = req.getSession();
			int bSeq = Integer.parseInt(req.getParameter("bSeq"));
			int pSeq = Integer.parseInt(req.getParameter("pSeq"));
			int deep = Integer.parseInt(req.getParameter("deep"))+1;
			String content = req.getParameter("content");
			String writer =(String) session.getAttribute("userid");
			cmt.addRep(pSeq, bSeq, content, writer, deep);
			return "0";
		}
		@ResponseBody
		@RequestMapping(value = "/selRep", method = RequestMethod.POST,produces="application/text;charset=utf-8")
		public String doSelReply(HttpServletRequest req, Model model) {
			int pSeq = Integer.parseInt(req.getParameter("pSeq"));
			ArrayList<commentDTO> arCDTO = cmt.selRep(pSeq);
			JSONArray ja=new JSONArray();
			for(int i=0;i<arCDTO.size();i++) {
				commentDTO CDTO = arCDTO.get(i);
				JSONObject jo = new JSONObject();
				jo.put("seqCmt", CDTO.getCSeqno());
				jo.put("content",CDTO.getContent());
				jo.put("deep",CDTO.getDeep());
				jo.put("writer",CDTO.getWriter());
				jo.put("date",CDTO.getCDate());
				ja.add(jo);
			}
			return ja.toJSONString();
		}
//		@ResponseBody
//		@RequestMapping(value="/menulist",produces="application/text;charset=utf-8")
//		public String doList() {
//			iMenu menu = sqlSession.getMapper(iMenu.class);
//			ArrayList<Menu> arMenu = menu.getList();
//			JSONArray ja=new JSONArray();
//			for(int i=0;i<arMenu.size();i++) {
//				Menu mdto = arMenu.get(i);
//				JSONObject jo = new JSONObject();
//				jo.put("seqno",mdto.getSeqno());
//				jo.put("name",mdto.getName());
//				jo.put("price",mdto.getPrice());
//				ja.add(jo);
//			}
//			System.out.println(ja.toJSONString());
//			return ja.toJSONString();
//		}
}
