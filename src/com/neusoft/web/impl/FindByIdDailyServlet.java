package com.neusoft.web.impl;

public class FindByIdDailyServlet extends DailyControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "findByIdDaily";
	}
}