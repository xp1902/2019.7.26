package com.neusoft.web.impl;

import com.neuedu.services.impl.Wbx003ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public class UpdateTheOldServlet extends ControllerSupport {
	public UpdateTheOldServlet() {
		this.setServices(new Wbx003ServicesImpl());
	}
	@Override
	public String execute() throws Exception {
		this.savePageInstance();
		return "updateTheOld";
	}

}
