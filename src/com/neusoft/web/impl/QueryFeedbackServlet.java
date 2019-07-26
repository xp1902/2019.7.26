package com.neusoft.web.impl;

import com.neuedu.services.impl.Wbx007ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public class QueryFeedbackServlet extends ControllerSupport {

	public QueryFeedbackServlet() {
		this.setServices(new Wbx007ServicesImpl());
	}
	@Override
	public String execute() throws Exception {
		this.savePageDataForRows();
		return "queryFeedback";
	}

}
