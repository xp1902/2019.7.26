package com.neusoft.web.impl;

import com.neuedu.services.impl.Wbx011ServicesImpl;
import com.neusoft.web.support.ControllerSupport2;

public class AddInsServlet extends ControllerSupport2 {

	public AddInsServlet() {
		this.setServices(new Wbx011ServicesImpl());
	}
	
	@Override
	public String execute() throws Exception {
		this.update("addIn", "ÃÌº”»Î’À");
		return null;
	}

}
