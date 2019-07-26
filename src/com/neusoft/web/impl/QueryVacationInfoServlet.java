package com.neusoft.web.impl;

import com.neuedu.services.impl.Wbx005ServicesImpl;
import com.neusoft.web.support.ControllerSupport2;

public class QueryVacationInfoServlet extends ControllerSupport2 {
	/**
	 * 查看请假简略信息
	 */
	public QueryVacationInfoServlet() {
		this.setServices(new Wbx005ServicesImpl());
	}
	@Override
	public String execute() throws Exception {
		this.savePageInstance();
		return null;
	}

}
