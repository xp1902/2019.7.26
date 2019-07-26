package com.neusoft.web.impl;

import com.neuedu.services.impl.Wbx001ServiceImpl;
import com.neusoft.web.support.ControllerSupport;

public class FindByIdBedServlet extends ControllerSupport {

	public FindByIdBedServlet() {
		this.setServices(new Wbx001ServiceImpl());
	}
	@Override
	public String execute() throws Exception {
		this.savePageInstance();
		return "modifyBed";
	}

}
