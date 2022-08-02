package com.team.delivery.mappers;

import com.team.delivery.DTO.cartDTO;
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
}
