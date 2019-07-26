package com.neusoft.web.impl;

import com.neuedu.services.impl.Wbx003ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public class ModifyAppointmentServlet extends ControllerSupport {

	public ModifyAppointmentServlet() {
		this.setServices(new Wbx003ServicesImpl());
	}
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		this.update("modifyAppointment", "×ªÈë×¡");
		return null;
	}

}
