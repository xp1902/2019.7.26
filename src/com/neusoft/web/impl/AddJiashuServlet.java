package com.neusoft.web.impl;

public class AddJiashuServlet extends JiashuControllerSupport 
{ 

	@Override
	public String execute() throws Exception 
	{
		this.update("addJiashu", "Ìí¼Ó");
		return "addJiashu";
	}

}
