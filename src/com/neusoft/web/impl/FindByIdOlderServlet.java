package com.neusoft.web.impl;

public class FindByIdOlderServlet extends OlderControllerSupport {

	@Override
	public String execute() throws Exception 
	{
		System.out.println("FindByIdOlderServlet");
		this.savePageInstance();
		System.out.println("FindByIdOlderServlet");
		return "addOlder";
	}

}
