package com.team.delivery.mappers;

import java.util.ArrayList;

import com.team.delivery.DTO.mDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface iMember {
	
	int idOverlap(String mId);
	void addMember(String mId,
			String mPwd,
			String mName,
			String mobile,
			int mType,
			String mPostcode,
			String mAddress,
			String mDetailAddress,
			String mExtraAddress,
			String mEmail);
	void addDelivery(String mId,
			String mAddress,
			String mPostcode,
			String mDetailAddress,
			String mExtraAddress,
			String dName,
			String dMobile);
	
	int checkId(String mId,
			String mPwd);
	mDTO profile(String mId,
			String mPwd);
	ArrayList<mDTO> findId(String mEmail);
	int findIdCheck(String mEmail);
	int findPwd(String mPwd,
				String mEmail,
				String mId);
	int findPwdCheck(String mEmail, String mId);
	
	mDTO userList(String mId);
	int cntAddress(String mId);
	void updatePwd(String mPwd,
			String mId);
	void updateLogin(String mName,
			String mMobile,
			String mEmail,
			String mId);
	
	void delInformation(String mId);
	void delDelivery(String mId);
	
	ArrayList<mDTO> deliveryList(String mId);
	void upDelivery(String mPostcode,
			String mAddress,
			String mDetailAddress,
			String mExtraAddress,
			String mId);
	mDTO seList(int dSeqno);
	void upDeliveryList(String mPostcode,
			String mAddress,
			String mDetailAddress,
			String mExtraAddress,
			String dName,
			String d_moblie,
			int dSeqno);
	void delSe(int dSeqno);
}
