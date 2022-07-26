package com.team.delivery.mappers;

import java.util.ArrayList;

import com.team.delivery.DTO.boardDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface iBoard {
	ArrayList<boardDTO> selBrd(int page1,int page2);
	boardDTO showBrd(int seq);
	void addBD(String title,String content ,String writer);
	void viewUp(int seq);
	void delBD(int seq);
	void updateBD(String title,String content,int seq);
	int selPage();
}
