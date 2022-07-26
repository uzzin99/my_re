package com.team.delivery.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team.delivery.DTO.cartDTO;
import com.team.delivery.mappers.iCart;



@Controller
@Slf4j
@RequiredArgsConstructor
public class CartController {

	private final iCart ica;


	@RequestMapping(value = "/cart/add", method = RequestMethod.GET)
	public String addCart(cartDTO cart, HttpServletRequest request) {
		HttpSession session=request.getSession();

		String mId = "kim";
		int mSe = 5;
		int count = 1;
		int sSe = 23;
		
		cartDTO cartdto = new cartDTO();
		cartdto.setMId(mId);
		cartdto.setSSe(sSe);
		cartdto.setMSe(mSe);
		cartdto.setMenuCnt(count);
		
		
		cartDTO checkCart = ica.checkCart(cartdto);
		
		if(checkCart != null) {
			System.out.println(2);
			//return 2;
		}else {
			try {
				int a = ica.addCart(cartdto);
				System.out.println(a);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
				
		return "store/cart";
	}
	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cart() {
//		String mId = "kim";
//		int mSe = 22;
//		int count = 2;
//		int sSe = 23;
//		
//		cartDTO cart = new cartDTO();
//		cart.setmId(mId);
//		cart.setsSe(sSe);
//		cart.setmSe(mSe);
//		cart.setmenuCnt(count);
//		
//		CartMapper mapper = sqlSession.getMapper(CartMapper.class);
//		try {
//			mapper.addCart(cart);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		return "store/cart";
	}
	
}
