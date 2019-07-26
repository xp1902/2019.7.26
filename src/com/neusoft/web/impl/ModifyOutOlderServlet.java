package com.neusoft.web.impl;

public class ModifyOutOlderServlet extends OutOlderControllerSupport {

	@Override
	public String execute() throws Exception
	{
		this.update("modifyOutOlder", "ÐÞ¸Ä");
		return "checkoutOlder";
	}

}
