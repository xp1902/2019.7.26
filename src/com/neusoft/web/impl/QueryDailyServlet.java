package com.neusoft.web.impl;

public class QueryDailyServlet extends DailyControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "queryDaily";
	}
}