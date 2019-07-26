package com.neusoft.web.impl;

import com.neuedu.services.impl.Wbx006ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public class FindByIdVacationEmpServlet extends ControllerSupport {

	public FindByIdVacationEmpServlet() {
		// TODO Auto-generated constructor stub
		this.setServices(new Wbx006ServicesImpl());
	}
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		this.savePageInstance();
		return "modifyVacationEmp";
	}

}
