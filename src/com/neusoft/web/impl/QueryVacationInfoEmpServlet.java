package com.neusoft.web.impl;

import com.neuedu.services.impl.Wbx006ServicesImpl;
import com.neusoft.web.support.ControllerSupport2;

public class QueryVacationInfoEmpServlet extends ControllerSupport2 {
	public QueryVacationInfoEmpServlet() {
		this.setServices(new Wbx006ServicesImpl());
	}

	@Override
	public String execute() throws Exception {
		this.savePageInstance();
		return null;
	}

}
