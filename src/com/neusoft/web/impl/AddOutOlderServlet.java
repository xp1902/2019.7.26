package com.neusoft.web.impl;

public class AddOutOlderServlet extends OutOlderControllerSupport {

	@Override
	public String execute() throws Exception {
		this.update("addOutOlder", "�ύ");
		return "outOlder";
	}

}
