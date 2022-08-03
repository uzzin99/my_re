package com.team.delivery.DTO;

import lombok.Data;

@Data
public class reviewDTO {
//    리뷰테이블
    private int rSeqno;
    private int oSe;
    private String mId;
    private String rContent;
    private String rDate;
    private int score;
    private int sSe;

//    그외
    private String sName;
    private String menuImg;
}
