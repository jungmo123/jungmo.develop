package jungmo.shoppingmall.interceptor;

import javax.servlet.http.*;

import org.springframework.web.servlet.handler.*;

public class AdminInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response,
			Object handler) throws Exception{
			HttpSession session = request.getSession();
			String admin = (String)session.getAttribute("admin");
			
			if(!request.getRequestURI().equals("/shoppingmall/admin/login")){
				if(admin != null){

				}else{
					response.sendRedirect("/shoppingmall/admin/login");
					return false;					
				}
			}			
			return true;
			
	}
}