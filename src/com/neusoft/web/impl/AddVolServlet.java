package com.neusoft.web.impl;

public class AddVolServlet extends VolControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("volHome", "���");
		return "addVol";
	}

}
