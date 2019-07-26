package com.neusoft.web.impl;

public class QueryOutsServlet extends OutsServlet {

	@Override
	public String execute() throws Exception {
		this.savePageDataForRows();
		return null;
	}

}
