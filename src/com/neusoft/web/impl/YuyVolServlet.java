package com.neusoft.web.impl;

public class YuyVolServlet extends AaaControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "yuyueVol";
	}

}