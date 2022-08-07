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
import org.springframework.web.bind.annotation.ResponseBody;

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

        ArrayList<orderDTO> orderlist = iod.orderlist(sSeqno);
        model.addAttribute("olist",orderlist);

        return "booking/orderlist";
    }
    @ResponseBody
    @RequestMapping("/orderget")
    public String doOrderget(@RequestParam("oseq") int oseq){
        iod.orderget_cancle(1,oseq);
        return "redirect:/booking/orderlist";
    }

    @ResponseBody
    @RequestMapping("/ordercancle")
    public String doOrdercancle(@RequestParam("oseq") int oseq){
        iod.orderget_cancle(4, oseq);
        return "redirect:/booking/orderlist";
    }

    @ResponseBody
    @RequestMapping("/o_cancle")
    public String doOcancle(@RequestParam("oseq") int oseq){
//        iod.orderdelete(oseq);
        System.out.println("oderseq="+oseq);
        iod.orderget_cancle(5, oseq);
        return "redirect:/member/paymentDetails";


    }

}
