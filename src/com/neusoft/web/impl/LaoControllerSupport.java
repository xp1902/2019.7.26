package com.neusoft.web.impl;

import com.neusoft.services.impl.OldServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class LaoControllerSupport extends ControllerSupport
{
	public LaoControllerSupport() 
	{
		this.setServices(new OldServicesImpl());
	}
}
