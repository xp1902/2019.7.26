package com.neusoft.web.impl;

public class ModifyEDailyServlet extends DailyControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.update("modifyById", "�޸�");
		return "findByIdDaily";
	}
}