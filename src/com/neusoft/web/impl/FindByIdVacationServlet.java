package com.neusoft.web.impl;

import com.neuedu.services.impl.Wbx005ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public class FindByIdVacationServlet extends ControllerSupport{
	public FindByIdVacationServlet() {
		// TODO Auto-generated constructor stub
		this.setServices(new Wbx005ServicesImpl());
	}
	@Override
	public String execute() throws Exception {
		this.savePageInstance();
		return "modifyVacation";
	}

}
