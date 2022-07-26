package com.team.delivery.controller;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

	@RequestMapping("/store/menuDetail")
	public String menuDetail(@RequestParam("mSe") int mSe,
			@RequestParam("sSe") int sSe,
			Model model) {

		StoreDTO menudetail=store.listMenuDetail(mSe, sSe);
		model.addAttribute("detail",menudetail);
		return "store/menuDetail";
	}
	
	@RequestMapping("/store/menu")
	public String Menu(@RequestParam int sSeqno, Model model) {

		ArrayList<StoreDTO> menulist = store.menutable(sSeqno);
		model.addAttribute("mlist",menulist);
		ArrayList<StoreDTO> reviewlist = store.reviewlist(sSeqno);
		model.addAttribute("rlist", reviewlist);
		return "store/menu";
	}
	
	@GetMapping("/store")
	public String doStore(@RequestParam("type") int type, Model model) {
		log.info("type = {}", type);
		ArrayList<StoreDTO> storelist = store.liststore(type);
		model.addAttribute("list", storelist);
		log.info("list = {}",storelist);
		return "store/store";
	}
	
	@RequestMapping("/search/store")
	public String Search(@RequestParam("word") String sName, Model model, HttpServletRequest request) {

		ArrayList<StoreDTO> searchlist = store.searchtable(sName);
		model.addAttribute("list", searchlist);
		return "search";
	}
}

