package com.neusoft.web.impl;

public class FindByIdJiashuServlet extends JiashuControllerSupport {

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "checkJiashu";
	}

}
