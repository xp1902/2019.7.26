package com.neusoft.web.impl;

public class JiashuHomeServlet extends RuyuanControllerSupport {

	@Override
	public String execute() throws Exception 
	{
		System.out.println("jiashuhomeServlet");
		this.savePageInstance();
		System.out.println("jiashuhomeServlet");
		return "JiaShu";
	}

}
