package com.team.delivery.mappers;

import java.util.ArrayList;

import com.team.delivery.DTO.boardDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface iBoard {
	boardDTO showBrd(int seq);
	void addBD(String title,String content ,String writer,int type);
	void viewUp(int seq);
	void delBD(int seq);
	void updateBD(String title,String content,int seq);
	int selPage();
	int searchBDTitle(String title);
	ArrayList<boardDTO> selBDTitle(String title,int page1, int page2);
	ArrayList<boardDTO> selBDTitle2(String title,int page1, int page2);
	ArrayList<boardDTO> selBDTitleView(String title,int page1, int page2);
	ArrayList<boardDTO> selBDTitleView2(String title,int page1, int page2);
	ArrayList<boardDTO> PNBD(int seq);
	ArrayList<boardDTO> PNBD2(int seq);
	ArrayList<boardDTO> selQnABrd(int page1,int page2);
	ArrayList<boardDTO> selQnABrd_views(int page1,int page2);
	ArrayList<boardDTO> selQnATitle(String title,int page1, int page2);
	ArrayList<boardDTO> selQnATitleView(String title,int page1, int page2);
	int selQnAPage();
	int searchQnATitle(String title);
	ArrayList<boardDTO> smallQnA(int page1,int page2);
}
