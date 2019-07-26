package com.neusoft.web.impl;

public class QueryChufangServlet extends QueryPresServlet {
	
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "queryOlderChufang";
	}

}
