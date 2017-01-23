package org.won.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class CookieUtil {
	public String cookieUtil(HttpServletRequest request) {
		Cookie[] cook = request.getCookies();
		String username = null;
		for(int i =0; i<cook.length; i++){
			if(-1 != cook[i].getName().indexOf("username")){
				username = cook[i].getValue();
				break;
			}
			
		}
		return username;
	}//end String end
	
	public String cookieUtil(HttpServletRequest request, String key) {
		Cookie[] cook = request.getCookies();
		String username = null;
		for(int i =0; i<cook.length; i++){
			if(-1 != cook[i].getName().indexOf(key)){
				username = cook[i].getValue();
				break;
			}
			
		}
		return username;
	}//end String end
}
