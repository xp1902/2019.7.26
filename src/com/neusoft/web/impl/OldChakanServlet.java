package com.neusoft.web.impl;

public class OldChakanServlet extends LaoControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "chakan";
	}

}