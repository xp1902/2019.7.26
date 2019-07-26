package com.neusoft.web.impl;

import com.neuedu.services.impl.Wbx003ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public class ModifyAppointment2Servlet extends ControllerSupport {

	public ModifyAppointment2Servlet() {
		this.setServices(new Wbx003ServicesImpl());
	}
	@Override
	public String execute() throws Exception {
		this.update("modifyAppointment2", "พÜสี");
		return "queryAppointment";
	}

}
