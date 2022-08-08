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
		model.addAttribute("userType",session.getAttribute("userType"));

		//System.out.println("page="+brd.selPage());
		model.addAttribute("Maxpage",brd.selPage());
		if(session.getAttribute("selType")==null) {
			session.setAttribute("selType","all");
		}
		model.addAttribute("selType",session.getAttribute("selType"));
		if(session.getAttribute("orderBy")==null) {
			session.setAttribute("orderBy",1);
		}
		model.addAttribute("orderBy",session.getAttribute("orderBy"));
		if(session.getAttribute("crtpage")==null) {
			session.setAttribute("crtpage",1);
		}
		System.out.println("현재 페이지="+session.getAttribute("crtpage"));
		model.addAttribute("crtpage",session.getAttribute("crtpage"));

		return "board/Boardhome";
	}
	@ResponseBody
	@RequestMapping(value = "/searchBtnClicked", method = RequestMethod.POST,produces="application/text;charset=utf-8")
	public String SearchBtnClicked(HttpServletRequest req,Model model) {
		HttpSession session = req.getSession();
		session.removeAttribute("bName");
		session.setAttribute("bName",req.getParameter("word"));
		return "0";
	}
	@ResponseBody
	@RequestMapping(value = "/selBrd", method = RequestMethod.POST,produces="application/text;charset=utf-8")
	public String doSel(HttpServletRequest req,Model model) {
		HttpSession session = req.getSession();
		if(session.getAttribute("bName")==null){
			session.setAttribute("bName","");
		}
		String bName = (String) session.getAttribute("bName");
		int page=1;
		if(!(req.getParameter("page")==null)) {
			page = Integer.parseInt(req.getParameter("page"));
			session.setAttribute("crtpage", page);
			System.out.println("page="+page);
		}
		JSONArray ja=new JSONArray();
		int page1 = ((page-1)*12)+1;
		int page2 = page*12;
		ArrayList<boardDTO> arBrd;
		if(session.getAttribute("orderBy")==null || session.getAttribute("orderBy").equals(1)){
			session.setAttribute("orderBy",1);
			arBrd = brd.selBDTitle(bName,page1,page2);
			//System.out.println(arBrd);
		}
		else{
			if(session.getAttribute("orderBy").equals(2)){
				System.out.println("orderBy = 2");
				arBrd = brd.selBDTitle2(bName,page1,page2);
				//System.out.println(arBrd);
			}
			else if(session.getAttribute("orderBy").equals(3)){
				System.out.println("orderBy = 3");
				arBrd = brd.selBDTitleView(bName,page1,page2);
				//System.out.println(arBrd);
			}
			else{
				System.out.println("orderBy = 4");
				arBrd = brd.selBDTitleView2(bName,page1,page2);
				//System.out.println(arBrd);
			}
			model.addAttribute("orderBy",session.getAttribute("orderBy"));
		}
		model.addAttribute("Maxpage",brd.searchBDTitle(bName));
		System.out.println("Maxpage="+brd.searchBDTitle(bName));
		for(int i=0;i<arBrd.size();i++) {
			boardDTO bdto = arBrd.get(i);
			JSONObject jo = new JSONObject();
			jo.put("seq", bdto.getBSeqno());
			jo.put("writer", bdto.getWriter());
			jo.put("date", bdto.getBDate());
			jo.put("title", bdto.getTitle());
			jo.put("views", bdto.getViews());
			jo.put("maxPage",brd.searchBDTitle(bName));
			ja.add(jo);
		}
		return ja.toJSONString();
	}
	@ResponseBody
	@RequestMapping(value = "/obtime", method = RequestMethod.POST,produces="application/text;charset=utf-8")
	public String OrderTime(HttpServletRequest req,Model model) {
		HttpSession session = req.getSession();
		if(session.getAttribute("orderBy").equals(1)){
			session.setAttribute("orderBy",2);
		}
		else{
			session.setAttribute("orderBy",1);
		}
		System.out.println(session.getAttribute("orderBy"));
		model.addAttribute("orderBy",session.getAttribute("orderBy"));
		return "0";
	}
	@ResponseBody
	@RequestMapping(value = "/obview", method = RequestMethod.POST,produces="application/text;charset=utf-8")
	public String OrderView(HttpServletRequest req,Model model) {
		HttpSession session = req.getSession();
		if(session.getAttribute("orderBy").equals(3)){
			session.setAttribute("orderBy",4);
		}
		else{
			session.setAttribute("orderBy",3);
		}
		System.out.println(session.getAttribute("orderBy"));
		model.addAttribute("orderBy",session.getAttribute("orderBy"));
		return "0";
	}
	@RequestMapping(value = "/show", method = RequestMethod.GET,produces="application/text;charset=utf-8")
	public String goShow(HttpServletRequest req, Model model) {
		int seq = Integer.parseInt(req.getParameter("seq"));
		HttpSession session = req.getSession();
		model.addAttribute("userid", session.getAttribute("userid"));
		model.addAttribute("seq",seq);
		model.addAttribute("userType",session.getAttribute("userType"));
		System.out.println("userType= "+session.getAttribute("userType"));
		return "board/showBoard";
	}
	@RequestMapping(value = "/viewUp", method = RequestMethod.GET,produces="application/text;charset=utf-8")
	public String doViewUp(HttpServletRequest req) {
		int seq = Integer.parseInt(req.getParameter("seq"));
		brd.viewUp(seq);
		return "";
	}
	@RequestMapping(value = "/SearchWordReJstf", method = RequestMethod.GET,produces="application/text;charset=utf-8")
	public String SearchWordReJstf(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.setAttribute("crtpage",1);
		session.setAttribute("page",1);
		session.setAttribute("orderBy",1);
		session.removeAttribute("bName");
		System.out.println("들어왔는디");
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
		jo.put("type",bDTO.getBtype());
		jo.put("writer",bDTO.getWriter());
		jo.put("date",bDTO.getBDate());
		jo.put("content", bDTO.getContent());
		jo.put("title",bDTO.getTitle());
		jo.put("views",bDTO.getViews());
		System.out.println("게시글 타입="+bDTO.getBtype());
		ArrayList<boardDTO> pnBD=brd.PNBD(seq);
		if(bDTO.getBtype() != 1){
			pnBD=brd.PNBD2(seq);
		}
		for(int i=0;i<pnBD.size();i++) {
			boardDTO pndto = pnBD.get(i);
			jo.put("seq"+i,pndto.getBSeqno());
			jo.put("writer"+i,pndto.getWriter());
			jo.put("date"+i,pndto.getBDate());
			jo.put("content"+i, pndto.getContent());
			jo.put("title"+i,pndto.getTitle());
			jo.put("views"+i,pndto.getViews());
			if(i==1) {
				jo.put("seq2",pndto.getBSeqno());
				jo.put("writer2",pndto.getWriter());
				jo.put("date2",pndto.getBDate());
				jo.put("content2", pndto.getContent());
				jo.put("title2",pndto.getTitle());
				jo.put("views2",pndto.getViews());
			}
		}
		ja.add(jo);
		return ja.toJSONString();
	}
	@RequestMapping(value = "/newpost", method = RequestMethod.GET,produces="application/text;charset=utf-8")
	public String doNewBoard(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		model.addAttribute("userinfo",session.getAttribute("userid"));
		model.addAttribute("userType",session.getAttribute("userType"));
		return "board/newBoard";
	}
	@RequestMapping(value = "/addBoard", method = RequestMethod.POST,produces="application/text;charset=utf-8")
	public String doAddBD(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		String writer = (String) session.getAttribute("userid");
		if (session.getAttribute("userType")=="손님") {
			writer += " 🍮";
		}
		else if (session.getAttribute("userType")=="사장님") {
			writer += " 👩‍🍳";
		}
		model.addAttribute("userid", writer);
		String title = req.getParameter("title");
		String content = req.getParameter("editordata");
		int type = Integer.parseInt(req.getParameter("btype"));
		//System.out.println("내용= "+content);
		System.out.println("타입="+type);
		brd.addBD(title, content, writer,type);
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
		HttpSession session = req.getSession();
		int seq = Integer.parseInt(req.getParameter("seq"));
		boardDTO bDTO=brd.showBrd(seq);
		model.addAttribute("type",bDTO.getBtype());
		model.addAttribute("seq",bDTO.getBSeqno());
		model.addAttribute("writer",bDTO.getWriter());
		model.addAttribute("date",bDTO.getBDate());
		model.addAttribute("content",bDTO.getContent());
		model.addAttribute("title",bDTO.getTitle());
		model.addAttribute("userinfo",session.getAttribute("userid"));
		model.addAttribute("userType",session.getAttribute("userType"));
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
		if (session.getAttribute("userType")=="손님") {
			writer += " 🍮";
		}
		else if (session.getAttribute("userType")=="사장님") {
			writer += " 👩‍🍳";
		}
		cmt.addCmt(seq, content, writer);
		return "0";
	}
	@ResponseBody
	@RequestMapping(value = "/upCmt", method = RequestMethod.POST,produces="application/text;charset=utf-8")
	public String doUpdateComments(HttpServletRequest req, Model model) {
		int seq = Integer.parseInt(req.getParameter("seq"));
		String content = req.getParameter("content");
		cmt.upCmt(content,seq);
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
		if (session.getAttribute("userType")=="손님") {
			writer += " 🍮";
		}
		else if (session.getAttribute("userType")=="사장님") {
			writer += " 👩‍🍳";
		}
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
	@RequestMapping(value = "/QnA", method = RequestMethod.GET)
	public String goQnA(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		//session.setAttribute("userid", (String)session.getAttribute("userid"));
		model.addAttribute("userid", session.getAttribute("userid"));
		model.addAttribute("userType",session.getAttribute("userType"));

		//System.out.println("page="+brd.selPage());
		model.addAttribute("Maxpage",brd.selQnAPage());
		if(session.getAttribute("crtpage")==null) {
			session.setAttribute("crtpage",1);
		}
		if(session.getAttribute("selType")==null) {
			session.setAttribute("selType","all");
		}
		if(session.getAttribute("orderBy")==null) {
			session.setAttribute("orderBy",1);
		}
		model.addAttribute("orderBy",session.getAttribute("orderBy"));
		model.addAttribute("selType",session.getAttribute("selType"));
		System.out.println("현재 페이지="+session.getAttribute("crtpage"));
		model.addAttribute("crtpage",session.getAttribute("crtpage"));


		return "board/QnABoard";
	}

	@ResponseBody
	@RequestMapping(value = "/selQnABrd", method = RequestMethod.POST,produces="application/text;charset=utf-8")
	public String doQnASel(HttpServletRequest req,Model model) {
		HttpSession session = req.getSession();
		if(session.getAttribute("bName")==null){
			session.setAttribute("bName","");
		}
		String bName = (String) session.getAttribute("bName");
		int page=1;
		if(!(req.getParameter("page")==null)) {
			page = Integer.parseInt(req.getParameter("page"));
			session.setAttribute("crtpage", page);
			System.out.println("page="+page);
		}
		JSONArray ja=new JSONArray();
		int page1 = ((page-1)*12)+1;
		int page2 = page*12;
		ArrayList<boardDTO> arBrd;
		if(session.getAttribute("orderBy")==null || session.getAttribute("orderBy").equals(1)){
			session.setAttribute("orderBy",1);
			arBrd = brd.selQnABrd1(bName,page1,page2);
			//System.out.println(arBrd);
		}
		else{
			if(session.getAttribute("orderBy").equals(2)){
				System.out.println("orderBy = 2");
				arBrd = brd.selQnABrd2(bName,page1,page2);
				//System.out.println(arBrd);
			}
			else if(session.getAttribute("orderBy").equals(3)){
				System.out.println("orderBy = 3");
				arBrd = brd.selQnABrdView1(bName,page1,page2);
				//System.out.println(arBrd);
			}
			else{
				System.out.println("orderBy = 4");
				arBrd = brd.selQnABrdView2(bName,page1,page2);
				//System.out.println(arBrd);
			}
			model.addAttribute("orderBy",session.getAttribute("orderBy"));
		}
		model.addAttribute("Maxpage",brd.searchQnATitle(bName));
		System.out.println("Maxpage="+brd.searchQnATitle(bName));
		for(int i=0;i<arBrd.size();i++) {
			boardDTO bdto = arBrd.get(i);
			JSONObject jo = new JSONObject();
			jo.put("seq", bdto.getBSeqno());
			jo.put("writer", bdto.getWriter());
			jo.put("date", bdto.getBDate());
			jo.put("title", bdto.getTitle());
			jo.put("views", bdto.getViews());
			jo.put("maxPage",brd.searchQnATitle(bName));
			ja.add(jo);
		}
		return ja.toJSONString();
	}

}
