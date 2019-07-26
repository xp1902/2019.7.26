package com.neusoft.web.impl;

import com.neuedu.services.impl.Wbx002ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public class AddEmpServlet extends ControllerSupport {
	public AddEmpServlet() {
		this.setServices(new Wbx002ServicesImpl());
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		this.update("addEmp", "Ìí¼Ó");
		return "addEmp";
	}

}
