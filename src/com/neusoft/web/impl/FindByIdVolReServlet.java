package com.neusoft.web.impl;

public class FindByIdVolReServlet extends VolReControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.savePageInstance();
		return "findByIdVolRe";
	}
}