package com.neusoft.web.impl;

public class FindByIdHVolServlet extends VolControllerSupport
{
	@Override
	public String execute() throws Exception
	{
		this.savePageInstance();
		return "findByIdVol";
	}
}