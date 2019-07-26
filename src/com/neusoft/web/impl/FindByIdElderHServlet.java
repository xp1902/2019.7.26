package com.neusoft.web.impl;

public class FindByIdElderHServlet extends ElderControllerSupport {
	@Override
	public String execute() throws Exception {
		this.savePageInstance();
		return "findByIdElderH";
	}
}