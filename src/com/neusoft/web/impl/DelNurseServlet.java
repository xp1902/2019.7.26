package com.neusoft.web.impl;

public class DelNurseServlet extends NurseControllerSupport {

	@Override
	public String execute() throws Exception
	{
		this.update("batchDelete", "É¾³ý");
		this.savePageDataForDelete();
		return "queryEmp";
	}

}
