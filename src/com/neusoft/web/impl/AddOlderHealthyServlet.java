package com.neusoft.web.impl;

public class AddOlderHealthyServlet extends OlderHealthyControllerSupport {

	@Override
	public String execute() throws Exception {
		this.update("addOlderHealthy", "Ìí¼Ó");
		this.savePageInstance();
		return "addOlderHealthy";
	}

}
