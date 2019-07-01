package jungmo.shoppingmall.interceptor;

import java.util.*;

import javax.servlet.http.*;

import jungmo.shoppingmall.admin.boardadmin.domain.*;
import jungmo.shoppingmall.admin.boardadmin.service.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.web.servlet.handler.*;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	@Autowired private GoodsCategoriesService gcService;
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response,
			Object handler) throws Exception{
			HttpSession session = request.getSession();
			String user = (String)session.getAttribute("user");
			request.setAttribute("user", user);
			List<GoodsCategories> gc = gcService.getCategories();
			request.setAttribute("goodsCategories", gc);
			if(user == null){
				Cookie myCookie = new Cookie("identification", null);
				myCookie.setMaxAge(0);
				myCookie.setPath("/"); // 모든 경로에서 접근 가능 하도록 설정
				response.addCookie(myCookie);				
			}
			if(request.getRequestURI().equals("/shoppingmall/login")){
				if(user != null){
					response.sendRedirect("/shoppingmall/");
					return false;
				}
			}			
			return true;
	}
}