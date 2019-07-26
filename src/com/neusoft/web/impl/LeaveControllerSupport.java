package com.neusoft.web.impl;

import com.neusoft.services.impl.Cx01ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class LeaveControllerSupport extends ControllerSupport
{
	public LeaveControllerSupport() 
	{
		this.setServices(new Cx01ServicesImpl());
	}
}