package com.neusoft.web.impl;

import com.neusoft.web.support.ControllerSupport;

public class ModifyVolServlet extends VolControllerSupport {

	@Override
	public String execute() throws Exception
	{
		this.update("modifyVol", "ÐÞ¸Ä");
		this.savePageInstance();
		return "volHome";
	}

}
