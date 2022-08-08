package com.team.delivery.controller;

import com.team.delivery.DTO.StoreDTO;
import com.team.delivery.DTO.bookingDTO;
import com.team.delivery.DTO.mDTO;
import com.team.delivery.DTO.reviewDTO;
import com.team.delivery.mappers.iBooking;
import com.team.delivery.mappers.iMember;
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
    private final iStore store;
    private final iMember ime;

    @RequestMapping("/hallcheckdel")
    @ResponseBody
    public String hallcheckdel(@RequestParam("cenclebo") int cenclebo ){
        int bo = ibo.hallcheck(cenclebo,5);
        return Integer.toString(bo);
    }

    @RequestMapping("/bookingcheck")
    @ResponseBody
    public String bookingcheck(@RequestParam("upbo") int upbo){
        //log.info("시퀸스={}",upbo);
        int Bup = ibo.hallcheck(upbo,1);
        //log.info("홀시퀀스={}",Bup);
        return Integer.toString(Bup);
    }

    @RequestMapping("/delbooking")
    @ResponseBody
    public String delbooking(@RequestParam("delbo") int delbo, @RequestParam("hcheck") int hcheck) {
        log.info("check={}",hcheck);
        if (hcheck==0){
            int hdel = ibo.delbooking(delbo);
            return Integer.toString(hdel);
        } else {
            int hdel = ibo.hallcheck(delbo,4);
            return Integer.toString(hdel);
        }
    }

    @RequestMapping("booking/bookinglist")
    public String bookinglist(@RequestParam("sSeqno") int sSeqno,
                              HttpServletRequest request, Model model) {

        HttpSession session=request.getSession();

		model.addAttribute("userType",session.getAttribute("userType"));
        model.addAttribute("mname",session.getAttribute("mName"));

        ArrayList<bookingDTO> bookinglist = ibo.bookinglist(sSeqno);
        model.addAttribute("list", bookinglist);
        //log.info("check={}",bookinglist.get(0).getHCheck());

        StoreDTO storeName = store.storeName(sSeqno);
        model.addAttribute("storename",storeName);

        return "booking/bookinglist";
    }

    @GetMapping("/hall")
    public String hall(@RequestParam("type") int type, HttpServletRequest request, Model model) {

        HttpSession session=request.getSession();

        model.addAttribute("userType",session.getAttribute("userType"));
        model.addAttribute("mname",session.getAttribute("mName"));

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

        int cnt = store.reviewCnt(sSeqno);
        if(cnt > 0) {
            double avg=store.storeAvg(sSeqno);
            avg = Math.round(avg * 100) / 100.0;
            model.addAttribute("avg", avg);
            log.info("가게평균={}", avg);
            model.addAttribute("cnt", cnt);
        }else{
            log.info("공백넘어감");
            model.addAttribute("cnt","");
        }

        StoreDTO storeName = store.storeName(sSeqno);
        mDTO member =ime.userList(storeName.getMId());
        model.addAttribute("storename", storeName);
        model.addAttribute("member", member);
        ArrayList<reviewDTO> reviewlist = store.reviewlist(sSeqno);
        model.addAttribute("rlist", reviewlist);

        //찜 여부 확인
        if(session.getAttribute("userid")!=null){
            int count=store.zzimStorecount((String) session.getAttribute("userid"),sSeqno);
            model.addAttribute("count",count);
        }
        //가게당 찜 카운트
        int zcnt=store.zzimcount(sSeqno);
        model.addAttribute("zcnt",zcnt);

        return "booking/hallbooking";
    }

    @RequestMapping("/bookingend")
    public String bookingend(@RequestParam int hseqno,HttpServletRequest request, Model model) {

        HttpSession session= request.getSession();

        model.addAttribute("userType",session.getAttribute("userType"));
        model.addAttribute("mname",session.getAttribute("mName"));

        bookingDTO bookingend= ibo.bookingend(hseqno);
        model.addAttribute("blist",bookingend);

        return "booking/bookingend";
    }

}
