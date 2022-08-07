package com.team.delivery.mappers;

import com.team.delivery.DTO.orderDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface iOrder {

    int orderget(int status, int upor);
    int ordercancle(int status, int upor);
    ArrayList<orderDTO> orderbefore(int sse);
    ArrayList<orderDTO> orderafter(int sse);
    ArrayList<orderDTO> ordercancle(int sse);



}
