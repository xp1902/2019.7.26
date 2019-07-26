package com.neusoft.web.impl;

import com.neuedu.services.impl.Wbx010ServicesImpl;
import com.neusoft.web.support.ControllerSupport2;

public class AddWarehouseServlet extends ControllerSupport2 {

	public AddWarehouseServlet() {
		this.setServices(new Wbx010ServicesImpl());
	}
	@Override
	public String execute() throws Exception {
		this.savePageInstance2();
		return null;
	}

}
