package com.neusoft.web.impl;

public class AddFangkeServlet extends FangkeControllerSupport {

	@Override
	public String execute() throws Exception 
	{
		this.update("addFangke", "���");
		return "queryVisit";
	}
	
}
