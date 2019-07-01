package jungmo.shoppingmall.user.search.controller;

import javax.servlet.http.*;

import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class SearchController {
	@RequestMapping(value="unifiedSearch={Search}",method=RequestMethod.POST)
	public String unifiedSearch(@PathVariable String Search,HttpServletRequest request,Model model){
		System.out.println(Search);
		System.out.println();
		System.out.println();
		System.out.println();
		System.out.println();
		System.out.println();
		return "user/search/unifiedSearch";
	}
}
