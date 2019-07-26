package com.neusoft.web.impl;

import com.neuedu.services.impl.Wbx003ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public class QueryTheOldServlet extends ControllerSupport {

	public QueryTheOldServlet() {
		this.setServices(new Wbx003ServicesImpl());
	}
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		this.savePageDataForRows();
		return "queryTheOld";
	}
}
