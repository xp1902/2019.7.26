package com.neusoft.web.impl;

import com.neuedu.services.impl.Wbx006ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public class QueryVacationEmpServlet extends ControllerSupport {
	public QueryVacationEmpServlet() {
		// TODO Auto-generated constructor stub
		this.setServices(new Wbx006ServicesImpl());
	}
	@Override
	public String execute() throws Exception {
		this.savePageDataForRows();
		return "queryVacationEmp";
	}

}
