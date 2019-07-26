package com.neusoft.web.impl;

public class AddFankuiJiashuServlet extends FankuiJiashuControllerSupport {

	@Override
	public String execute() throws Exception 
	{
		this.update("addFankui", "Ìí¼Ó");
		return "fankuiJiashu";
	}

}
