package com.team.delivery.DTO;

import lombok.Data;

@Data
public class commentDTO {
	private int cSeqno;
	private int pSe;
	private int bSe;
	private String content;
	private String writer;
	private int deep;
	private int groupno;
	private String cDate;
	
	public commentDTO() {
	}

}
