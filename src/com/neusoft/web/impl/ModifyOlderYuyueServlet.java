package com.neusoft.web.impl;

public class ModifyOlderYuyueServlet extends OlderControllerSupport {

	@Override
	public String execute() throws Exception
	{
		this.update("modifyOlder", "�޸�");
		return "addOlder";
	}

}
