package com.team.delivery.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import java.io.PrintWriter;

@Slf4j
@Component
public class CustomInterceptor implements HandlerInterceptor {

	private void saveDestination(HttpServletRequest request){
		String uri=request.getRequestURI();
		String query=request.getQueryString();

		if(query == null || query.equals("null")){
			query="";
		}else {
			query="?"+query;
		}

		if(request.getMethod().equals("GET")){
			log.info("getDestination={}",(uri+query));
			request.getSession().setAttribute("destination",uri+query);
		} else if (request.getMethod().equals("POST")) {
			log.info("postDestination={}",(uri+query));
			request.getSession().setAttribute("destination",uri+query);
		}
	}
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("preHandle1");
        System.out.println("[preHandle][" + request + "]" + "[" + request.getMethod() + "]" + request.getRequestURI());
        System.out.println("[handler][" + handler.toString() + "]");
        
        HttpSession session=request.getSession();
        
        String mvo =(String)session.getAttribute("userid");
        System.out.println(mvo);
        
        if(mvo == null) {
			saveDestination(request);
        	response.sendRedirect("/errorLogin");
        	return false;
        }
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("postHandle1");
        System.out.println("[ModelAndView][ model 이름: " + modelAndView.getViewName() + "][ model 내용 :" + modelAndView.getModel() + "]" );

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		System.out.println("afterCompletion");

	}

}
