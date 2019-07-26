package com.neusoft.web.impl;

public class FindByIdRuyuanServlet extends RuyuanControllerSupport {

	@Override
	public String execute() throws Exception 
	{
		System.out.println("RuyuanServlet");
		this.savePageInstance();
		System.out.println("RuyuanServlet");
		return "ruzhu";
	}

}
