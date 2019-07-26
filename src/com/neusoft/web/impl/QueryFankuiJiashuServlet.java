package com.neusoft.web.impl;

public class QueryFankuiJiashuServlet extends FankuiJiashuControllerSupport {

	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "queryFankuiJiashu";
	}

}
