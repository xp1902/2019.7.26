package com.neusoft.web.impl;

import java.util.HashMap;
import java.util.Map;

public class UserLoginServlet extends UserControllerSupport
{
	public String execute()throws Exception
	{
		this.savePageInstance();
		System.out.println("userservlet");
		if(this.getAttribute().get("userType").equals("1"))
		{
			return "queryVisit";	
		}
		else if(this.getAttribute().get("userType").equals("2"))
		{
			return "hugong";	
		}
		else if(this.getAttribute().get("userType").equals("3"))
		{
			return "JiaShu";	
		}
		else if(this.getAttribute().get("userType").equals("4"))
		{
			return "vol";	
		}
		return null;
	}

}
