package com.neusoft.web.impl;

public class QueryPresServlet extends PresControllerSupport {

	@Override
	public String execute() throws Exception {
		this.savePageData();
		return "queryPres";
	}
}
