package jungmo.shoppingmall.interceptor;

import javax.servlet.http.*;

import org.springframework.web.servlet.handler.*;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response,
			Object handler) throws Exception{
			
			HttpSession session = request.getSession();

			return true;
	}
}