package com.neusoft.web.impl;

import com.neuedu.services.impl.Wbx006ServicesImpl;
import com.neusoft.web.support.ControllerSupport2;

public class VerifyVacationEmpServlet extends ControllerSupport2 {

	public VerifyVacationEmpServlet() {
		this.setServices(new Wbx006ServicesImpl());
	}
	@Override
	public String execute() throws Exception {
		this.update("verifyVacation", "…Û∫À");
		return null;
	}

}
