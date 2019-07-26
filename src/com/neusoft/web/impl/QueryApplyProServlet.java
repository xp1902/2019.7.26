package com.neusoft.web.impl;

public class QueryApplyProServlet extends ApplyProControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "queryApplyPro";
	}
}