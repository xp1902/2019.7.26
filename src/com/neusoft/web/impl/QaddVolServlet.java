package com.neusoft.web.impl;

public class QaddVolServlet extends VolControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("pingjun", "ƽ��");
		this.savePageInstance();
		return "volHome";
	}

}