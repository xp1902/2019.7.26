package com.neusoft.web.impl;

public class ModifyDailyServlet extends DailyControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.update("modify", "´ò¿¨");
		this.savePageDataForToday();
		return "queryAllTDaily";
	}
}