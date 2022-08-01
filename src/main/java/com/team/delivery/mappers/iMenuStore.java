package com.team.delivery.mappers;

import java.util.ArrayList;

import com.team.delivery.DTO.StoreDTO;
import com.team.delivery.DTO.stypeVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface iMenuStore {

	ArrayList<stypeVO> sType();
	
	void insertStore(String mId, String sName, String post, String sAddress, String sdetailaddress,
					String sExtraaddress, String s_bsNum, String sMobile,int sType, String sImg);

	void modifyStore1(String m_id, String s_name, String post, String storeAds, String detailAds, String extraAds,
					  String s_num, String s_mobile, int s_type, String s_logo);
	void modifyStore2(String m_id, String s_name,  String post, String storeAds, String detailAds, String extraAds,
					  String s_num,  String s_mobile, int s_type);

	void insertMenu(int sSeq, String name, int price, String ex, String img, String cal);
	
	ArrayList<StoreDTO> selectMenuList(int sSeq);
	
	StoreDTO updateMenuList(int mSeq, int sSeq);
	void modifyMenu(String name, int price, String ex, String cal, int mSeq, int sSeq);
	void modifyImage(String img, int mSeq, int sSeq);
	
	void deleteMenu(int mSeq, int sSeq);

	int cntStore(String mId);
				
	StoreDTO selStore(String mId);

	void updateLogo(String img, int sSe);
}
