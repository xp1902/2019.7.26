package com.neusoft.web.impl;

public class ZhiyuanTuanduiServlet extends TeamControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "zhiyuanTuandui";
	}

}
