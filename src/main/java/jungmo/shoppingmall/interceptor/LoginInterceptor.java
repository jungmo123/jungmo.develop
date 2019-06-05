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
			List<GoodsCategories> gc = gcService.getCategories();
			request.setAttribute("goodsCategories", gc);
			if(request.getRequestURI().equals("/shoppingmall/login")){
				if(user != null){
					response.sendRedirect("/shoppingmall/");
					return false;
				}				
			}			
			return true;
	}
}