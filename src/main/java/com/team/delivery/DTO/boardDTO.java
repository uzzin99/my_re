package com.team.delivery.DTO;

import lombok.Data;

@Data
public class boardDTO {
		private int bSeqno;
		private String title;
		private String content;
		private String writer;
		private String bDate;
		private int views;
		private int btype;
		
		public boardDTO() {
		}

	}

