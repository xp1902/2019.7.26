package com.neusoft.web.impl;

public class ModifyHVolReServlet extends VolReControllerSupport
{
	@Override
	public String execute() throws Exception
	{
		this.update("modify", "����");
		this.savePageInstance();
		return "findByIdVolRe";
	}
}