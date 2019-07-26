package com.neusoft.web.impl;

import com.neusoft.services.impl.As01ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public class FindByIdOutsServlet extends ControllerSupport {

	public FindByIdOutsServlet() {
		this.setServices(new As01ServicesImpl());
	}
	@Override
	public String execute() throws Exception {
		this.savePageData();
		return "findByIdOuts";
	}

}
