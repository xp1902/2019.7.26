package com.neusoft.web.impl;

public class VerifyOutsServlet extends OutsServlet {

	@Override
	public String execute() throws Exception {
		this.update("verifyOuts", "���֧��");
		return null;
	}
	
}
