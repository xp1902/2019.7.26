package com.neusoft.web.impl;

public class AddOlderChufangServlet extends PresControllerSupport {

	@Override
	public String execute() throws Exception {
		this.update("addOlderChufang", "���");
		return "addOlderChufang";
	}

}
