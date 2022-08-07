package com.team.delivery.mappers;

import com.team.delivery.DTO.orderDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface iOrder {

    void orderget_cancle(int status, int upor);
    ArrayList<orderDTO> orderlist(int sse);
//    void orderdelete(int oseq);


}
