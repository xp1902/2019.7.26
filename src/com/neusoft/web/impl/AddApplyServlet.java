package com.neusoft.web.impl;

public class AddApplyServlet extends ApplyControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addApply", "����");
		return "queryElderA";
	}
}