package com.neusoft.web.impl;

import com.neuedu.services.impl.Wbx010ServicesImpl;
import com.neusoft.web.support.ControllerSupport2;

public class DelWarehouseServlet extends ControllerSupport2 {

	public DelWarehouseServlet() {
		this.setServices(new Wbx010ServicesImpl());
	}
	@Override
	public String execute() throws Exception {
		this.update("delItem", "É¾³ý");
		return null;
	}

}
