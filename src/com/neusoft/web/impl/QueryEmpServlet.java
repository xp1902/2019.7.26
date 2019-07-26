package com.neusoft.web.impl;

import com.neuedu.services.impl.Wbx002ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public class QueryEmpServlet extends ControllerSupport {

	public QueryEmpServlet() {
		this.setServices(new Wbx002ServicesImpl());
	}
	
	@Override
	public String execute() throws Exception {
		this.savePageDataForRows();
		return "queryEmp";
	}

}
