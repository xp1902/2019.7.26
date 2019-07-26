package com.neusoft.web.impl;

public class YuyueVolServlet extends VolControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("yuyueVol", "ԤԼ");
		this.savePageInstance();
		return "volHome";
	}

}
