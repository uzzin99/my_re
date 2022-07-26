package com.team.delivery;


import com.team.delivery.DTO.StoreDTO;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.delivery.mappers.iMenuStore;

@Controller
public class TestController {

	private String upLoadDirectory="C:\\Users\\admin\\Downloads\\delivery\\delivery\\src\\main\\resources\\static\\upload";

	@Autowired
	private SqlSession sqlSession;
	
//	@RequestMapping(value = "/test", method = RequestMethod.GET)
//	public String home() {
//		return "test";
//	}
	
//	@RequestMapping("/doit")
//	public String doit(@RequestParam("file") MultipartFile file,
//			@RequestParam("aaa") int aaa) {
//		iCart te=sqlSession.getMapper(iCart.class);
//
//		String uploadFileName = file.getOriginalFilename();
//		uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
//
//		UUID uuid=UUID.randomUUID();
//		uploadFileName=uuid.toString() + "_" + uploadFileName;
//		File f= new File(upLoadDirectory,uploadFileName);
//		try {
//			te.insert(uploadFileName, aaa);
//			System.out.println(aaa);
//			file.transferTo(f);
//		} catch (IllegalStateException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return "redirect:/upload";
//	}

	
	@RequestMapping("/test")
	public String test(Model model) {
		iMenuStore ifresh=sqlSession.getMapper(iMenuStore.class);
		StoreDTO mvo=ifresh.updateMenuList(127, "2");
		model.addAttribute("m",mvo);
		return "test";
	}
	
	
}
