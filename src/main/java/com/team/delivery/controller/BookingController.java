package com.team.delivery.controller;

import com.team.delivery.DTO.StoreDTO;
import com.team.delivery.DTO.bookingDTO;
import com.team.delivery.mappers.iBooking;
import com.team.delivery.mappers.iMenuStore;
import com.team.delivery.mappers.iStore;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.catalina.Store;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Controller
@Slf4j
@RequiredArgsConstructor
public class BookingController {

    private final iBooking ibo;
    private final iMenuStore ims;
    private final iStore store;


    /*@RequestMapping("booking/bookinglist")
    public String bookinglist(@RequestParam("sSeqno") int sSeqno, Model model, HttpServletRequest req) {
//		HttpSession session = req.getSession();
//      String id="master";
//        StoreDTO sVO = ims.selStore(id);

//        model.addAttribute("sVO", sVO);
        ArrayList<bookingDTO> bookinglist = ibo.bookinglist(sSeqno);
        model.addAttribute("list", bookinglist);

        return "booking/bookinglist";
    }*/

    @GetMapping("/hall")
    public String hall(@RequestParam("type") int type, HttpServletRequest request, Model model) {

        HttpSession session=request.getSession();

        model.addAttribute("userinfo",session.getAttribute("userid"));
        model.addAttribute("userType",session.getAttribute("userType"));

        ArrayList<StoreDTO> storelist = store.liststore(type);
        model.addAttribute("list", storelist);

        return "booking/hall";
    }

    /*홀예약저장*/
   @RequestMapping(value="/hallbookingadd", method = RequestMethod.POST)
   @ResponseBody
    public String hallbookingadd(@RequestParam("sSeqno") int sSeqno,
                                 @RequestParam("hDate") String hDate,
                                 @RequestParam("hTime") String hTime,
                                 @RequestParam("hPeople") int hPeople,
                                 @RequestParam("hOnepeople") String hOnepeople,
                                 @RequestParam("hMobile") String hMobile,
                                 @RequestParam("hRequest") String hRequest,
                                 @RequestParam("mId") String mId
                                 ){
        ibo.bookingadd(sSeqno,hDate,hTime,hPeople,hOnepeople,hMobile,hRequest,mId);
        int hseqno = ibo.hseqno();
        log.info("예약번호={}",hseqno);
        return Integer.toString(hseqno);
    }

    /*홀예약jsp*/
    @RequestMapping(value = "/hallbooking")
    public String hallbooking(@RequestParam("sSeqno") int sSeqno, Model model, HttpServletRequest request){

        HttpSession session=request.getSession();

        model.addAttribute("userinfo",session.getAttribute("userid"));
        model.addAttribute("userType",session.getAttribute("userType"));
        model.addAttribute("mName",session.getAttribute("mName"));
        model.addAttribute("mMobile",session.getAttribute("mMobile"));

        StoreDTO bookinglist = store.storeName(sSeqno);
        model.addAttribute("list", bookinglist);


        return "booking/hallbooking";
    }

    @RequestMapping("/bookingend")
    public String bookingend(@RequestParam int hseqno, Model model) {

        bookingDTO bookingend= ibo.bookingend(hseqno);
        model.addAttribute("blist",bookingend);

        return "booking/bookingend";
    }
    /*@RequestMapping("/bookinglist")
    public  String bookinglist(Model model){
        ArrayList<bookingDTO>bookinglist = ibo.bookinglist();
        model.addAttribute("blist",bookinglist);

        return "booking/bookinglist";
    }*/

}
