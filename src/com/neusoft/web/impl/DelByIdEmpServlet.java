package com.neusoft.web.impl;

import com.neuedu.services.impl.Wbx002ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public class DelByIdEmpServlet extends ControllerSupport 
{
	public DelByIdEmpServlet() {
		this.setServices(new Wbx002ServicesImpl());
	}

	@Override
	public String execute() throws Exception 
	{
		this.update("deleteById", "É¾³ý");
		this.savePageDataForDelete2();
		//this.savePageData();
		return "queryEmp";
	}

}
