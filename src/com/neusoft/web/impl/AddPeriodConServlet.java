package com.neusoft.web.impl;

public class AddPeriodConServlet extends PeriodConControllerSupport
{
	@Override
	public String execute() throws Exception
	{
		this.update("addPeriodCon", "���");
		return "findByIdPeriodCon";
	}
}