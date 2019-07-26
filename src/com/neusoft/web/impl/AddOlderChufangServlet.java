package com.neusoft.web.impl;

public class AddOlderChufangServlet extends PresControllerSupport {

	@Override
	public String execute() throws Exception {
		this.update("addOlderChufang", "Ìí¼Ó");
		return "addOlderChufang";
	}

}
