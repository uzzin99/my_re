package com.team.delivery.controller;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.team.delivery.DTO.reviewDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team.delivery.DTO.StoreDTO;
import com.team.delivery.mappers.iStore;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * Handles requests for the application home page.
 */
@Controller
@Slf4j
@RequiredArgsConstructor
public class StoreController {
	
	private final iStore store;

	@RequestMapping("/reviewAdd")
	public String ReviewAdd(@RequestParam("reviewCon") String content,
							@RequestParam("rating") int score,
							HttpServletRequest request, Model model){
		HttpSession session=request.getSession();

		String mid=(String) session.getAttribute("userid");

//		주문내역에서 눌렀을때 주문번호, 가게번호 받아오기
		int ose = 3;
		int sse = 42;

		reviewDTO dto = new reviewDTO();
		dto.setMId(mid);
		dto.setRContent(content);
		dto.setScore(score);
		log.info("score={}",score);
		dto.setOSe(ose);
		dto.setSSe(sse);
//		가게리뷰창에 별모양으로 별점 나오게 하기
//		가게 평균 별점 구해서 표시
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
		model.addAttribute("storename",storeName);
		ArrayList<StoreDTO> menulist = store.menutable(sSeqno);
		model.addAttribute("mlist",menulist);
		ArrayList<reviewDTO> reviewlist = store.reviewlist(sSeqno);
		model.addAttribute("rlist", reviewlist);

		//찜 여부 확인
		if(session.getAttribute("userid")!=null){
			int cnt=store.zzimStorecount((String) session.getAttribute("userid"),sSeqno);
			model.addAttribute("count",cnt);
		}


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

	@RequestMapping("/z_Check")
	public String doZzimcheck(HttpServletRequest request){
		//찜하기
		String mid=request.getParameter("mid");
		int sSe=Integer.parseInt(request.getParameter("sSe"));
		System.out.println("찜 mid="+mid+"찜 sSe="+sSe);
		store.zzimcheck(mid,sSe);

		return "";
	}
	@RequestMapping("/z_Delete")
	public String doZzimdelete(HttpServletRequest request){
		//찜해제
		String mid=request.getParameter("mid");
		int sSe=Integer.parseInt(request.getParameter("sSe"));
		System.out.println("찜해제 mid="+mid+"찜해제 sSe="+sSe);
		store.zzimdelete(mid,sSe);

		return "";
	}


}

