package com.neusoft.web.impl;

import com.neuedu.services.impl.Wbx009ServicesImpl;
import com.neusoft.web.support.ControllerSupport2;

public class VerifyVisitServlet extends ControllerSupport2 {

	public VerifyVisitServlet() {
		this.setServices(new Wbx009ServicesImpl());
	}
	@Override
	public String execute() throws Exception {
		this.update("verifyVisit", "ÉóºË·Ã¿Í");
		return null;
	}

}
