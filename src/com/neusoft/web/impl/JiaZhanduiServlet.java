package com.neusoft.web.impl;

public class JiaZhanduiServlet extends TeamControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("jiaTeam", "���Ŷ�");
		this.savePageInstance();
		return "zhiyuanTuandui";
	}

}
