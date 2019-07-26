package com.neusoft.web.impl;

import com.neuedu.services.impl.Wbx001ServiceImpl;
import com.neusoft.web.support.ControllerSupport;

public class QueryBedServlet extends ControllerSupport {

	public QueryBedServlet() {
		this.setServices(new Wbx001ServiceImpl());
	}
	@Override
	public String execute() throws Exception {
		this.savePageDataForRows();
		this.savePageDataForColumns();
		return "queryBed";
	}

}