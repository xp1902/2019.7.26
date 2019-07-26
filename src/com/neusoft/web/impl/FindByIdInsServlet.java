package com.neusoft.web.impl;

import com.neuedu.services.impl.Wbx011ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public class FindByIdInsServlet extends ControllerSupport {

	public FindByIdInsServlet() {
		this.setServices(new Wbx011ServicesImpl());
	}
	@Override
	public String execute() throws Exception {
		this.savePageInstance();
		return "addIn";
	}

}
