package com.team.delivery.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import com.team.delivery.DTO.reviewDTO;
import com.team.delivery.mappers.iStore;

import com.team.delivery.DTO.bookingDTO;
import com.team.delivery.mappers.iBooking;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.delivery.DTO.StoreDTO;
import com.team.delivery.DTO.mDTO;
import com.team.delivery.mappers.iMember;
import com.team.delivery.mappers.iMenuStore;

@Controller
@Slf4j
@RequiredArgsConstructor
public class MemberController {

	private final iMember ime;
	private final iMenuStore ims;
  	private final iBooking ibo;
	private final iStore store;
  
	private String upLoadDirectory2 = "C:\\Users\\admin\\Desktop\\team_a-master\\team_a\\src\\main\\resources\\static\\image";

		@RequestMapping("/reviewDel")
		@ResponseBody
		public String ReviewDel(@RequestParam("delSe") int delse){
			log.info("리뷰삭제번호={}",delse);
			int checkDel = store.reviewDel(delse);
			return Integer.toString(checkDel);
		}


		@RequestMapping("/signUp/payment")
		public String paymentDetails(@RequestParam("mId") String mId, HttpServletRequest request, Model model){

			HttpSession session=request.getSession();

			model.addAttribute("userinfo",session.getAttribute("userid"));
			model.addAttribute("userType",session.getAttribute("userType"));

// eunji
			String mid = (String)session.getAttribute("userid");
			ArrayList<reviewDTO> rlist = store.myReviewList(mid);
			model.addAttribute("rlist",rlist);
// yoojin
			ArrayList<bookingDTO>reservationlist = ibo.reservationlist(mId);
			model.addAttribute("list",reservationlist);


			return "member/paymentDetails";
		}

		@RequestMapping("/signUp/dvListup")
		public String dvList(@RequestParam("se") int se, Model model) {
			mDTO selList = ime.seList(se);
			model.addAttribute("list",selList);
			return "member/dvList";
		}
		@RequestMapping("/signUp/dvList")
		public String dvList(Model model) {
			model.addAttribute("list","");
			return "member/dvList";
		}
		
		@RequestMapping("/signUp/delSe")
		public String delSe(@RequestParam("se") int se) {
			ime.delSe(se);
			return "redirect:/signUp/deliveryUp";
		}
		
		@RequestMapping("/signUp/upDelivery")
		public String upDelivery(@RequestParam("newname") String newname,
				@RequestParam("newmobile") String newmobile,
				@RequestParam("postcode") String postcode,
				@RequestParam("address") String address,
				@RequestParam("detailAddress") String detailaddress,
				@RequestParam("extraAddress") String extraaddress,
				@RequestParam("checked") String checked,
				@RequestParam("se") int se,
				HttpServletRequest request) {
			HttpSession session=request.getSession();
			String mId=(String)session.getAttribute("userid");

			if(checked.equals("Y")) {
				ime.upDeliveryList(postcode, address, detailaddress, extraaddress, newname,newmobile, se);
				ime.upDelivery(postcode, address, detailaddress, extraaddress,mId);
			}else {
				ime.upDeliveryList(postcode, address, detailaddress, extraaddress, newname,newmobile, se);
			}
			
			return "redirect:/signUp/dvList";
		}
		
		@RequestMapping("/signUp/addDelivery")
		public String addDelivery(@RequestParam("newname") String newname,
				@RequestParam("newmobile") String newmobile,
				@RequestParam("postcode") String postcode,
				@RequestParam("address") String address,
				@RequestParam("detailAddress") String detailaddress,
				@RequestParam("extraAddress") String extraaddress,
				@RequestParam("checked") String checked,
				HttpServletRequest request) {
			HttpSession session=request.getSession();
			String mId=(String)session.getAttribute("userid");
			

			if(checked.equals("Y")) {
				ime.addDelivery(mId, address, postcode, detailaddress, extraaddress, newname, newmobile);
				ime.upDelivery(postcode, address, detailaddress, extraaddress,mId);
			}else {
				ime.addDelivery(mId, address, postcode, detailaddress, extraaddress, newname, newmobile);
			}
			
			return "redirect:/signUp/dvList";
		}
		
		@RequestMapping("/signUp/deliveryUp")
		public String doDeliveryUp(HttpServletRequest request, Model model) {
			HttpSession session=request.getSession();

			model.addAttribute("userinfo",session.getAttribute("userid"));
			model.addAttribute("userType",session.getAttribute("userType"));

			mDTO mdto=ime.userList((String)session.getAttribute("userid"));
			model.addAttribute("mdto",mdto);
			
			ArrayList<mDTO> list=ime.deliveryList((String)session.getAttribute("userid"));
			model.addAttribute("list",list);
			
			return "member/deliveryUp";
		}
		
		@RequestMapping("/signUp/delInformation")
		public String delInformation(HttpServletRequest request) {
			HttpSession session=request.getSession();
			int sSe=Integer.parseInt(request.getParameter("delseq"));
			String simg=request.getParameter("dellogo");

			if(session.getAttribute("userType")=="손님"){
				ime.delInformation((String)session.getAttribute("userid"));
				ime.delDelivery((String)session.getAttribute("userid"));
			}else if(session.getAttribute("userType")=="사장"){
				ime.delInformation((String)session.getAttribute("userid"));
				ime.delDelivery((String)session.getAttribute("userid"));
				if(simg!=null){
					ims.deleteStore((String)session.getAttribute("userid"));
					File dfile = new File(upLoadDirectory2,simg);
					dfile.delete();
				}
//				if(){/*메뉴 이미지 삭제 구현하기*/
//					ims.deleteAllMenu((String)session.getAttribute("userid"));
//				}
			}

			session.invalidate();
			return "redirect:/main";
		}
		
		@RequestMapping(value="/signUp/informationUpdate", method=RequestMethod.POST)
		public String information(@RequestParam("username") String name,
				@RequestParam("usermobile") String mobile,
				@RequestParam("useremail") String email,
				HttpServletRequest request) {
			HttpSession session=request.getSession();
			
			ime.updateLogin(name,mobile,email,(String)session.getAttribute("userid"));
			
			return "redirect:/signUp";
		}
		
		@RequestMapping("/signUp/informationUp")
		public String doInformationUp(HttpServletRequest request, Model model) {
			HttpSession session=request.getSession();

			model.addAttribute("userinfo",session.getAttribute("userid"));
			model.addAttribute("userType",session.getAttribute("userType"));

			mDTO mdto=ime.userList((String)session.getAttribute("userid"));
			model.addAttribute("mdto",mdto);
			
			return "member/informationUp";
		}
		
		@ResponseBody
		@RequestMapping(value="/signUp/pwdNew", method=RequestMethod.POST)
		public String pwdNew(@RequestParam("pwd") String pwd,
				HttpServletRequest request, Model model) {
			HttpSession session=request.getSession();

			model.addAttribute("userinfo",session.getAttribute("userid"));
			model.addAttribute("userType",session.getAttribute("userType"));

			ime.updatePwd(pwd, (String)session.getAttribute("userid"));
			
			return Integer.toString(1);
		}
		

		@ResponseBody
		@RequestMapping(value = "/signUp/pwd_check", method = RequestMethod.POST)
		public String doPwdCheck(@RequestParam("pwd") String pwd,
				HttpServletRequest request) {
			HttpSession session=request.getSession();

			int check=ime.checkId((String)session.getAttribute("userid"), pwd);

			return String.valueOf(check);
		}
		
		@RequestMapping("/signUp/checkpwd")
		public String doCheckPwd(HttpServletRequest request, Model model) {
			HttpSession session=request.getSession();

			model.addAttribute("userinfo",session.getAttribute("userid"));
			model.addAttribute("userType",session.getAttribute("userType"));

			mDTO mdto=ime.userList((String)session.getAttribute("userid"));
			model.addAttribute("mdto",mdto);
			
			return "member/checkpwd";
		}
		
		@RequestMapping("/signUp")
		public String dosignUp(HttpServletRequest request, Model model) {
			HttpSession session=request.getSession();

			model.addAttribute("userinfo",session.getAttribute("userid"));
			model.addAttribute("userType",session.getAttribute("userType"));
			
			mDTO mdto=ime.userList((String)session.getAttribute("userid"));
			model.addAttribute("mdto",mdto);
			
			int cnt=ime.cntAddress((String)session.getAttribute("userid"));
			model.addAttribute("cnt",cnt);
			

		    int cntStore = ims.cntStore((String)session.getAttribute("userid"));
		    model.addAttribute("cntStore",cntStore);

		    StoreDTO sVO = ims.selStore((String)session.getAttribute("userid"));
		    model.addAttribute("sVO",sVO);

			return "member/signUp";
		}
		
		@RequestMapping(value="/user_check",method = RequestMethod.POST)
		public String doUserCheck(@RequestParam("id") String id,
				@RequestParam("pwd") String pwd,
				HttpServletRequest request,
				Model model) {
			
			HttpSession session=request.getSession();
			
			int check=ime.checkId(id, pwd);


			if(check == 1) {
				session.setAttribute("userid", id);

				mDTO profile=ime.profile(id, pwd);

				session.setAttribute("mName",profile.getMName());
				session.setAttribute("mAddress",profile.getMAddress());
				session.setAttribute("mDetailaddress",profile.getMDetailAddress());
				session.setAttribute("mExtraaddress",profile.getMExtraAddress());
				session.setAttribute("mMobile",profile.getMMobile());

				if(profile.getMType() == 3) {
					session.setAttribute("userType", "손님");
				}else if(profile.getMType() == 2) {
					session.setAttribute("userType", "사장님");
				}
			}else {
				model.addAttribute("ch","<h7>등록되지 않은 계정입니다.</h7>");
				return "member/login";
			}

			Object destination = session.getAttribute("destination");
			String redirect = destination != null ? (String) destination : (String) "/main";

			return "redirect:"+redirect;
		}

		@RequestMapping("/errorLogin")
		public String errorLogin(HttpServletRequest request, Model model) {
			return "member/errorLogin";
		}
		@RequestMapping("/login")
		public String doLogin(HttpServletRequest request, Model model) {

//			HttpSession session=request.getSession();

//			model.addAttribute("userinfo",session.getAttribute("userid"));
//			model.addAttribute("userType",session.getAttribute("userType"));

			return "member/login";
		}
		
		@RequestMapping("/logout")
		public String doLogout(HttpServletRequest req) {
			HttpSession session=req.getSession();
			session.invalidate();
			return "redirect:/main";
		}
		
		@RequestMapping(value = "/usersign", method = RequestMethod.POST)
		public String usersign(@RequestParam("userid") String id,
				@RequestParam("userpwd") String pwd,
				@RequestParam("username") String name,
				@RequestParam("postcode") String postcode,
				@RequestParam("address") String address,
				@RequestParam("detailAddress") String detailaddress,
				@RequestParam("extraAddress") String extraaddress,
				@RequestParam("usermobile") String mobile,
				@RequestParam("useremail") String mail,
				@RequestParam("mType") int type) {
			
			ime.addMember(id,pwd,name,mobile,type,postcode,address,detailaddress,extraaddress,mail);
			ime.addDelivery(id, address, postcode, detailaddress, extraaddress,name,mobile);
			
			return "member/login";
		}
		
		@ResponseBody
		@RequestMapping(value = "/idoverlap")
		public String idOverlap(@RequestParam("userid") String id) {

			int check=ime.idOverlap(id);
			return Integer.toString(check);
		}
		
		@RequestMapping("/userSign")
		public String userSign(@RequestParam("Sign") String type,
							   HttpServletRequest request, Model model) {
			HttpSession session=request.getSession();

			model.addAttribute("userinfo",session.getAttribute("userid"));
			model.addAttribute("userType",session.getAttribute("userType"));

			model.addAttribute("type",type);
			return "member/userSign";
		}
		
		@RequestMapping("/signin")
		public String doSignin(HttpServletRequest request, Model model) {
			HttpSession session=request.getSession();

			model.addAttribute("userinfo",session.getAttribute("userid"));
			model.addAttribute("userType",session.getAttribute("userType"));

			return "member/signin";
		}
}
