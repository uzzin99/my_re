package com.team.delivery.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.team.delivery.DTO.StoreDTO;
import com.team.delivery.DTO.stypeVO;
import com.team.delivery.mappers.iMenuStore;

import org.springframework.ui.Model;

@Controller
@Slf4j
@RequiredArgsConstructor
public class MenuStoreController {


	private final iMenuStore ims;

	private String upLoadDirectory = "C:\\Users\\admin\\Downloads\\delivery\\delivery\\src\\main\\resources\\static\\upload";
	private String upLoadDirectory2 = "C:\\Users\\admin\\Desktop\\team_a-master\\team_a\\src\\main\\resources\\static\\image";


	//가게등록하기
	@RequestMapping("/s_up")
	public String doS_up(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();

		model.addAttribute("userinfo",session.getAttribute("userid"));
		model.addAttribute("userType",session.getAttribute("userType"));

		ArrayList<stypeVO> ar = ims.sType();
		model.addAttribute("list", ar);
		return "member/storeUp";
	}

	@RequestMapping(value = "/storeAdd", method = RequestMethod.POST)
	public String doStore(HttpServletRequest req, @RequestParam("file") MultipartFile file) {
		String m_id = req.getParameter("member_id");
		String s_name = req.getParameter("storename");
		String postcode = req.getParameter("postcode");
		String storeAds = req.getParameter("address");
		String detailAds = req.getParameter("detailAddress");
		String extraAds = req.getParameter("extraAddress");
		String s_num = req.getParameter("storenum");
		String s_mobile = req.getParameter("storetel");
		int s_type = Integer.parseInt(req.getParameter("menutype"));

		String uploadFileName = file.getOriginalFilename();
		//System.out.println("file=" + uploadFileName + ",menuname=" + s_name);
		uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("/") + 1); //문자열 자르기
		//System.out.println("upload=" + uploadFileName);
		UUID uuid = UUID.randomUUID(); //랜덤이름생성
		//System.out.println("uuid=" + uuid);
		uploadFileName = uuid.toString() + "_" + uploadFileName; //랜덤이름_업로드파일명
		//System.out.println("uploadFileName=" + uploadFileName);

		File f = new File(upLoadDirectory2, uploadFileName);
		String[]  str=uploadFileName.split("_");
		try {
			if(str.length==2){
				ims.insertStore(m_id, s_name, postcode, storeAds, detailAds, extraAds, s_num, s_mobile, s_type, uploadFileName);
				file.transferTo(f);
			}else if(str.length==1){
				String img="";
				ims.insertStore(m_id, s_name, postcode, storeAds, detailAds, extraAds, s_num, s_mobile, s_type, img);
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "redirect:/signUp";
	}

	@RequestMapping("/s_info")
	public String doSinfo(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		model.addAttribute("userinfo", session.getAttribute("userid"));
		StoreDTO sVO = ims.selStore((String) session.getAttribute("userid"));
		model.addAttribute("sVO", sVO);
		return "member/storeinfo";
	}

	//가게 등록 후 로고 등록하기
	@RequestMapping(value = "/sImg_mo", method = RequestMethod.POST)
	public String doSImgmo(HttpServletRequest req, @RequestParam("sfile") MultipartFile file) {
		int sSe=Integer.parseInt(req.getParameter("s_seq"));
		//System.out.println("sSe="+sSe);
		String storelogo = file.getOriginalFilename();
		storelogo = storelogo.substring(storelogo.lastIndexOf("/") + 1); //문자열 자르기
		UUID uuid = UUID.randomUUID(); //랜덤이름생성
		storelogo = uuid.toString() + "_" + storelogo; //랜덤이름_업로드파일명

		File f = new File(upLoadDirectory2, storelogo);
		String[]  str=storelogo.split("_");
		try {
			if(str.length==2){
				ims.updateLogo(storelogo, sSe);
				file.transferTo(f);
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "redirect:/signUp";
	}


	//가게 정보 및 로고 수정하기
	@RequestMapping("/s_list")
	public String doStoreList(HttpServletRequest req, Model model){
		HttpSession session = req.getSession();
		model.addAttribute("userinfo", session.getAttribute("userid"));

		StoreDTO sVO=ims.selStore((String) session.getAttribute("userid"));
		model.addAttribute("sVO",sVO);

		ArrayList<stypeVO> ar = ims.sType();
		model.addAttribute("list", ar);
		return "member/storeModify";
	}

	@RequestMapping(value="storeMo", method=RequestMethod.POST)
	public String doStoreMo(HttpServletRequest req, @RequestParam("file") MultipartFile file){
		int sSe=Integer.parseInt(req.getParameter("s_seq")); //추가
		String m_id = req.getParameter("member_id");
		String s_name = req.getParameter("storename");
		String postcode = req.getParameter("postcode");
		String storeAds = req.getParameter("address");
		String detailAds = req.getParameter("detailAddress");
		String extraAds = req.getParameter("extraAddress");
		String s_num = req.getParameter("storenum");
		String s_mobile = req.getParameter("storetel");
		int s_type = Integer.parseInt(req.getParameter("menutype"));
		String title=req.getParameter("hidlogo");//불러온 이미지파일 이름

		String storelogo = file.getOriginalFilename();
		storelogo = storelogo.substring(storelogo.lastIndexOf("/") + 1); //문자열 자르기

		UUID uuid = UUID.randomUUID(); //랜덤이름생성
		storelogo = uuid.toString() + "_" + storelogo; //랜덤이름_업로드파일명


		//test
//		try{
//			String path="C:\\Users\\admin\\Desktop\\team_a-master\\team_a\\src\\main\\resources\\static\\image\\168";
//			//Path path = Paths.get("C:\\Users\\admin\\Desktop\\team_a-master\\team_a\\src\\main\\resources\\static\\image\\"+sSe+"\\");
//			//Path path = Paths.get("image\\"+sSe+"\\");
//			File f=new File(path);
//			if(f.mkdir()){
//				System.out.println("디렉토리 생성 성공");
//			}else{
//				System.out.println("디렉토리 생성 실패");
//			}
//
////			Path path = Paths.get("static\\image\\"+sSe);
////			Path temp = Files.createTempFile(String.valueOf(path), storelogo);
////			System.out.println("Temp file : " + temp);
////			File f = new File(path,storelogo);
////			if(!path.exists()) {
////			// 폴더를 생성합니다.
////			f.mkdirs();
////			System.out.println("폴더를 생성합니다.");
////			// 정성적으로 폴더 생성시 true를 반환합니다.
////			System.out.println("폴더가 존재하는지 체크 true/false : "+f.exists());
////			} else {
////				System.out.println("이미 해당 폴더가 존재합니다.");
////			}
//
//			String[]  str=storelogo.split("_");
//			if(str.length==2){
//				ims.modifyStore1(m_id,s_name,postcode,storeAds,detailAds,extraAds,s_num,s_mobile,s_type,storelogo);
//				file.transferTo(f);
//				//기존파일 삭제하기
//				File dfile = new File(upLoadDirectory2, title);
//				dfile.delete();
//			}else if(str.length==1){
//				ims.modifyStore2(m_id, s_name, postcode, storeAds, detailAds, extraAds, s_num, s_mobile, s_type);
//			}
//
//		}catch (IOException e) {
//			e.printStackTrace();
//		}
		//여기까지

		File f = new File(upLoadDirectory2, storelogo);
		String[]  str=storelogo.split("_");
		try {
			if(str.length==2){
				ims.modifyStore1(m_id,s_name,postcode,storeAds,detailAds,extraAds,s_num,s_mobile,s_type,storelogo);
				file.transferTo(f);
				//기존파일 삭제하기
				File dfile = new File(upLoadDirectory2, title);
				if(title !="imgload.png"){
					dfile.delete();
				}
			}else if(str.length==1){
				ims.modifyStore2(m_id, s_name, postcode, storeAds, detailAds, extraAds, s_num, s_mobile, s_type);
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "redirect:/s_info";
	}

	//--------------------------------------------------------------------------------------
	//메뉴등록하기
	@RequestMapping("/m_up")
	public String doMup(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		model.addAttribute("userinfo",session.getAttribute("userid"));
		model.addAttribute("userType",session.getAttribute("userType"));
		StoreDTO sVO = ims.selStore((String) session.getAttribute("userid"));
		model.addAttribute("sVO", sVO);
		return "store/menuUp";
	}

	@RequestMapping(value = "/menuAdd", method = RequestMethod.POST)
	public String doMenu(HttpServletRequest req, @RequestParam("file") MultipartFile file) {
		String name = req.getParameter("menuname");
		int price = Integer.parseInt(req.getParameter("menuprice"));
		String ex = req.getParameter("menuex");
		String cal = req.getParameter("menukcal");
		int mSeq = Integer.parseInt(req.getParameter("mSeq"));
		int sSeq = Integer.parseInt(req.getParameter("sSeq"));
		//System.out.println("file=" + file + ", menuname=" + name + ", price=" + price + ", ex=" + ex);

		String uploadFileName = file.getOriginalFilename();
		uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
		UUID uuid = UUID.randomUUID();
		uploadFileName = uuid.toString() + "_" + uploadFileName;
		File f = new File(upLoadDirectory2, uploadFileName);
		try {
			if (mSeq == 0) {
				String[]  str=uploadFileName.split("_");
				//System.out.println("str[0]="+str[0]);
				if(str.length==2){
					ims.insertMenu(sSeq, name, price, ex, uploadFileName, cal);
					file.transferTo(f);
				}else if(str.length==1){ //img null인 경우
					String nullimg="";
					ims.insertMenu(sSeq, name, price, ex, nullimg, cal);
				}
			} else if (mSeq != 0) {
				ims.modifyMenu(name, price, ex, cal, mSeq, sSeq);
			}

		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "redirect:/m_up";
	}

	@RequestMapping(value = "/img_mo")
	public String doImgUpdate(HttpServletRequest req, @RequestParam("file2") MultipartFile file) {
		int mSeq = Integer.parseInt(req.getParameter("mSeq2"));
		int sSeq = Integer.parseInt(req.getParameter("sSeq2"));
		String title=req.getParameter("title");
		//System.out.println("file=" + file + "//mSeq=" + mSeq + "/sSeq=" + sSeq);

		String uploadFileName2 = file.getOriginalFilename();
		uploadFileName2 = uploadFileName2.substring(uploadFileName2.lastIndexOf("/") + 1);
		UUID uuid = UUID.randomUUID();
		uploadFileName2 = uuid.toString() + "_" + uploadFileName2;
		File f = new File(upLoadDirectory2, uploadFileName2);
		try {
			String[]  str=uploadFileName2.split("_");
			if(str.length==2){
				ims.modifyImage(uploadFileName2, mSeq, sSeq);
				file.transferTo(f);
				//기존파일 삭제하기
				File dfile = new File(upLoadDirectory2, title);
				if(title !="imgload.png"){
					dfile.delete();
				}
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "redirect:/m_up";
	}

	@ResponseBody
	@RequestMapping(value = "/mls", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public String doMls(@RequestParam("sSeq") int sSeq, Model model) {
		ArrayList<StoreDTO> armenu = ims.selectMenuList(sSeq);
		//System.out.println("menu_list.size=[" + armenu.size() + "]");

		JSONArray ja = new JSONArray();
		for (int i = 0; i < armenu.size(); i++) {
			StoreDTO list = armenu.get(i);
			JSONObject jo = new JSONObject();
			jo.put("mSeq", list.getMenuSeqno());
			jo.put("sSeq", list.getSSe());
			jo.put("m_img", list.getMenuImg());
			jo.put("mName", list.getMenuName());
			jo.put("m_price", list.getMenuPrice());
			jo.put("m_cal", list.getMenuCal());
			jo.put("m_ex", list.getMenuEx());
			ja.add(jo);
		}
		//System.out.println("ja.s_list()=" + ja.toJSONString());
		return ja.toJSONString();
	}

	@ResponseBody
	@RequestMapping(value = "/update", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public String doMenuUpdate(HttpServletRequest req, Model model) {
		int mSeq = Integer.parseInt(req.getParameter("mSeq"));
		int sSeq = Integer.parseInt(req.getParameter("sSeq"));
		StoreDTO mvo = ims.updateMenuList(mSeq, sSeq);

		JSONArray ja = new JSONArray();
		JSONObject jo = new JSONObject();
		jo.put("m_img", mvo.getMenuImg());
		jo.put("mName", mvo.getMenuName());
		jo.put("m_price", mvo.getMenuPrice());
		jo.put("m_cal", mvo.getMenuCal());
		jo.put("m_ex", mvo.getMenuEx());
		ja.add(jo);

		//System.out.println("ja.s_mvo()=" + ja.toJSONString());
		return ja.toJSONString();
	}

	@RequestMapping("/delete")
	public String delFile(@RequestParam("mSe") int mSeq, @RequestParam("sSe") int sSeq,
										  @RequestParam("deleteFile") String filename) {
		log.info("delete?mSe=" + mSeq + "&sSe=" + sSeq + "&deleteFile=" + filename);

		File f = new File(upLoadDirectory2, filename);
		try {
			if(filename =="imgload.png"){
				ims.deleteMenu(mSeq, sSeq);
			}else{
				ims.deleteMenu(mSeq, sSeq);
				f.delete();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/m_up";
	}
}
