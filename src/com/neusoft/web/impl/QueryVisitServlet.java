package com.neusoft.web.impl;

import com.neuedu.services.impl.Wbx009ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public class QueryVisitServlet extends ControllerSupport {

	public QueryVisitServlet() {
		this.setServices(new Wbx009ServicesImpl());
	}
	@Override
	public String execute() throws Exception {
		this.savePageDataForRows();
		return "queryVisit";
	}

}
