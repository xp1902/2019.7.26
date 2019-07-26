package com.neusoft.web.impl;

public class FindbyidNurseServlet extends HugongControllerSupport {

	@Override
	public String execute() throws Exception {
		this.savePageInstance();
		return "findbyidHugong";
	}

}
