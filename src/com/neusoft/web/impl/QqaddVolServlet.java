package com.neusoft.web.impl;

public class QqaddVolServlet extends VolControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "addVol";
	}

}