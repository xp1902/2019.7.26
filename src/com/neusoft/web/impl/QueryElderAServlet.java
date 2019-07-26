package com.neusoft.web.impl;

public final class QueryElderAServlet extends ElderControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "queryElderA";
	}
}