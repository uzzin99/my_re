package com.team.delivery.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.team.delivery.DTO.cartDTO;
import com.team.delivery.mappers.iCart;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.ArrayList;


@Controller
@Slf4j
@RequiredArgsConstructor
public class CartController {

	private final iCart ica;

	@RequestMapping("/modifyCount")
	@ResponseBody
	public String modifyCount(cartDTO cart,
							  @RequestParam("cnt") int cnt,
							  @RequestParam("cartSe") int cartse){
		cartDTO cartdto = new cartDTO();
		cartdto.setMenuCnt(cnt);
		cartdto.setCartSeqno(cartse);
		int a = ica.modifyCount(cartdto);
		return Integer.toString(a);
	}

	@RequestMapping("/delcart")
	@ResponseBody
	public String delCart(@RequestParam("delSe") int delse){

		int a = ica.delCart(delse);
		log.info("삭제성공여부={}",a);

		return Integer.toString(a);
	}

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
		System.out.println("sSe = "+sSe);
		cartdto.setSSe(sSe);
		cartdto.setMSe(mSe);
		cartdto.setMenuCnt(cnt);
		log.info("sql실행전={}", mId);

		if(mId==null){
			return Integer.toString(5);
		}else {
			ArrayList<cartDTO> list = ica.listCart(mId);
			int checkStore = ica.checkStore(cartdto);
			log.info("장바구니에 뭐가 들엇니={}",list);
			log.info("같은가게면 나오셈={}",checkStore);
			if(checkStore > 0 || list.isEmpty()){
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
			}else if(checkStore == 0 && !list.isEmpty()){
				log.info("같은가게가 아님");
				return Integer.toString(4);
			}

		}
			return Integer.toString(3);
	}
	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cart(HttpServletRequest request, Model model) {
		HttpSession session=request.getSession();

		model.addAttribute("userinfo",session.getAttribute("userid"));
		model.addAttribute("userType",session.getAttribute("userType"));
		model.addAttribute("mname",session.getAttribute("mName"));

		String mid=(String) session.getAttribute("userid");
		//주소
		if(mid != null) {
			ArrayList<cartDTO> cart = ica.listCart(mid);
			//arrayList에서 sSe를 뽑아내기 위해 cartDTO를 선언
			if(cart.size() != 0){
				cartDTO cDTO = cart.get(0);
				model.addAttribute("Saddr",ica.selStoreAddr(cDTO.getSSe()));
			}
			model.addAttribute("size",cart.size());
			model.addAttribute("Maddr",ica.selMemberAddr(mid));
			model.addAttribute("cart", cart);
		}else{
			return "member/errorLogin";
		}
		return "store/cart";
	}
	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public String watchorder(HttpServletRequest req, Model model) {
		HttpSession session=req.getSession();
		String mId = (String) session.getAttribute("userid");
		model.addAttribute("userinfo",mId);
		model.addAttribute("userType",session.getAttribute("userType"));
		HttpRequest request = HttpRequest.newBuilder()
				.uri(URI.create("https://api.tosspayments.com/v1/payments/orders/"+req.getParameter("orderId")))
				.header("Authorization", "Basic dGVzdF9za196WExrS0V5cE5BcldtbzUwblgzbG1lYXhZRzVSOg==")
				.method("GET", HttpRequest.BodyPublishers.noBody())
				.build();
		try {
			HttpResponse<String> response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
			String a = response.body();
			JSONParser parser = new JSONParser();
			Object obj = parser.parse(a);
			JSONObject jsonObj = (JSONObject) obj;
			String time = (String)jsonObj.get("requestedAt");
			String date[] = time.split("T");
//			System.out.println(jsonObj);
//			System.out.println("orderName = "+(String)jsonObj.get("orderName"));
//			System.out.println("totalAmount = "+(long)jsonObj.get("totalAmount"));
//			System.out.println("requestedAt = "+(String)jsonObj.get("requestedAt"));
			ica.addOrder(mId,Integer.parseInt(req.getParameter("sSe")),
													(long)jsonObj.get("totalAmount"), (String)jsonObj.get("orderId"),
													date[0], (String)jsonObj.get("orderName"));
			ica.addDetail(mId);
			ica.addDetailTip(ica.getCurrSeq());
			ica.clrCart(mId);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			throw new RuntimeException(e);
		} catch (ParseException e) {
			throw new RuntimeException(e);
		}

		return "store/cart";
	}
	
}
