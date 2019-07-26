package com.neusoft.web.impl;

public class QueryOlderPeriodConServlet extends PeriodConControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.savePageDataForElder();
		return "queryOlderPeriodCon";
	}
}