package com.neusoft.web.impl;

public class ApplyForElderServlet extends ArticleControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "applyForElder";
	}
}