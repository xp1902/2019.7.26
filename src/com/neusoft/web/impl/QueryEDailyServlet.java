package com.neusoft.web.impl;

public class QueryEDailyServlet extends DailyControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageDataForElder();
		return "queryEDaily";
	}
}