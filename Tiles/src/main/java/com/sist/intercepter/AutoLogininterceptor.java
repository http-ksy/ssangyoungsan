package com.sist.intercepter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
/*
 *  .do ============ DispatcherSevrvlet ===============> HandlerMapping 
 *  										 |			  @GetMapping("main/main.do")
 *							  			
 *  									preHandler		
 */
//<bean이용>
public class AutoLogininterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		System.out.println("preHandle Call..");
		Cookie[] cookies=request.getCookies();
		if(cookies!=null)
		{
			for(int i=0;i<cookies.length;i++)
			{
				String key=cookies[i].getName();
				if(key.equals("id"))
				{
					String id=cookies[i].getValue();
					request.setAttribute("id", id);
					break;
				}
			}
		}
		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("postHandle Call..");
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		System.out.println("afterCompletion Call..");
		super.afterCompletion(request, response, handler, ex);
	}
}
