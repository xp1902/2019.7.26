package com.neusoft.web.impl;

public class BddVolServlet extends VolControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("volHome", "����");
		return "userLogin";
	}

}
