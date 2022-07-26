package com.team.delivery.mappers;

import java.util.ArrayList;

import com.team.delivery.DTO.StoreDTO;
import com.team.delivery.DTO.stypeVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface iMenuStore {

	ArrayList<stypeVO> sType();
	
	void insertStore(String mId, String sName, String post, String sAddress, String s_detailaddress,
					String sExtraaddress, String s_bsNum, String sMobile,int sType, String sImg);
	
	void insertmenu(String sSeq, String name, int price, String ex, String img, String cal);
	
	ArrayList<StoreDTO> selectMenulit(String sSe);
	
	StoreDTO updateMenuList(int mSeq, String sSeq);
	void modifyMenu(String name, int price, String ex, String cal, int mSeq, String sSeq);
	void modifyimage(String img, int mSeq, String sSeq);
	
	void deleteMenu(int mSeq, String sSeq);

	int cntStore(String mId);
				
	StoreDTO selStore(String mId);
}
