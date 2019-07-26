package com.neusoft.web.impl;

public class FindByIdOlderChufangServlet extends PresControllerSupport {

	@Override
	public String execute() throws Exception {
		this.savePageInstance();
		return "checkOlderChufang";
	}

}
