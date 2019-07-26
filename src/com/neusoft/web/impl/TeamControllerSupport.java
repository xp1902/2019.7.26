package com.neusoft.web.impl;

import com.neusoft.services.impl.Ba01ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class TeamControllerSupport extends ControllerSupport
{
	public TeamControllerSupport() 
	{
		this.setServices(new Ba01ServicesImpl());
	}
}
