package com.neusoft.web.impl;

public class FindByIdVolServlet extends VolControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("pingjun", "Æ½¾ù");
		this.savePageInstance();
		return "volHome";
	}

}