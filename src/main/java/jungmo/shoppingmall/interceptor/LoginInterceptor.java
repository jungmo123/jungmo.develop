package jungmo.shoppingmall.interceptor;

import javax.servlet.http.*;

import org.springframework.web.servlet.handler.*;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response,
			Object handler) throws Exception{
			HttpSession session = request.getSession();
			String user = (String)session.getAttribute("user");
			
			if(request.getRequestURI().equals("/shoppingmall/login")){
				if(user != null){
					response.sendRedirect("/shoppingmall/");
					return false;
				}				
			}			
			return true;
	}
}