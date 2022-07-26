package com.team.delivery.DTO;

import lombok.Data;

@Data
public class cartDTO {
	//cart
	private int cartSeqno;
	private String mId;
	private int sSe;
	private int mSe;
	private int menuCnt;
	
	//menu
	private String menuName;
	private int menuPrice;
	private int menuCal;
	
	private int saleprice;
	private int totalprice;
	
	public cartDTO() {
	}

	
}

