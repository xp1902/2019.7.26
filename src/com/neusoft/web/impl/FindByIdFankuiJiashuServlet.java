package com.neusoft.web.impl;

public class FindByIdFankuiJiashuServlet extends FankuiJiashuControllerSupport {

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "checkFankuiJiashu";
	}

}
