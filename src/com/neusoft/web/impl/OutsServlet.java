package com.neusoft.web.impl;

import com.neuedu.services.impl.Wbx012ServicesImpl;
import com.neusoft.web.support.ControllerSupport2;

public abstract class OutsServlet extends ControllerSupport2 {

	public OutsServlet() {
		this.setServices(new Wbx012ServicesImpl());
	}
}
