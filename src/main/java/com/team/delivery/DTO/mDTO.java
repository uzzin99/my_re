package com.team.delivery.DTO;

import lombok.Data;

@Data
public class mDTO {
	private String mId;
	private String mPwd;
	private String mName;
	private String mMobile;
	private int mType;
	private String tName;
	private String mPostcode;
	private String mAddress;
	private String mDetailAddress;
	private String mExtraAddress;
	private String mEmail;
	private String dName;
	private String dMobile;
	private String dSeqno;
	
	public mDTO() {
	}

}

