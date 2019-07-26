package com.neusoft.web.impl;

public class QueryHApplyServlet extends ApplyControllerSupport
{
	@Override
	public String execute() throws Exception
	{
		this.savePageData();
		return "queryHApply";
	}
}