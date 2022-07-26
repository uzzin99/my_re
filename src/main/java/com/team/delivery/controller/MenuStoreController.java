package com.team.delivery.controller;

import java.util.ArrayList;
import java.util.UUID;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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

	private String upLoadDirectory="C:\\Users\\admin\\Downloads\\delivery\\delivery\\src\\main\\resources\\static\\upload";



	@RequestMapping("/s_up")
	public String doS_up(HttpServletRequest req, Model model) {
		HttpSession session=req.getSession();
		model.addAttribute("userinfo",session.getAttribute("userid"));

		ArrayList<stypeVO> ar=ims.sType();
		model.addAttribute("list",ar);
		return "member/storeUp";
	}
		
//	@ResponseBody
//	@RequestMapping(value="/mtp", produces="application/json;charset=UTF-8")
//	public String doMtp() {
//		ArrayList<stypeVO> arsvo=ims.sType();
//
//		JSONArray ja=new JSONArray();
//		for(int i=0;i<arsvo.size();i++) {
//			stypeVO list=arsvo.get(i);
//			JSONObject jo=new JSONObject();
//			jo.put("sType", list.getSType());
//			jo.put("typeName", list.getTypeName());
//			ja.add(jo);
//		}
//		return ja.toJSONString();
//	}


	@RequestMapping(value="/store", method=RequestMethod.POST)
	public String doStore(HttpServletRequest req, @RequestParam("file") MultipartFile file) {
		String s_id=req.getParameter("sid");
		String s_name=req.getParameter("sname");
		String postcode=req.getParameter("post");
		String storeAds=req.getParameter("saddress");
		String detailAds=req.getParameter("sdetail");
		String extraAds=req.getParameter("sextra");
		String s_num=req.getParameter("snum");
		String s_mobile=req.getParameter("stel");
		int s_type=Integer.parseInt(req.getParameter("smenu"));

		String uploadFileName = file.getOriginalFilename();
		System.out.println("file="+uploadFileName+",menuname="+s_name);

		uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("/")+1); //문자열 자르기
		System.out.println("upload="+uploadFileName);

		UUID uuid=UUID.randomUUID(); //랜덤이름생성
		System.out.println("uuid="+uuid);

		uploadFileName=uuid.toString() + "_" + uploadFileName; //랜덤이름_업로드파일명
		System.out.println("uploadFileName="+uploadFileName);

		File f= new File(upLoadDirectory,uploadFileName);
		try {
			if(uploadFileName!=null) {
				file.transferTo(f); //파일 폴더에 저장
			}
			ims.insertStore(s_id, s_name, postcode, storeAds, detailAds, extraAds, s_num, s_mobile, s_type, uploadFileName);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "resirect:/main";
	}
		
	@RequestMapping("/s_info")
	public String doSinfo() {
		return "member/storeinfo";
	}

	@RequestMapping("/m_up")
	public String doMup(HttpServletRequest req, Model model) {
		HttpSession session=req.getSession();
		model.addAttribute("userinfo", session.getAttribute("userid"));
		StoreDTO sVO = ims.selStore((String)session.getAttribute("userid"));
	    model.addAttribute("sVO",sVO);
		return "store/menuUp";
	}
		
//	@RequestMapping(value="/menu")
//	public String doMenu(HttpServletRequest req, MultipartHttpServletRequest mreq) {
//		iMenuStore ifresh=sqlSession.getMapper(iMenuStore.class);
//		String name=req.getParameter("menuname");
//		int price=Integer.parseInt(req.getParameter("menuprice"));
//		String ex=req.getParameter("menuex");
//		String cal=req.getParameter("menukcal");
//		int mSeq=Integer.parseInt(req.getParameter("mSeq"));
//		String sSeq=req.getParameter("sSeq");
//		MultipartFile file=mreq.getFile("file");
//		
//		String upLoadDirectory= "C:\\Users\\admin\\git\\first-project\\team_a\\src\\main\\webapp\\resources\\upload";
//		System.out.println("file="+file+"menuname="+name);
//		  
//		String uploadFileName = file.getOriginalFilename();
//		uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("/")+1);
//		UUID uuid=UUID.randomUUID();
//		uploadFileName=uuid.toString() + "_" + uploadFileName;
//		File f= new File(upLoadDirectory,uploadFileName);
//		try {
//			if(mSeq==0) {
//				ifresh.insertmenu(sSeq, name, price, ex, uploadFileName, cal);
//			}else if(mSeq!=0){
//				ifresh.modifyMenu(name, price, ex, cal, mSeq, sSeq);
//			}
//
//			if(uploadFileName!=null) {
//				file.transferTo(f);
//			}
//		} catch (IllegalStateException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		} 
//		return "redirect:/m_up";
//	}
	
	
	
	@RequestMapping(value="/menu", method=RequestMethod.POST)
	public String doMenu(HttpServletRequest req, @RequestParam("file") MultipartFile file) {
		String name=req.getParameter("menuname");
		int price=Integer.parseInt(req.getParameter("menuprice"));
		String ex=req.getParameter("menuex");
		String cal=req.getParameter("menukcal");
		int mSeq=Integer.parseInt(req.getParameter("mSeq"));
		String sSeq=req.getParameter("sSeq");
		
		//String upLoadDirectory= "C:\\Users\\admin\\git\\first-project\\team_a\\src\\main\\webapp\\resources\\upload";
		System.out.println("file="+file+"menuname="+name);
		  
		String uploadFileName = file.getOriginalFilename();
		uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
		UUID uuid=UUID.randomUUID();
		uploadFileName=uuid.toString() + "_" + uploadFileName;
		File f= new File(upLoadDirectory,uploadFileName);
		try {
			if(mSeq==0) {
				ims.insertmenu(sSeq, name, price, ex, uploadFileName, cal);
			}else if(mSeq!=0){
				ims.modifyMenu(name, price, ex, cal, mSeq, sSeq);
			}

			if(uploadFileName!=null) {
				file.transferTo(f);
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} 
		return "redirect:/m_up";
	}
	
	
	
		
	@RequestMapping(value="/img_mo")
	public String doImgUpdate(HttpServletRequest req, MultipartHttpServletRequest mreq) {
		int mSeq=Integer.parseInt(req.getParameter("mSeq2"));
		String sSeq=req.getParameter("sSeq2");
		MultipartFile file=mreq.getFile("file2");
			
		//String upLoadDirectory= "C:\\Users\\admin\\git\\first-project\\team_a\\src\\main\\webapp\\resources\\upload";
		System.out.println("file="+file+"//mSeq="+mSeq+"/sSeq="+sSeq);
			  
		String uploadFileName2 = file.getOriginalFilename();
		uploadFileName2 = uploadFileName2.substring(uploadFileName2.lastIndexOf("/")+1);
		UUID uuid=UUID.randomUUID();
		uploadFileName2=uuid.toString() + "_" + uploadFileName2;
		File f= new File(upLoadDirectory,uploadFileName2);
		try {
			ims.modifyimage(uploadFileName2, mSeq, sSeq);
			file.transferTo(f);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} 
		return "redirect:/m_up";
	}
		
//	@RequestMapping("/test")
//	public String doTest() {
//		return "upload2";
//	}
		
//		@RequestMapping(value="/img", method=RequestMethod.POST)
//		public String doImg() {
//			return "upload";
//		}
		
	@ResponseBody
	@RequestMapping(value="/mls", method=RequestMethod.POST,produces="application/json;charset=UTF-8")
	public String doMls(@RequestParam("sSeq") String sSe, Model model) {
		ArrayList<StoreDTO> armenu=ims.selectMenulit(sSe);
		System.out.println("menu_list.size=["+armenu.size()+"]");
		
		JSONArray ja=new JSONArray();
		for(int i=0;i<armenu.size();i++) {
			StoreDTO list=armenu.get(i);
			JSONObject jo=new JSONObject();
			jo.put("mSeq", list.getMenuSeqno());
			jo.put("sSeq", list.getSSe());
			jo.put("m_img", list.getMenuImg());
			jo.put("mName", list.getMenuName());
			jo.put("m_price", list.getMenuPrice());
			jo.put("m_cal", list.getMenuCal());
			jo.put("m_ex", list.getMenuEx());
			ja.add(jo);
		}
		System.out.println("ja.s_list()="+ja.toJSONString());
		return ja.toJSONString();
	}
		
		
	@ResponseBody
	@RequestMapping(value="/update", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	public String doMenuUpdate(HttpServletRequest req, Model model) {
		int mSeq=Integer.parseInt(req.getParameter("mSeq"));
		String sSeq=req.getParameter("sSeq");
		StoreDTO mvo=ims.updateMenuList(mSeq, sSeq);
			
		JSONArray ja=new JSONArray();
		JSONObject jo=new JSONObject();
		jo.put("m_img", mvo.getMenuImg());
		jo.put("mName", mvo.getMenuName());
		jo.put("m_price", mvo.getMenuPrice());
		jo.put("m_cal", mvo.getMenuCal());
		jo.put("m_ex", mvo.getMenuEx());
		ja.add(jo);

		System.out.println("ja.s_mvo()="+ja.toJSONString());
		return ja.toJSONString();
	}
		
	@RequestMapping(value="/del")
	public String doMenuDelete(@RequestParam("mSeq") int mSeq, @RequestParam("sSeq") String sSeq) {
		ims.deleteMenu(mSeq, sSeq);
		System.out.println("delete_mseq="+mSeq+", sseq="+sSeq);
		return "redirect:/m_up";
	}
	
	@RequestMapping("/delFile")
	public ResponseEntity<String> delFile(@RequestParam("filename") String filename) {
		log.info("deletFile="+filename);
		//File file =null;
		File f= new File(upLoadDirectory,filename);
		try {
			//file = new File(upLoadDirectory+URLDecoder.decode(filename,"UTF-8"));
			f.delete();
		}catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("fail",HttpStatus.NOT_IMPLEMENTED);// TODO: handle exception
		}
		return new ResponseEntity<String>("success",HttpStatus.OK);
	}
		
}
