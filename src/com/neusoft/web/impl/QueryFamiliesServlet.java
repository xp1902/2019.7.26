package com.neusoft.web.impl;

import com.neuedu.services.impl.Wbx004ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public class QueryFamiliesServlet extends ControllerSupport {
	public QueryFamiliesServlet() {
		this.setServices(new Wbx004ServicesImpl());
	}

	@Override
	public String execute() throws Exception {
		this.savePageDataForRows();
		return "queryFamilies";
	}

}
