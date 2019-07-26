package com.neusoft.web.impl;

public class FindByIdPeriodConServlet extends PeriodConControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "findByIdPeriodCon";
	}
}
