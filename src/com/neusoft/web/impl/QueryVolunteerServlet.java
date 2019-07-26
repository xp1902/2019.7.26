package com.neusoft.web.impl;

public class QueryVolunteerServlet extends VolunteerServlet {
	@Override
	public String execute() throws Exception {
		this.savePageDataForRows();
		return null;
	}
}