package com.neusoft.web.impl;

import com.neuedu.services.impl.Wbx005ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public class QueryVacationServlet extends ControllerSupport{
	/**
	 * 按条件搜索入住人请假信息
	 */
	public QueryVacationServlet() {
		// TODO Auto-generated constructor stub
		this.setServices(new Wbx005ServicesImpl());
	}
	@Override
	public String execute() throws Exception {
		this.savePageDataForRows();
		return "queryVacation";
	}

}
