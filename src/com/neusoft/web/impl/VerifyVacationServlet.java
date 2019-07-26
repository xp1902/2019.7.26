package com.neusoft.web.impl;

import com.neuedu.services.impl.Wbx005ServicesImpl;
import com.neusoft.web.support.ControllerSupport2;

public class VerifyVacationServlet extends ControllerSupport2 {
	public VerifyVacationServlet() {
		this.setServices(new Wbx005ServicesImpl());
	}

	@Override
	public String execute() throws Exception {
		this.update("verifyVacation", "…Û∫À");
		return null;
	}

}
