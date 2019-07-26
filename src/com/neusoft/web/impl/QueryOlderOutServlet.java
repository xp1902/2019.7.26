package com.neusoft.web.impl;

public final class QueryOlderOutServlet extends OutOlderControllerSupport {

	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "queryOlderOut";
	}

}
