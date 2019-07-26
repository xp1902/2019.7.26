package com.neusoft.web.impl;

public class RuyuanServlet extends RuyuanControllerSupport {

	@Override
	public String execute() throws Exception {
		this.savePageInstance();
		return "ruzhu";
	}

}
