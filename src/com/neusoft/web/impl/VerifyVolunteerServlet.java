package com.neusoft.web.impl;

public class VerifyVolunteerServlet extends VolunteerServlet {

	@Override
	public String execute() throws Exception {
		this.update("verify", "���");
		return null;
	}

}
