package com.neusoft.web.impl;

public class DelEmpServlet extends EmpControllerSupport {

	@Override
	public String execute() throws Exception
	{
		this.update("batchDelete", "ɾ��");
		this.savePageDataForDelete();
		return "queryEmp";
	}
}
