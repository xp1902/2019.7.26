package com.neusoft.web.impl;

public class DelNurseServlet extends NurseControllerSupport {

	@Override
	public String execute() throws Exception
	{
		this.update("batchDelete", "ɾ��");
		this.savePageDataForDelete();
		return "queryEmp";
	}

}
