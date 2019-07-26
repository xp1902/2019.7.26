package com.neusoft.web.impl;

public final class QueryLaorenServlet extends ElderControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "queryLaoren";
	}
}