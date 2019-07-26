package com.neusoft.web.impl;

public class RejectVolunteerServlet extends VolunteerServlet {

	@Override
	public String execute() throws Exception {
		this.update("reject", "¾Ü");
		return null;
	}

}
