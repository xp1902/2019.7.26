package com.neusoft.web.impl;

public class AddOlderHealthyServlet extends OlderHealthyControllerSupport {

	@Override
	public String execute() throws Exception {
		this.update("addOlderHealthy", "���");
		this.savePageInstance();
		return "addOlderHealthy";
	}

}
