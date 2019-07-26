package com.neusoft.web.impl;

public class QueryEPeriodConServlet extends PeriodConControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.savePageDataForElder();
		return "queryEPeriodCon";
	}
}