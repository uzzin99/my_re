package com.team.delivery.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team.delivery.DTO.cartDTO;
import com.team.delivery.mappers.iCart;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;


@Controller
@Slf4j
@RequiredArgsConstructor
public class CartController {

	private final iCart ica;


	@RequestMapping(value = "/cart/add", method = RequestMethod.POST)
	@ResponseBody
	public String addCart(cartDTO cart,
						  @RequestParam("mSe") int mSe,
						  @RequestParam("sSe") int sSe,
						  @RequestParam("menuCnt") int cnt,
						  HttpServletRequest request, Model model) {
		HttpSession session=request.getSession();

		String mId = (String) session.getAttribute("userid");

		cartDTO cartdto = new cartDTO();
		cartdto.setMId(mId);
		cartdto.setSSe(sSe);
		cartdto.setMSe(mSe);
		cartdto.setMenuCnt(cnt);
		log.info("sql실행전={}", mId);
		//추가 전 로그인 확인하기 만들기!!!!!
		if(mId==null){
			return Integer.toString(5);
		}else {
			cartDTO checkCart = ica.checkCart(cartdto);
			log.info("sql실행 후 if문 들어가기전");
			if (checkCart != null) {
				return Integer.toString(2);
			} else {
				try {
					int a = ica.addCart(cartdto);
					return Integer.toString(a);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
		}
			return Integer.toString(3);
	}
	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cart(HttpServletRequest request, Model model) {
		HttpSession session=request.getSession();
		String mid=(String) session.getAttribute("userid");
		if(mid != null) {
			ArrayList<cartDTO> cart = ica.listCart(mid);
			model.addAttribute("cart", cart);
		}else{
			return "member/errorLogin";
		}
		return "store/cart";
	}
	
}
