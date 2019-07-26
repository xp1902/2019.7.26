package com.neusoft.web.impl;

public class ModifyJiashuServlet extends JiashuControllerSupport {

	@Override
	public String execute() throws Exception
	{
		this.update("modifyJiashu", "ÐÞ¸Ä");
		return "checkJiashu";
	}

}
