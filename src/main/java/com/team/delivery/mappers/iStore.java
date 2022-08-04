package com.team.delivery.mappers;
import java.util.ArrayList;

import com.team.delivery.DTO.StoreDTO;
import com.team.delivery.DTO.reviewDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface iStore {
	StoreDTO storeName(int sSeqno);
	double storeAvg(int sSeqno);
	int reviewCnt(int sSeqno);
	ArrayList<StoreDTO> liststore(int sType);
	ArrayList<StoreDTO> menutable(int sSeqno);
	ArrayList<StoreDTO> searchtable(String word);
	ArrayList<reviewDTO> reviewlist(int sSeqno);
	StoreDTO listMenuDetail(int menuSeqno,
							int sSe);
	int reviewAdd(reviewDTO review) throws Exception;
	ArrayList<reviewDTO> myReviewList(String mId);
	int reviewDel(int rSeqno);

	void zzimcheck(String mid, int sSe);
	void zzimdelete(String mid, int sSe);
	int zzimStorecount(String mid, int sSe);

}
