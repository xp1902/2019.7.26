package com.neusoft.web.impl;

import com.neuedu.services.impl.Wbx006ServicesImpl;
import com.neusoft.web.support.ControllerSupport2;

public class ModifyVacationEmpServlet extends ControllerSupport2 {

	public ModifyVacationEmpServlet() {
		// TODO Auto-generated constructor stub
		this.setServices(new Wbx006ServicesImpl());
	}
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		this.update("modifyVacation", "ÐÞ¸Ä");
		return "modifyVacationEmp";
	}

}
