package com.neusoft.web.impl;

public class GaiYuyueServlet extends JiluConttrollerSupport  
{

	@Override
	public String execute() throws Exception 
	{
		this.update("gaiYuyue", "�޸�");
		this.savePageData();
		return "zhiyuanJilu";
	}

}