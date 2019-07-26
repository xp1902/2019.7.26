package com.neusoft.web.impl;

import com.neuedu.services.impl.Wbx010ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public class FindByIdWarehouseServlet extends ControllerSupport {

	public FindByIdWarehouseServlet() {
		this.setServices(new Wbx010ServicesImpl());
	}
	@Override
	public String execute() throws Exception {
		this.savePageInstance();
		return "modifyItem";
	}

}
