package com.team.delivery.controller;

import com.team.delivery.DTO.StoreDTO;
import com.team.delivery.DTO.orderDTO;
import com.team.delivery.mappers.iOrder;
import com.team.delivery.mappers.iStore;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Controller
@Slf4j
@RequiredArgsConstructor
public class OrderController {

    private final iOrder iod;
    private final iStore store;

    @RequestMapping("booking/orderlist")
    public String doOrderlist(@RequestParam("sSeqno") int sSeqno,
                              HttpServletRequest request, Model model) {
        HttpSession session=request.getSession();
        model.addAttribute("userinfo",session.getAttribute("userid"));
        model.addAttribute("userType",session.getAttribute("userType"));
        System.out.println("오더리스트 SSe="+sSeqno);

        StoreDTO storeName = store.storeName(sSeqno);
        model.addAttribute("storename",storeName);

        ArrayList<orderDTO> obefore = iod.orderbefore(sSeqno);
        model.addAttribute("obefore",obefore);

        ArrayList<orderDTO> oafter = iod.orderafter(sSeqno);
        model.addAttribute("oafter",oafter);



        return "booking/orderlist";
    }

    @RequestMapping("/orderget")
    public String doOrderget(@RequestParam("oseq") int oseq){
        int data= iod.orderget(1, oseq);
        return Integer.toString(data);
    }

    @RequestMapping("/ordercancle")
    public String doOrdercancle(@RequestParam("oseq") int oseq){
        int data=iod.orderget(4, oseq);
        return "redirect:/booking/orderlist";
    }

}
