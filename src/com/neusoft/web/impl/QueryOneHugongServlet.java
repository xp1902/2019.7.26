package com.neusoft.web.impl;

public final class QueryOneHugongServlet extends HugongControllerSupport {
	@Override
	public String execute() throws Exception {
		this.savePageInstance();
		return "queryOneHugong";
	}
}