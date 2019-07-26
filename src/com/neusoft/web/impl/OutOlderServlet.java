package com.neusoft.web.impl;

public class OutOlderServlet extends RuyuanControllerSupport {

	@Override
	public String execute() throws Exception {
		this.savePageInstance();
		return "outOlder";
	}

}
