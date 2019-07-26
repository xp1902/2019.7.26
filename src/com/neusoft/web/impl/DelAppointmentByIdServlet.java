package com.neusoft.web.impl;

import com.neuedu.services.impl.Wbx003ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public class DelAppointmentByIdServlet extends ControllerSupport {
	public DelAppointmentByIdServlet() {
		this.setServices(new Wbx003ServicesImpl());
	}
	@Override
	public String execute() throws Exception {
		this.update("delAppointmentById", "ɾ��");
		this.savePageDataForDelete();
		return "queryAppointment";
	}
	

}
