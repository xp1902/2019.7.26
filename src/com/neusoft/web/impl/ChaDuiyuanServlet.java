package com.neusoft.web.impl;

public final class ChaDuiyuanServlet extends DuiControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "chaDuiyuan";
	}
}
