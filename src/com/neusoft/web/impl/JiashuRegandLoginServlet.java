package com.neusoft.web.impl;

public class JiashuRegandLoginServlet extends JiashuControllerSupport 
{ 
	@Override
	public String execute() throws Exception 
	{
		this.update("addJiashu", "Ìí¼Ó");
		return "userLogin";
	}
}
