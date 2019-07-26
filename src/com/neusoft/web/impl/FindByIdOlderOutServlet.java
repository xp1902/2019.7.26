package com.neusoft.web.impl;

public class FindByIdOlderOutServlet extends OutOlderControllerSupport {

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "checkoutOlder";
	}

}
