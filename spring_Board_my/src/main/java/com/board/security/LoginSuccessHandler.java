package com.board.security;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import com.board.dto.MemberVO;
import com.board.service.MemberService;

public class LoginSuccessHandler
					extends SavedRequestAwareAuthenticationSuccessHandler{
	
	
	private RequestCache requestCache = 
					new HttpSessionRequestCache();

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, 
										HttpServletResponse response,
										Authentication authentication) throws ServletException, IOException {
		
		SavedRequest savedRequest = 
						requestCache.getRequest(request, response);
		
		String targetUrl =null;
		if(savedRequest!=null){
			savedRequest.getRedirectUrl();
		}
		
		HttpSession session = request.getSession();
		String successID=authentication.getName();
		
		ApplicationContext ctx=
				new GenericXmlApplicationContext("classpath:context/root-context.xml");
		
		MemberService service=(MemberService)ctx.getBean("memberService");
		
		try {
			MemberVO member=service.getMember(successID);
			session.setAttribute("loginUser", member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String accept=request.getHeader("accept");
		
		
		String retUrl=null;
		if(targetUrl==null || targetUrl.isEmpty()){
			retUrl=request.getContextPath()+getDefaultTargetUrl();
		}else{
			retUrl=targetUrl.substring(
					targetUrl.indexOf(request.getContextPath()));
		}		
		
		if(accept.indexOf("html")>-1){ //html submit						
			super.onAuthenticationSuccess(request, response, authentication);
		}else if(accept.indexOf("json")>-1){ // ajax param
			response.setContentType("application/json;charset=utf-8");
			String data="{\"message\":\"로그인하였습니다.\","
						+ "\"retUrl\":\""+retUrl+"\","
						+ "\"error\":false"								
						+ "}";
			
			PrintWriter out=response.getWriter();
			out.println(data);
			out.flush();
			out.close();
		}
		
		
		
	}	

	
			
}







