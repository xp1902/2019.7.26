package com.neusoft.web.impl;

import com.neuedu.services.impl.Wbx003ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public class QueryAppointmentServlet extends ControllerSupport {

	public QueryAppointmentServlet() {
		this.setServices(new Wbx003ServicesImpl());
	}
	@Override
	public String execute() throws Exception {
		this.savePageDataForColumns();
		return "queryAppointment";
	}

}
