package com.team.delivery.mappers;

import com.team.delivery.DTO.cartDTO;
import com.team.delivery.DTO.oDetailDTO;
import com.team.delivery.DTO.orderDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface iCart {

	int addCart(cartDTO cart) throws Exception;

	int delCart(int cartSeqno);

	int modifyCount(cartDTO cart);

	ArrayList<cartDTO> listCart(String mId);

	cartDTO checkCart(cartDTO cart);

	int checkStore(cartDTO cart);
	String selStoreAddr(int sSe);
	String selMemberAddr(String mId);
	void addOrder(String mid,int sSe, long price, String Ocode, String Odate,String Oname);
	void addDetail(String m_id);
	void clrCart(String m_id);
	int getCurrSeq();
	void addDetailTip(int seq);
	ArrayList<orderDTO> selOrder(String m_id);
	ArrayList<oDetailDTO> selDetail();
	void reviewDone(int sSe);
}
