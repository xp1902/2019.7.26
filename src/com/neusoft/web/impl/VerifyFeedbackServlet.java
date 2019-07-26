package com.neusoft.web.impl;

import com.neuedu.services.impl.Wbx007ServicesImpl;
import com.neusoft.web.support.ControllerSupport2;

public class VerifyFeedbackServlet extends ControllerSupport2 {

	public VerifyFeedbackServlet() {
		this.setServices(new Wbx007ServicesImpl());
	}
	@Override
	public String execute() throws Exception {
		this.update("verifyFeedback", "¥¶¿Ì");
		return null;
	}

}
