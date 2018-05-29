package com.board.security;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

public class LoginFailureHandler extends SimpleUrlAuthenticationFailureHandler{

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, 
										HttpServletResponse response,
										AuthenticationException exception) throws IOException, ServletException {
		
		String accept=request.getHeader("accept");
		
		if(accept.indexOf("html")>-1){ // html submit
			super.onAuthenticationFailure(request, response, exception);			
		}else if(accept.indexOf("json")>-1){ // ajax
			response.setContentType("application/json;charset=utf-8");
			String data ="{"
					+ "\"message\":\"로그인 실패\","
					+ "\"returl\":\"\","
					+ "\"error\":true"					
					+ "}";
			
			PrintWriter out=response.getWriter();
			out.println(data);
			out.flush();
			out.close();
		}
		
		
		
	}

	
}




