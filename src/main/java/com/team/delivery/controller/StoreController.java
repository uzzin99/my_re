package com.team.delivery.controller;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.team.delivery.DTO.boardDTO;
import com.team.delivery.DTO.mDTO;
import com.team.delivery.DTO.reviewDTO;
import com.team.delivery.mappers.iBoard;
import com.team.delivery.mappers.iCart;
import com.team.delivery.mappers.iMember;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.team.delivery.DTO.StoreDTO;
import com.team.delivery.mappers.iStore;


/**
 * Handles requests for the application home page.
 */
@Controller
@Slf4j
@RequiredArgsConstructor
public class StoreController {
	
	private final iStore store;
	private final iCart ica;
	private final iBoard brd;
	private final iMember ime;

	@RequestMapping("/reviewAdd")
	public String ReviewAdd(@RequestParam("reviewCon") String content,
							@RequestParam("rating") int score,
							@RequestParam("oSe") int ose,
							@RequestParam("sSe") int sse,
							HttpServletRequest request, Model model){
		HttpSession session=request.getSession();

		String mid=(String) session.getAttribute("userid");

		ica.reviewDone(ose);
		reviewDTO dto = new reviewDTO();
		dto.setMId(mid);
		dto.setRContent(content);
		dto.setScore(score);
		log.info("score={}",score);
		dto.setOSe(ose);
		dto.setSSe(sse);
		try {
			int checkAdd = store.reviewAdd(dto);
			log.info("성공 랄라");
		}catch(Exception e){
			e.printStackTrace();
		}
		return "redirect:/store/menu?sSeqno="+sse;
	}

	@RequestMapping("/review")
	public String Review(HttpServletRequest request, Model model){
		HttpSession session=request.getSession();

		model.addAttribute("userinfo",session.getAttribute("userid"));
		model.addAttribute("userType",session.getAttribute("userType"));
		model.addAttribute("oSe",request.getParameter("oseq"));
		model.addAttribute("sSe",request.getParameter("sseq"));
		return "store/review";
	}

	@RequestMapping("/store/menuDetail")
	public String menuDetail(@RequestParam("mSe") int mSe,
			@RequestParam("sSe") int sSe,
			Model model) {

		StoreDTO menudetail=store.listMenuDetail(mSe, sSe);
		model.addAttribute("menu",menudetail);
		return "store/menuDetail";
	}

	@RequestMapping("/store/menu")
	public String Menu(@RequestParam("sSeqno") int sSeqno,
					   HttpServletRequest request, Model model) {

		HttpSession session=request.getSession();

		model.addAttribute("userinfo",session.getAttribute("userid"));
		model.addAttribute("userType",session.getAttribute("userType"));

		int cnt = store.reviewCnt(sSeqno);
		if(cnt > 0) {
			double avg=store.storeAvg(sSeqno);
			avg = Math.round(avg * 100) / 100.0;
			model.addAttribute("avg", avg);
			log.info("가게평균={}", avg);
			model.addAttribute("cnt", cnt);
		}else{
			log.info("공백넘어감");
			model.addAttribute("cnt","");
		}
		StoreDTO storeName = store.storeName(sSeqno);
		mDTO member =ime.userList(storeName.getMId());
		model.addAttribute("member", member);
		model.addAttribute("storename",storeName);
		ArrayList<StoreDTO> menulist = store.menutable(sSeqno);
		model.addAttribute("mlist",menulist);
		ArrayList<reviewDTO> reviewlist = store.reviewlist(sSeqno);
		model.addAttribute("rlist", reviewlist);

		//찜 여부 확인
		if(session.getAttribute("userid")!=null){
			int count=store.zzimStorecount((String) session.getAttribute("userid"),sSeqno);
			model.addAttribute("count",count);
		}
		//가게당 찜 카운트
		int zcnt=store.zzimcount(sSeqno);
		model.addAttribute("zcnt",zcnt);

		return "store/menu";
	}

	@GetMapping("/store")
	public String doStore(@RequestParam("type") int type, HttpServletRequest request, Model model) {

		HttpSession session=request.getSession();

		model.addAttribute("userinfo",session.getAttribute("userid"));
		model.addAttribute("userType",session.getAttribute("userType"));

		ArrayList<StoreDTO> storelist = store.liststore(type);
		model.addAttribute("list", storelist);

		return "store/store";
	}

	@RequestMapping("/search/store")
	public String Search(@RequestParam("word") String sName, Model model, HttpServletRequest request) {
		HttpSession session=request.getSession();

		model.addAttribute("userinfo",session.getAttribute("userid"));
		model.addAttribute("userType",session.getAttribute("userType"));
		ArrayList<StoreDTO> searchlist = store.searchtable(sName);
		model.addAttribute("list", searchlist);

		return "search";
	}

	@RequestMapping("/store/z_Check")
	public String doZzimcheck(HttpServletRequest request){
		//찜하기
		String mid=request.getParameter("mid");
		int sSe=Integer.parseInt(request.getParameter("sSe"));
		System.out.println("찜 mid="+mid+"찜 sSe="+sSe);

		int cnt=store.zzimStorecount(mid,sSe);
		if(cnt == 0){
			store.zzimcheck(mid,sSe);
		}
		return "redirect:/store/menu?sSeqno="+sSe;
	}

	@RequestMapping("/store/z_Delete")
	public String doZzimdelete(HttpServletRequest request){
		//찜해제
		String mid=request.getParameter("mid");
		int sSe=Integer.parseInt(request.getParameter("sSe"));
		System.out.println("찜해제 mid="+mid+"찜해제 sSe="+sSe);

		int cnt=store.zzimStorecount(mid,sSe);
		if(cnt == 1) {
			store.zzimdelete(mid, sSe);
		}
		return "redirect:/store/menu?sSeqno="+sSe;
	}

	@RequestMapping("/store/z_list")
	public String doZlist(HttpServletRequest req, Model model){
		HttpSession session = req.getSession();
		model.addAttribute("userinfo",session.getAttribute("userid"));
		model.addAttribute("userType",session.getAttribute("userType"));

		//찜 목록 리스트 불러오기
		ArrayList<StoreDTO> zzimlist=store.zzimlist((String) session.getAttribute("userid"));
		System.out.println("zzimlist="+zzimlist);
		System.out.println("zzimlist size()="+zzimlist.size());
		model.addAttribute("zlist",zzimlist);
		//찜한 가게 수
		int s_cnt=store.zzimstorecount((String) session.getAttribute("userid"));
		model.addAttribute("s_cnt",s_cnt);
//		//평균 평점
//		double avg=store.storeAvg(sSe);
//		model.addAttribute("avg",avg);

		return "store/zzimlist";
	}

//	@ResponseBody
//	@RequestMapping(value="/z_menu",method=RequestMethod.GET,produces = "application/json;charset=UTF-8")
//	public String doZmenulist(HttpServletRequest req,Model model){
//		HttpSession session = req.getSession();
//		int sSe=Integer.parseInt(req.getParameter("SSe"));
//
//		//찜 가게의 메뉴목록(일부 보여주기 용)
//		ArrayList<StoreDTO> zmenu=store.zzimstoremenulist((String) session.getAttribute("userid"),sSe);
//		System.out.println("zmenu="+zmenu);
//
//		JSONArray ja = new JSONArray();
//		for (int i = 0; i < zmenu.size(); i++) {
//			StoreDTO list = zmenu.get(i);
//			JSONObject jo = new JSONObject();
//			jo.put("menu", list.getMenuName());
//			ja.add(jo);
//		}
//		model.addAttribute("zmenu",ja.toJSONString());
//
//		return ja.toJSONString();
//	}


}

