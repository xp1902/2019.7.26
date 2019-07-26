package com.neusoft.web.impl;

public class FindByIdHugongServlet extends Hugong1ControllerSupport {

	@Override
	public String execute() throws Exception {
		this.savePageInstance();
		return "checkHugong";
	}

}
