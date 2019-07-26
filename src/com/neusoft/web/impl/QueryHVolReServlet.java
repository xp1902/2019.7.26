package com.neusoft.web.impl;

public class QueryHVolReServlet extends VolReControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageDataForH();
		return "queryHVolRe";
	}

}
