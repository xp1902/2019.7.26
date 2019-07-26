package com.neusoft.web.impl;

import com.neusoft.web.support.ControllerSupport;

public class ModifyHugongServlet extends Hugong1ControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.update("modifyHugong", "ÐÞ¸Ä");
		return "queryOneHugong";
	}
}