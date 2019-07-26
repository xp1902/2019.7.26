package com.neusoft.web.impl;

public class QueryLeaveServlet extends LeaveControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.savePageData();
		return "queryLeave";
	}
}