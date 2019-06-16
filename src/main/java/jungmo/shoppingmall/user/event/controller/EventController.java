package jungmo.shoppingmall.user.event.controller;

import javax.servlet.http.*;

import jungmo.shoppingmall.admin.boardadmin.service.*;
import jungmo.shoppingmall.admin.order.domain.*;
import jungmo.shoppingmall.admin.order.service.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class EventController {
	@Autowired private PageService pageService;
	@Autowired private EventService eventService;
	private String Eindex;
	
	public void event(HttpServletRequest request,Model model,String idx){
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx));
		PageService ps = new PageServiceImpl(5,myPage,pageService.getEventTotRowCnt());
		model.addAttribute("pageMaker",ps);
		model.addAttribute("posts",eventService.getEvent(myPage));
		Eindex = idx;
	}
	
	@RequestMapping("/event")
	public String ev(){
		return "redirect:event1";
	}
	
	@RequestMapping("/event{idx}")
	public String event(@PathVariable String idx,Model model,HttpServletRequest request){
		event(request,model,idx);
		return "user/event/event";
	}
	
	@RequestMapping("/eventRead{idx}")
	public String eventRead(@PathVariable String idx,Model model,HttpServletRequest request){
		eventService.addEventViewCnt(Integer.valueOf(idx));
		model.addAttribute("event",eventService.getEventRead(Integer.valueOf(idx)));
		return "user/event/eventRead";
	}
	
	@RequestMapping("/EIDX")
	public String eventIdx(){
		return "redirect:event" + Eindex;
	}
}
