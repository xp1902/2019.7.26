package com.neusoft.web.impl;

public class ModifyOlderHealthyServlet extends OlderHealthyControllerSupport {

	@Override
	public String execute() throws Exception
	{
		this.update("modifyOlderHealthy", "ÐÞ¸Ä");
		return "addOlderHealthy";
	}

}
