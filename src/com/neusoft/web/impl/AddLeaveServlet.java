package com.neusoft.web.impl;

public class AddLeaveServlet extends LeaveControllerSupport
{
	@Override
	public String execute() throws Exception
	{
		this.update("addLeave", "�����ύ");
		return "addLeave";
	}
}