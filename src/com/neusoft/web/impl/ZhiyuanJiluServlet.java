package com.neusoft.web.impl;

public class ZhiyuanJiluServlet extends JiluConttrollerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "zhiyuanJilu";
	}

}
