package com.neusoft.web.impl;

public class QueryPeriodConServlet extends PeriodConControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "queryPeriodCon";
	}
}
