package com.team.delivery.mappers;

import java.util.ArrayList;

import com.team.delivery.DTO.commentDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface iComments {
	void addCmt(int seq,String content,String writer);
	ArrayList<commentDTO> selCmt(int seq);
	void delCmt(int seq);
	void delCmtinBD(int seq);
	void addRep(int pSe,int bSe,String content,String writer,int deep);
	ArrayList<commentDTO> selRep(int seq);
	void upCmt(String comment, int seq);
	int cntCmt(int seq);
	int selcntseq(int seq);
	int selseq(int seq);
}
