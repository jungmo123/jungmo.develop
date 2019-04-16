package jungmo.shoppingmall.admininterceptor;

import javax.servlet.http.*;

import org.springframework.web.servlet.handler.*;

public class AdminInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response,
			Object handler) throws Exception{
			HttpSession session = request.getSession();
			String admin = (String)session.getAttribute("admin");
			
			if(!request.getRequestURI().equals("/shoppingmall/adminlogin")){
				if(admin != null){

				}else{
					response.sendRedirect("/shoppingmall/adminlogin");
					return false;					
				}
			}			
			return true;
			
	}
}