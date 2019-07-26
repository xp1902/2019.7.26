package com.neusoft.web.impl;

public class ModifyOlderServlet extends OlderControllerSupport {

	@Override
	public String execute() throws Exception
	{
		this.update("modifyOlder", "ÐÞ¸Ä");
		return "checkOlder";
	}

}
