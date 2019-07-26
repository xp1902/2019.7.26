package com.neusoft.web.impl;

public class ModifyPeriodConServlet extends PeriodConControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.update("modifyPeriodCon", "ÐÞ¸Ä");
		return "findByIdPeriodCon";
	}

}
