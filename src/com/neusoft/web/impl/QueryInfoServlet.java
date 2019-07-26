package com.neusoft.web.impl;

import com.neuedu.services.impl.Wbx001ServiceImpl;
import com.neusoft.web.support.ControllerSupport2;

public class QueryInfoServlet extends ControllerSupport2 {
	public QueryInfoServlet() {
		this.setServices(new Wbx001ServiceImpl());
	}
	@Override
	public String execute() throws Exception {
		this.savePageInstance();
		return null;
	}

}
