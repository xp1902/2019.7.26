package com.neusoft.web.impl;

public class ChakanHuogngServlet extends LaoControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "chakanHuogng";
	}

}