package com.neusoft.web.impl;

public class ZhiyXijieServlet extends JiluConttrollerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "zhiyXijie";
	}

}