package com.neusoft.web.impl;

import com.neuedu.services.impl.Wbx010ServicesImpl;
import com.neusoft.web.support.ControllerSupport2;

public class QueryWarehouseServlet extends ControllerSupport2 {

	public QueryWarehouseServlet() {
		this.setServices(new Wbx010ServicesImpl());
	}
	@Override
	public String execute() throws Exception {
		this.savePageDataForRows();
		return null;
	}

}
