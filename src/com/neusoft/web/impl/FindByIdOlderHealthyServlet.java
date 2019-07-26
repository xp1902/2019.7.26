package com.neusoft.web.impl;

public class FindByIdOlderHealthyServlet extends OlderHealthyControllerSupport {

	@Override
	public String execute() throws Exception 
	{
		System.out.println("OlderHealthyServlet");
		this.savePageInstance();
		System.out.println("OlderHealthyServlet");
		return "addOlderHealthy";
	}

}
