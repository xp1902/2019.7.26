package com.neusoft.web.impl;

public class QueryOlderDailyServlet extends DailyControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageDataForElder();
		return "queryOlderDaily";
	}
}