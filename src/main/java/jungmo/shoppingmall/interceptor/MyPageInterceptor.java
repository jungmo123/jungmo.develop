package jungmo.shoppingmall.interceptor;

import javax.servlet.http.*;

import org.springframework.web.servlet.handler.*;

public class MyPageInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response,
			Object handler) throws Exception{
			HttpSession session = request.getSession();
			String user = (String)session.getAttribute("user");
			if(user != null){

			}else{
				response.sendRedirect("/shoppingmall/login");
				return false;					
			}		
			return true;
			
	}
}
